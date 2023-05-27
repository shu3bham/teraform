provider "aws" {
  region = "ap-south-1"
}


module "db" {
  source = "./db"
}

module "web" {
  source = "./web"
}




output "Private_IP" {
    value = module.db.Private_IP

}


output "Public_IP" {
    value = module.web.pub_ip
  
}