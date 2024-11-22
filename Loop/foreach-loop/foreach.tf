provider "aws" {
  profile = "config"    # Ensure this profile exists in your AWS credentials
  region  = "us-east-1" # Set the region you're working in
}

resource "aws_instance" "this_aws_instance" {
  for_each = toset(var.imageid)
  ami      = each.value
  instance_type = "t3.micro"
  # Uncomment these lines if you need security group or key pair
  # vpc_security_group_ids = ["sg-0b1ef1f40fb94ec14"]
  # key_name               = "mumbai_key"
}

resource "aws_iam_user" "main_user" {
  for_each = toset(var.main_user_name)
  name     = each.value
}

variable "main_user_name" {
  type    = list(string)
  default = ["ubuntu", "awslinux", "windows"]
}

variable "imageid" {
  type    = list(string)
  default = ["ami-0dee22c13ea7a9a67","ami-0aebec83a182ea7ea","ami-00a6b23a4dd325f30"]
}

output "aws_ec2" {
  value = [
    for instance_key, instance in aws_instance.this_aws_instance :
      instance.public_ip
  ]
}
