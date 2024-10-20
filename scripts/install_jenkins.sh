#!/bin/bash
# Update the server and install Java (required for Jenkins)
sudo apt update -y
sudo apt install -y openjdk-11-jdk

# Add Jenkins repository and install Jenkins
wget -q -O - https://pkg.jenkins.io/debian/jenkins.io.key | sudo apt-key add -
sudo sh -c 'echo deb http://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'
sudo apt update
sudo apt install -y jenkins

# Start Jenkins and enable it on boot
sudo systemctl start jenkins
sudo systemctl enable jenkins

# Allow Jenkins through the firewall on port 8080
sudo ufw allow 8080
sudo ufw allow OpenSSH
sudo ufw --force enable
