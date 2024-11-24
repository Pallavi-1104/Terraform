provider "aws" {
    region = "ap-south-1"
    profile = "config"
}

resource "aws_instance" "this_ubuntu" {
      ami = "ami-0dee22c13ea7a9a67"  
      instance_type = "t2.micro"  
      key_name = "mumbai_key"
      vpc_security_group_ids = ["sg-0b1ef1f40fb94ec14"]
      

       provisioner "file" {
    source      = "readme.md"
    destination = "/home/ec2-user/readme.md"
      connection {
    type     = "ssh"
    user     = "ec2-user"
    private_key = file("${path.module}/mumbai_key")
    host     = "${self.public_ip}"
  }
  
  
  }
    provisioner "local-exec" {
        command = "echo ${self.private_ip} >> /tmp/private_ips.txt "
    }
        provisioner "local-exec" {
        working_dir = "/tmp/"
        command = "echo ${self.private_ip} >> workingdir_private_ips.txt "

  }

}

