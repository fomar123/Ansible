provider "aws" {
    region = "us-east-1"
}

variable vpc_cidr_block {}
variable subnet_1_cidr_block {}
variable avail_zone {}
variable env_prefix {}
variable my_ip {}
variable instance_type {}
variable public_key_location {}
variable ssh_key_private {}


resource "aws_vpc" "myapp-vpc" {
    cidr_block =  var.vpc_cidr_block
    tags = {
        Name = "${var.env_prefix}-vpc-1"
    }
}

resource "aws_subnet" "myapp-subnet-1" {
  vpc_id = aws_vpc.myapp-vpc.id
  cidr_block = var.subnet_1_cidr_block
  availability_zone = var.avail_zone
  tags = {
      Name = "${var.env_prefix}-subnet-1"
  }
}


resource "aws_internet_gateway" "myapp-igw" {
	vpc_id = aws_vpc.myapp-vpc.id
    tags = {
     Name = "${var.env_prefix}-igw"
   }
}

resource "aws_default_route_table" "main-rtb" {
    default_route_table_id = aws_vpc.myapp-vpc.default_route_table_id

    route {
     cidr_block = "0.0.0.0/0"
     gateway_id = aws_internet_gateway.myapp-igw.id
   }
   tags = {
        Name: "${var.env_prefix}-main-rtb"
   }
}

resource "aws_security_group" "myapp-sg" {

   vpc_id = aws_vpc.myapp-vpc.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.my_ip]
  }

  ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks     = ["0.0.0.0/0"]
    prefix_list_ids = []
  }

  tags = {
    Name = "${var.env_prefix}-default_sg-sg"
  }
}

data "aws_ami" "amazon-linux-image" {
    most_recent = true
    owners = ["amazon"]

    filter {
        name = "name"
        values = ["amzn2-ami-hvm-*-x86_64-gp2"]
    }

    filter {
        name = "virtualization-type"
        values =["hvm"]
    }
}

output "ami_id" {
    value = data.aws_ami.amazon-linux-image.id
}

output "ec2_public_ip" {
    value = aws_instance.myapp-server.public_ip
}

resource "aws_key_pair" "ssh-key"{
    key_name = "server-key"
    public_key = file(var.public_key_location)
}
  

resource "aws_instance" "myapp-server" {
  ami                         = data.aws_ami.amazon-linux-image.id
  instance_type               = var.instance_type
  key_name                    = aws_key_pair.ssh-key.key_name
  associate_public_ip_address = true
  subnet_id                   = aws_subnet.myapp-subnet-1.id
  vpc_security_group_ids      = [aws_security_group.myapp-sg.id]
  availability_zone			      = var.avail_zone

    user_data = file("entry-script.sh")

  tags = {
    Name = "${var.env_prefix}-server"
  }
  
  
  
}
resource "null_resource" "configure_server"{
  triggers = {
    trigger = aws_instance.myapp-server.public_ip
  }
  provisioner "local-exec" {
    working_dir = "/Users/farahomar/ansible-2"
    command = "ansible-playbook --inventory ${aws_instance.myapp-server.public_ip}, --private-key ${var.ssh_key_private} --user ec2-user deploy-docker-new-user.yaml"
  } 
}
