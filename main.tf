terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = "ap-south-1" 
}

# The Expensive Change: Upgraded server and increased storage
resource "aws_instance" "web_app" {
  ami           = "ami-0c55b159cbfafe1f0"
  instance_type = "m5.large"

  root_block_device {
    volume_size = 100
    volume_type = "gp3"
  }

  tags = {
    Environment = "Staging"
    Project     = "IA-2 Demo"
  }
}
