module "ec2" {
  source                  = "/home/cloudshell-user/Terraform/Module_block/Resources/EC2"
  ami                    = "ami-0dee22c13ea7a9a67"
  instance_type          = "t2.micro"
  key_name               = "mumbai_2"
  disable_api_stop       = false
  disable_api_termination = false
  vpc_security_group_ids = [module.aws_vpc.security_group_id]
  subnet_id              = module.aws_vpc.subnet_id
  vpc_id                 = module.aws_vpc.vpc_id
}

module "aws_vpc" {
  source                     = "/home/cloudshell-user/Terraform/Module_block/Resources/VPC"
  vpc_cidr_block             = "192.168.0.0/16"
  vpc_tags                   = { Name = "this_vpc" }
  subnet_pub_cidr_block      = "192.168.0.0/17"
  subnet_pub_map_ip_on_launch = true
  subnet_pub_tags            = { Name = "pub_subnet" }
  availability_zone          = "ap-south-1a"
}
