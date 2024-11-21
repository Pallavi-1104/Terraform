resource "aws_instance" "this_ubuntu" {
      ami = "ami-0dee22c13ea7a9a67"  
      instance_type = "t2.micro"  
      key_name = "mumbai_2"
      vpc_security_group_ids = ["sg-0b1ef1f40fb94ec14"]
      count = 2
      tags = {
        name = "instance"
  }
}
