#!/bin/bash
#updating amazon linux patches
sudo yum update -y
#installing docker engine
sudo amazon-linux-extras install docker -y
#installing docker engine for amazon-linux 2023
#sudo yum install -y docker
#starting docker service
sudo service docker start
#Adding user ec2-user to docker group
sudo usermod -a -G docker ec2-user
#enabling docker service
sudo chkconfig docker on
#downloading docker compose
sudo curl -L https://github.com/docker/compose/releases/download/1.22.0/docker-compose-$(uname -s)-$(uname -m) -o /usr/local/bin/docker-compose
#changing the permissions
sudo chmod +x /usr/local/bin/docker-compose
#Add this command for sonarqube installation (only)
sudo echo "vm.max_map_count = 262144" >> /etc/sysctl.d/99-sysctl.conf

sudo systemctl restart docker
