provider "aws" {
  region = var.region
}

resource "aws_security_group" "jenkins_docker_sg" {
  name_prefix = "JenkinsDockerSG"
  description = "allow access on ports 8080 and 22"
  vpc_id      = var.vpc_id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.jenkins_sg_cidr]
  }

  # Allow inbound traffic for Jenkins web interface (port 8080)
  ingress {
    from_port   = 8080
    to_port     = 8080
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

  # user_data = file("install_jenkins_docker.sh")

  tags = {
    Name = "JenkinsDockerInstance"
  }

  associate_public_ip_address = true
}

# an empty resource block
resource "null_resource" "name" {

  # ssh into the ec2 instance 
  connection {
    type        = "ssh"
    user        = "ec2-user"
    private_key = file("~/Documents/AWS_Credentials/myec2kp.pem")
    host        = aws_instance.jenkins_docker_instance.public_ip
  }

  # copy the install_jenkins_docker.sh file from your computer to the ec2 instance 
  provisioner "file" {
    source      = "${path.module}/install_jenkins_docker.sh"
    destination = "/tmp/install_jenkins_docker.sh"
  }

  # set permissions and run the install_jenkins_docker.sh file
  provisioner "remote-exec" {
    inline = [
      "sudo chmod +x /tmp/install_jenkins_docker.sh",
      "sh /tmp/install_jenkins_docker.sh"
    ]
  }

  # wait for ec2 to be created
  depends_on = [aws_instance.jenkins_docker_instance]
}


# print the url of the jenkins server
output "website_url" {
  value = join("", ["http://", aws_instance.jenkins_docker_instance.public_dns, ":", "8080"])
}
