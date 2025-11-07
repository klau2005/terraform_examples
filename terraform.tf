terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
  }
}

provider "aws" {
  alias   = "user"
  region  = var.region
  profile = var.profile
}

resource "aws_security_group" "instance" {
  name = "tf-test"
  description = "test sg"

  ingress {
    description = "test sg"
    from_port   = var.server_port
    to_port     = var.server_port
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "test sg"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.mgmt_ip]
  }

  egress {
    description = "test sg"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    description = "test sg"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    description = "test sg"
    from_port   = var.server_port
    to_port     = var.server_port
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    description = "test sg"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "example" {
  monitoring = true
  ami           = var.ami_tamu_ubuntu
  instance_type = var.instance_type
  vpc_security_group_ids = [aws_security_group.instance.id]

  tags = {
    Name = "EC2EXAMPLEX"
  }
}   
