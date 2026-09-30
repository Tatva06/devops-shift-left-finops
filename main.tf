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

# 1. Compute Tier (Web Server)
resource "aws_instance" "web_app" {
  ami           = "ami-0c55b159cbfafe1f0"
  instance_type = "m5.large" 

  root_block_device {
    volume_size = 20
    volume_type = "gp3"
  }
}

# 2. Database Tier (PostgreSQL)
resource "aws_db_instance" "database" {
  allocated_storage    = 20
  engine               = "postgres"
  instance_class       = "db.t3.micro" 
  multi_az             = true        
  skip_final_snapshot  = true
}

# 3. Networking Tier (Currently commented out)
 resource "aws_nat_gateway" "expensive_nat" {
  allocation_id = "eipalloc-0123456789abcdef0"
  subnet_id     = "subnet-0123456789abcdef0"
 }