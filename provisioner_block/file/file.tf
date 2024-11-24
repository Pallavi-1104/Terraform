provider "aws" {
    region = "ap-south-1"
    access_key = ""
    secret_key = ""
    profile = "config"
}
resource "aws_instance" "this_ubuntu" {
      ami = "ami-0dee22c13ea7a9a67"  
      instance_type = "t2.micro"  
      key_name = "mumbai_key.pem"
      vpc_security_group_ids = ["sg-0b1ef1f40fb94ec14"]
        
      provisioner "file" {
    source      = "readme.md"
    destination = "/home/ubuntu/readme.md"
      connection {
    type     = "ssh"
    user     = "ubuntu"
    private_key = file("${path.module}/id_rsa.pem")
    host     = "${self.public_ip}"
   }


   }


}

