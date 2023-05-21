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


resource "aws_eip" "MyElasticIp" {
  instance = aws_instance.my_first_instance.id
  
}

output "EIP" {
  value = aws_eip.MyElasticIp.public_ip
  description = "This will show EIP ID"
  
}