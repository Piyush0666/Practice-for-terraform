variable "names" {
  type    = list
  default = ["Piyush", "Shiv", "Ramit", "Rajiv"]

}


resource "aws_iam_user" "my_iam_users" {
#   count = length(var.names)
#   name  = var.names[count.index]
    for_each = toset(var.names)
    name = each.value

}