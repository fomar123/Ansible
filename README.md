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


