provider "aws" {
  region = "ap-south-1"
}

variable "ingress" {
  type = list(number)
  default = [ 80,443 ]
}

variable "egress" {
  type = list(number)
  default = [ 80,443 ]
}

resource "aws_instance" "db" {
  ami= "ami-0b08bfc6ff7069aff"
  instance_type = "t2.micro"
  tags = {
    Name = "DB Server"
  }

  
}


resource "aws_instance" "web" {
  ami= "ami-0b08bfc6ff7069aff"
  instance_type = "t2.micro"
  security_groups = [aws_security_group.web_traffic.name]
  user_data = file("server-script.sh")
  tags = {
    Name = "web Server"
  }

  
}


resource "aws_eip" "web_ip" {
    instance = aws_instance.web.id
  
}


resource "aws_security_group" "web_traffic" {
  name = "Allow web traffic"
  dynamic "ingress" {
    iterator = port
    for_each = var.ingress
    content {
    from_port= port.value
    to_port=port.value
    protocol = "TCP"
    cidr_blocks = ["0.0.0.0/0"]
    }
  }

 dynamic "egress" {
    iterator = port
    for_each = var.egress
    content {
    from_port= port.value
    to_port=port.value
    protocol = "TCP"
    cidr_blocks = ["0.0.0.0/0"]
    }
  }


}




output "Private_IP" {
    value = aws_instance.web.private_ip

}


output "Public_IP" {
    value = aws_eip.web_ip.public_ip
  
}