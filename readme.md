## What it does
This procedure has been last updated on **04/06/2020**.

It rapidly goes through creation of a AWS EC2 Ubuntu instance and the setup of PySpark and Jupyter notebook on the remote server. 
It uses SSH connections as readily available on Unix systems to connect to the server. 


This procedure follows the one of [Jose Portilla](https://medium.com/@josemarcialportilla/getting-spark-python-and-jupyter-notebook-running-on-amazon-ec2-dec599e1c297)
used in the lecture 161 of his [Udemy course "Python for Data Science and Machine Learning Bootcamp"](https://www.udemy.com/course/python-for-data-science-and-machine-learning-bootcamp/).   
Modifications have been made based on the course Q&A section. 

## Starting the EC2 instance
On the AWS console, go to the EC2 service, click on launch an instance and select the Ubuntu server.   
Select the desired instance type and go through the setup until reaching the Configure Security Group. Make sure to add a Custom TCP Rule (by clicking "Add a Rule")
with Port Range 8888 and with an IP address, like "0.0.0.0/0", used by default for the SSH rule. 
After clicking "Launch", either "Choose an existing key pair" if you have a .pem security file on your computer or create and download a new one with "Create a new key pair".
Once the instance is launched, copy paste the DNS address displayed on the instance management console into a file yourtag.dns .   
You should have 2 files: yourtag.pem and yourtag.dns. Place them in the local directory you will be working from. 

## Setting up Jupyter notebook and PySpark
1. Download all .sh files of this repository in the local directory you will be working from
1. Make sure these bash scripts can be executed: in a terminal window at the working directory type `chmod +x *.sh`
1. Execute aws_ec2_ssh.sh: `./aws_ec2_ssh.sh yourtag.pem yourtag.dns`
1. You should now be connected to the EC2 server. Execute the first setup script: `./setup1.sh`
1. Type `exit` to close the SSH connection, then reconnect using for instance aws_ec2_ssh.sh
1. Execute the second setup script: `./setup2.sh`
1. Try to connect to the jupyter notebook. In a browser (you might have to try different browsers) enter the address `https://<your_ec2_DNS>:8888`
1. Make sure everything is working well by executing a couple python lines 
1. Stop the notebook and execute the third setup script: `./setup3.sh`

At this point PySpark should be working in jupyter notebooks. Agreeing to everything installers ask should correctly get you through the setup process.
