provider "aws" {
   profile = "config"
    default_tags {
                tags = {
                    name = "aws"
                }
    }
}


resource "aws_iam_user" "this_aws_iam_user" { 
    count = length(var.users_list)  #4
    name = var.users_list[count.index]
}  
resource "aws_iam_user" "this_aws_iam_user_2" { 
    name = "neo.${count.index}"   #neo
    count = 4
}  


variable "users_list" {
    default = ["user1" , "user2" , "user3" , "user4"]
}                #0        #1        #2        #3
  