variable "iam_user_name_prefix" {
  type    = string #any,number ,bool , list , map ,set,object ,tuple
  default = "my_iam_user"

}


resource "aws_iam_user" "my_iam_users" {
  count = 2
  name  = "${var.iam_user_name_prefix}_${count.index}"

}

# variables
# variable "image_id" {
#   type = string
# }

# variable "availability_zone_names" {
#   type    = list(string)
#   default = ["us-west-1a"]
# }

# variable "docker_ports" {
#   type = list(object({
#     internal = number
#     external = number
#     protocol = string
#   }))
#   default = [
#     {
#       internal = 8300
#       external = 8300
#       protocol = "tcp"
#     }
#   ]
# }