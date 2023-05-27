resource "aws_instance" "web" {
  ami= "ami-0b08bfc6ff7069aff"
  instance_type = "t2.micro"
  security_groups = [module.sg.sg_name]
  user_data = file("./web/server-script.sh")
  tags = {
    Name = "web Server"
  }

  
}

output "pub_ip" {
    value = module.eip.pub_ip
}


module "eip" {
    source = "../eip"
    instance_id = aws_instance.web.id
}


module "sg" {
    source = "../sg"
}






