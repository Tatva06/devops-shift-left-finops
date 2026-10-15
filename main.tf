resource "aws_instance" "chatbot_server" {
  ami                         = "ami-0ba259e664698cbfc"
  instance_type               = "t2.micro"
  associate_public_ip_address = false

  tags = {
    Name        = "Chatbot-Production-Server"
    Environment = "Prod"
    Project     = "DevOps-Lab"
    Service     = "Chatbot-API"
  }
}