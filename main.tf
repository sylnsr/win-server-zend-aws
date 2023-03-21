terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

provider "aws" {
  profile = var.aws_profile
  region = "us-west-2"
}


resource "aws_subnet" "public_subnet" {
  vpc_id            = var.aws_vpc_id
  cidr_block        = var.public_cidr
  availability_zone = var.aws_zone
}

resource "aws_eip" "windows-eip" {
  vpc  = true
  tags = {
    Name = "win-server-${var.win_instance_name}"
  }
}

# Define the security group for the Windows server
resource "aws_security_group" "aws_win_sg" {
  name        = "win-server-sg"
  description = "Allow incoming connections"
  vpc_id      = var.aws_vpc_id
  ingress {
    from_port   = 3389
    to_port     = 3389
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow incoming RDP connections"
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "windows-sg"
  }
}

