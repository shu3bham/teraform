resource "aws_instance" "db" {
  ami= "ami-0b08bfc6ff7069aff"
  instance_type = "t2.micro"
  tags = {
    Name = "DB Server"
  }

  
}


output "Private_IP" {
    value = aws_instance.db.private_ip

}
