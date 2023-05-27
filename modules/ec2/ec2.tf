variable "ec2name" {
    type = string
}


resource "aws_instance" "my_first_instance" {
  ami= "ami-0b08bfc6ff7069aff"
  instance_type = "t2.micro"
  tags = {
    Name = var.ec2name
  }
}


output "instance_id" {
    value = aws_instance.my_first_instance.id
}   