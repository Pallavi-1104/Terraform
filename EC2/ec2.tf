resource "aws_instance" "this_ubuntu" {
  ami                    = "ami-0aebec83a182ea7ea"  # x86_64 Ubuntu AMI ID
  instance_type          = "t2.micro"  # x86_64 compatible instance type
  key_name               = "mumbai_2"
  count                  = 2
  tags = {
    name = "instance"
  }
}
