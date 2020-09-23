Description:
Install Linux machine with Docker and run first container

<img src="https://d1q6f0aelx0por.cloudfront.net/product-logos/library-docker-logo.png" width="120" height="120" alt="docker"> <img src="https://upload.wikimedia.org/wikipedia/commons/thumb/3/35/Tux.svg/150px-Tux.svg.png" width="120" height="120" alt="linux">


1. Install linux machine.
Our recommendation is one of the following:
A. Install Oracle box + vagrant (preferred) / VMware player / VMWorkstation with Linux.
B. Install Linux machine on cloud provider (AWS is the most common)
Comment about linux distribution:
For option A --> Ubuntu 18.04 LTS is the most recommended.
                 Optional: Centos 7/8 / Ubuntu 20.04 LTS
For option B --> EC2--> Amazon Linux free tier

2. Install Docker-ce (community edition)
Note: Dont forget to start service and enable on boot

3. Run first docker container by running the following command:
sudo docker run hello-world

![Image of hello-world](https://examples.javacodegeeks.com/wp-content/uploads/2016/11/01-docker-run-hello-world-2.jpg)


Notes:
Install Virtual box link:
https://www.virtualbox.org/wiki/Downloads

vagrant useful commands:
vagrant up #starts and provisions the vagrant environment
vagrant halt #Shutdown
vagrant suspend
vagrant resume
vagrant ssh
vagrant destroy
for more information vagrant --help


Optional for Vagrant users with Oracle box:
clone repository and use Vagrant file from our repository for automated installation of ubuntu 18.04 with docker.

git clone https://github.com/ofeked/trex-team.git
cd trex-team/Project01/task01/
vagrant up
vagrant ssh
docker run hello-world
