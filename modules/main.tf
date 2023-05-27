provider "aws" {
    region = "ap-south-1"
  
}

module "ec2module" {
    source = "./ec2"
    ec2name = "Name from Module"
}



output "module_name" {
    value = module.ec2module.instance_id
}