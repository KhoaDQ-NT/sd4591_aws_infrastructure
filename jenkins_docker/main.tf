provider "aws" {
  region = var.region
}

resource "aws_security_group" "jenkins_docker_sg" {
  name_prefix = "JenkinsDockerSG"
  vpc_id      = var.vpc_id

  # Allow inbound traffic to ports required for Jenkins (e.g., SSH, HTTP, HTTPS, etc.)
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.jenkins_sg_cidr]
  }

  # Add more ingress rules as per your Jenkins and Docker requirements

  # Allow outbound traffic to anywhere
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "jenkins_docker_instance" {
  ami           = var.ami
  instance_type = var.instance_type
  subnet_id     = var.public_subnet_id
  vpc_security_group_ids = [
    aws_security_group.jenkins_docker_sg.id,
  ]

  key_name = var.key_name
  tags = {
    Name = "JenkinsDockerInstance"
  }

  user_data = <<-EOF
              #!/bin/bash
              sudo apt-get update
              sudo apt-get install -y docker.io
              sudo usermod -aG docker ubuntu  # Replace "ubuntu" with your user if different
              sudo systemctl start docker
              sudo systemctl enable docker

              # Install Jenkins
              wget -q -O - https://pkg.jenkins.io/debian/jenkins.io.key | sudo apt-key add -
              sudo sh -c 'echo deb http://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'
              sudo apt-get update
              sudo apt-get install -y jenkins

              # Start Jenkins service
              sudo systemctl start jenkins
              sudo systemctl enable jenkins
              EOF
}
