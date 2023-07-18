##### 1.Ansible Inventory
Create Anisble inventory file:

Connect anisble to remote servers on digital ocean:

      ansible all –i hosts(name of file) – m ping
               
 Connect to droplet server:
       
               ansible droplet -i  hosts -m ping

##### 2.Connect to server using variables:
- Modify hosts file:
   
![image](https://github.com/fomar123/Ansible/assets/90075757/93c16c70-32f5-47ae-9b2a-81e82ea0af66)


Connect to droplet server:

     ansible droplet -i  hosts -m ping


##### 3.Managing host keys:

   Add new server to known_hosts:
   
       ssh-keyscan -H 206.189.18.153 >> ~/.ssh/known_hosts


##### 4,Disabled Host Key Checking:	
1.	Create ansible configuration folder and set host key checking to false
2.	Vim ~/.ansible.config

![image](https://github.com/fomar123/Ansible/assets/90075757/1116433a-3e92-4664-8b29-c54c4ef0d24e)


##### 5.Introduction to playbooks:
Install nginx on playbook

Execute ansible playbook:
    Ansible-playbook -i hosts my-playbook.yaml
To see if nginx is installed in remote server:
      ps aux | grep nginx

##### 6.Project: Automate Node App Deployment 
##### Create a droplet in digital ocean

##### Adjusted hosts file

##### Install node and npm
   
##### Copy and unpack  nodejs tar file 

##### Deploy nodejs app

##### Install dependencies

##### Execute command: 

         Ansible-playbook -i hosts deploy-node.yaml
##### Ensure app is running using shell 

           ps aux | grep node

![image](https://github.com/fomar123/Ansible/assets/90075757/f74915fa-b404-40a8-9d2f-b490effdec45)

# Project: Automate Node App Deployment Part 1

##### Created  a droplet in digital ocean

##### Adjusted hosts file

##### Installed node and npm

##### Copied and unpacked nodejs tar file

##### Deplpyed nodejs app

##### Installed dependencies 

##### Execute command:

       Ansible-playbook -i hosts deploy-node.yaml

##### Ensure app is running using shelled:

      ps aux | grep node 

Results:

<img width="452" alt="image" src="https://github.com/fomar123/Ansible/assets/90075757/bbba90b8-239f-48f5-b1a7-976c851f2d98">

Project: Deploy Nodejs with new user 

##### Created  new a new user:
•	Change destination of nodejs file to new user 

•	Set user with desired privileges using become_user

•	Used the new user to deploy nodejs

<img width="452" alt="image" src="https://github.com/fomar123/Ansible/assets/90075757/9ff8b57f-ed4a-40fa-875d-5b7e36cd02be">



# Project: Automate Nexus Deployment 

##### Created DigitalOcean Droplet

##### Changed IP address in  hosts file

##### Installed java and net-tools in playbook 

##### Downloaded and unpacked Nexus installer

##### Execute playbook:

      ansible-playbook -i hosts deploy-nexus.yaml

##### ssh in to server to see if java and nexus was installed: 

          ssh root@”ip-address"

#####  ls /opt/ - to see if nexus was installed
<img width="452" alt="image" src="https://github.com/fomar123/Ansible/assets/90075757/7f5d5837-68c5-4920-b727-7a3984d6739c">



##### Java –version: To check which Java version is installed

##### Netstat --version: To check which Netstat version is installed

##### Untard nexus installer

##### Debugged to get complete name of the file
<img width="452" alt="image" src="https://github.com/fomar123/Ansible/assets/90075757/470d0a10-e7de-4d4f-8749-2ba6d233adfc">

##### Downloaded nexus module from the untar nexus installer module
<img width="401" alt="image" src="https://github.com/fomar123/Ansible/assets/90075757/9d4e1e33-0582-47e5-afaf-fea13ea29bbc">

##### Note: Remote absolute path where the file should be copied to

##### Rename nexus foler , first you need to find the folder 

          debug: msg={{find_result}}
<img width="283" alt="image" src="https://github.com/fomar123/Ansible/assets/90075757/d5de452a-a96d-4bd4-a153-7698bfb208f7">

##### Rename nexus folder
<img width="349" alt="image" src="https://github.com/fomar123/Ansible/assets/90075757/7328dcc8-2cdf-4f85-98c9-5f5a42683779">

##### Result:
<img width="452" alt="image" src="https://github.com/fomar123/Ansible/assets/90075757/978b7865-b774-400c-a93b-dc997b339c8b">

##### Use stat module to see if file exists
<img width="452" alt="image" src="https://github.com/fomar123/Ansible/assets/90075757/b51339b4-641b-4d22-8462-2ebe1a06ad73">


##### Result:
<img width="264" alt="image" src="https://github.com/fomar123/Ansible/assets/90075757/db089484-7f3e-41c6-a743-a14fb6f4090a">


##### Use Conditional to execute folder only if  doesn’t exist
<img width="495" alt="image" src="https://github.com/fomar123/Ansible/assets/90075757/b3af76d8-b2a1-49a7-a07f-8352f6323312">

##### Result:
<img width="296" alt="image" src="https://github.com/fomar123/Ansible/assets/90075757/b4b7b7b9-f170-4b55-a39b-b184cbd20e25">

# Project: Automate Nexus Deployment Part 2

##### Created nexus user to own nexus folders

##### Results:
    
         ls -l /opt
<img width="452" alt="image" src="https://github.com/fomar123/Ansible/assets/90075757/afe84fa3-607f-4496-b3cf-c13dffcafd5d">
<img width="452" alt="image" src="https://github.com/fomar123/Ansible/assets/90075757/52b358c7-ab0f-4e30-b33d-bee2fa12a008">

##### Start nexus with nexus user

##### Result: 

      vim /opt/nexus/bin/nexus.rc
<img width="308" alt="image" src="https://github.com/fomar123/Ansible/assets/90075757/4f327e07-40a4-44dc-b12a-ede122cbac20">

##### Verify nexus running

Results:
![image](https://github.com/fomar123/Ansible/assets/90075757/fe078e5f-536d-4045-b40e-5ff40c127d19)



# Project: Ansible & Docker 

##### Created EC2 Instance with Terraform

##### Adjusted hosts inventory file

##### Update IP address of Ec2 instance

##### Installed python3 and docker:

•	Use root user with become: yes

•	Configure ansible interpreter to python3

<img width="452" alt="image" src="https://github.com/fomar123/Ansible/assets/90075757/36dc8049-d962-4c7a-96e0-2d621a73d1fe">

##### Installed docker-compose

•	Use “lookup” plugin to allow ansible access to docker-compose

•	To install you need to be a root user , use become: yes

##### Started docker daemon


#####  Added ec2-user to docker group

•	Ec2 user has to be in docker group to execute docker commands

•	Pull redis image 

##### Results:
<img width="452" alt="image" src="https://github.com/fomar123/Ansible/assets/90075757/d54bbc04-0aec-41fa-8ec9-7a863a15274a">

##### Installed docker python module

•	You need python module installed on remote to pull redis image

•	Added task to install docker python module using pip

#####  Test docker pull

##### Result:
<img width="452" alt="image" src="https://github.com/fomar123/Ansible/assets/90075757/3ef7251c-8713-41b2-befb-664f0b209aec">

##### Started docker containers:

•	Copied docker compose file to ec2 server

•	Fetched image from private repository in docker hub, made docker login module so you can pull the image

•	Used variable prompt for docker hub password

•	Started container from docker-compose and provided location of docker-compose

##### Executed Playbook on new server

##### Created new user and adjusted plays to make the playbook re-usable


# Project: Ansible Integration in Terraform

##### Adjusted Terraform configuration file to execute ansible playbook

•	Added local provision in terraform configuration file because executing ansible commands locally 

•	Changed hosts to “all”

##### Created new Ansible Playbook for Terraform integration

##### Waited for ssh connection:

• Anisble needs to check first before ec2 is ready

• Avoid timing issue , add a play to check if the server is accessible

• Use module wait_for: this used to pause your playbook execution and to wait for many different things or conditions before continuing with the execution

##### Used null_resource in Terraform configuration 

• Null resource implements a standard resource lifecycle but takes no further action

• Add triggers (maps of string) attribute tells terraform  when to run  null resource. (optional)



# Dyamic  inventory

Dynamic inventory is an ansible plugin that makes an API call to AWS to get the instance information in the run time. It gives you the ec2 instance details dynamically to manage the AWS infrastructure.

##### Terraform - Created EC2 Instances: 
• Installed python boto3 and botocore


##### Written plugin configuration for aws_ec2

• Enable aws_ec2 plugin

• Excute command to list inventory:

	ansible-inventory  -i nventory_aws_ec2.yaml  --list   

##### Adjusted TF config for public DNS assignment

• You get private DNS name if no public DNS is assigned

• Enable DNS Hostnames
<img width="452" alt="image" src="https://github.com/fomar123/Ansible/assets/90075757/2decec5e-f34a-4244-b00f-f82cce89eb9a">


##### Adjusted Ansible playbook and ansible.cfg to use dynamic hosts from AWS:

• Changed host group name to aws_ec2

• Globally configure username and private ssh key in ansible.cfg

##### Added a 4th server and re-executed Ansible playbook

##### Targeted only specific servers in your AWS region:

• Created two prod servers and two dev servers

• Used tags to group instances

<img width="452" alt="image" src="https://github.com/fomar123/Ansible/assets/90075757/6088a938-3854-4de7-b513-9881f98053e3">

• Grouped server using instance types

<img width="452" alt="image" src="https://github.com/fomar123/Ansible/assets/90075757/4f4a095c-f664-4455-ae36-322aeea32b25">


# Project: Automate Kubernetes Deployment

##### Created K8s cluster using Terraform
<img width="452" alt="image" src="https://github.com/fomar123/Ansible/assets/90075757/70cf7b38-c5ab-4ff9-b61b-39ede00e5b0e">

##### Deployed app in new namespace:

• Created namespace in the EKS cluster

• Connected to ansible using the cluster	

##### Installed  openshift

         pip3 install openshift –-user

##### Installed PyYAML

       pip3 install PyYaml –user

##### Deployed nginc  app from Kubernetes configuration file

##### Use K8S_AUTH_KUBECONFIG as environmental variable instead of using kubeconfig module for every task


# Ansible Roles

##### Created a folder for roles(inside the roles your going to have a folder for each role):

• Inside each role you need to have a directory called tasks.

• Create a main.yaml file in tasks 
     
#####  Used Roles in Playbook:

• Reference roles inside playbook

##### Created EC2 servers with Terraform

• Deployed docker on ec2 using ansible

##### Executed Ansible Playbook

             ansible-playbook deploy-docker-with-roles.yaml -i inventory_aws_ec2.yaml


##### Complete Roles:

• Created folder “files” and created inside it  a docker-compose file  


##### Customise Roles with Variables:

• Create variables folder and define variable for docker login

##### Created a default folder and main.yaml file for your default variable  - for yours users and logins details:

• Default variables :  if user doesn’t set the variables the default value  variable will be used

• It is recommended to set default values for variables to avoid undefined variable errors

• Created variables for users because users maybe different in linux 
