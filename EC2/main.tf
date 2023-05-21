provider "aws" {
    region = "ap-south-1"
  
}

resource "aws_instance" "my_first_instance" {
  ami= "ami-0b08bfc6ff7069aff"
  instance_type = "t2.micro"
  tags = {
    Name = "my_EC2"
  }
}