resource "aws_instance" "this_ubuntu" {
    ami = "ami-001f2488b35ca8aad"
    instance_type = "t4g.nano"
    key_name = "sydneysai"
    vpc_security_group_ids = ["sg-03d74dc5f8101fbea"]
    count = 2
    tags = {
      name = "instance"
    }

}