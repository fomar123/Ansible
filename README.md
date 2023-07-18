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
