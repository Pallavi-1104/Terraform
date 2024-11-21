resource "aws_instance" "this_ubuntu" {
    ami = "ami-001f2488b35ca8aad"
    instance_type = "t4g.nano"
    key_name = "sydneysai"
    vpc_security_group_ids = ["sg-0b1ef1f40fb94ec14"]]
    count = 2
    tags = {
      name = "instance"
    }

}
