provider "aws" {
  region = var.aws_region
}

resource "aws_instance" "jenkins_server" {
  ami                    = var.ami
  instance_type          = var.instance_type
  key_name               = var.key_name
  vpc_security_group_ids = [aws_security_group.jenkins_sg.id]

  user_data = file("${path.module}/../scripts/install_jenkins.sh")

  tags = {
    Name = "jenkins-server"
  }

  associate_public_ip_address = true
}

resource "aws_security_group" "jenkins_sg" {
  name = "jenkins_sg"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "jenkins_sg"
  }
}