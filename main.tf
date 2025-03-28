terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
  }
}


provider "aws" {
  region = var.region
}


resource "aws_instance" "simple2-ec2" {
  ami           = var.machine_type
  instance_type = var.virtual_machine1
  count         = 3
  tags = {
    Name = "Another Simple ec2 instance"
  }
  key_name               = aws_key_pair.classkey.key_name
  vpc_security_group_ids = [aws_security_group.sec.id]

  #   connection {
  #     type        = "ssh"
  #     user        = "ubuntu"
  #     private_key = file("./classkey_rsa")
  #     host        = self.public_ip
  #   }

  #   provisioner "remote-exec" {
  #     when   = create
  #     script = "./install_docker.sh"
  #   }

}


resource "aws_key_pair" "classkey" {
  key_name   = "classkey"
  public_key = file("./classkey_rsa.pub")
}

resource "aws_security_group" "sec" {
  name = "secgroup"
  ingress {
    protocol    = "tcp"
    from_port   = "22"
    to_port     = "22"
    cidr_blocks = ["0.0.0.0/0"]
  }


}

