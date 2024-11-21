
#LockID
terraform {
    backend "s3" {
        bucket = "cloud38"
        key = "terraform.tfstate"
        dynamodb_table = "cbz38"
        region = "ap-south-1"
        profile = "configs"
        shared_credentials_files = ["/root/.aws/credentials"]
    }
}


resource "aws_instance" "ths_instance" {
  ami = "ami-0dee22c13ea7a9a67"
  //key_name = "mumbai_2"
  instance_type = "t2.micro"
  //security_groups = ["sg-0b1ef1f40fb94ec14"]
  count = 1
  
  
  user_data = <<-EOF
    #!/bin/bash
    sudo apt-get update
    sudo apt-get install -y apache2
    sudo echo "hello world this is Batch38" >> /var/www/html/index.html
    EOF
   tags = {
    Name = "first_terraform_instance"

  } 
    
}