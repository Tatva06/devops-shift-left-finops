terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "chatbot_server" {
  ami           = "ami-0ba259e664698cbfc"
  instance_type = "m5.4xlarge"

  tags = {
    Name        = "Chatbot-Production-Server"
    Environment = "Production"
    Project     = "DevOps-Lab"
  }
}