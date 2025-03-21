terraform {
  required_providers {
    aws = {
        source = "hashicorp/aws"
    }
  }
}


provider "aws" {
    region = "us-east-1"
}

resource "aws_instance" "simple-ec2" {
    ami = "ami-084568db4383264d4"
    instance_type = "t2.micro"
    count = 2
    tags = {
        Name = "Simple ec2 instance"
    }
    key_name = aws_key_pair.classkey.key_name
}

resource "aws_instance" "simple2-ec2" {
    ami = "ami-084568db4383264d4"
    instance_type = "t2.micro"
    count = 1
    tags = {
        Name = "Another Simple ec2 instance"
    }
    key_name = aws_key_pair.classkey.key_name
    vpc_security_group_ids = [aws_security_group.sec.id]
}

resource "aws_key_pair" "classkey" {
    key_name = "classkey"
    public_key = file("./classkey_rsa.pub")
}
 
resource "aws_security_group" "sec" {
    name = "secgroup"
    ingress {
            protocol = "tcp"
            from_port = "22"
            to_port = "22"
            cidr_blocks = ["0.0.0.0/0"]
    }
    
    
}
