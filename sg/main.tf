provider "aws" {
    region = "ap-south-1"
  
}

resource "aws_instance" "my_first_instance" {
  ami= "ami-0b08bfc6ff7069aff"
  instance_type = "t2.micro"
  security_groups = [aws_security_group.MysecurityGroup.name]

  
}


resource "aws_security_group" "MysecurityGroup" {
  name = "Allow HTTPS"
  ingress {
  from_port = 433
  to_port = 433
  protocol = "TCP"
  cidr_blocks= ["0.0.0.0/0"]
  }
  
  egress {
  from_port = 433
  to_port = 433
  protocol = "TCP"
  cidr_blocks= ["0.0.0.0/0"]
  }

}