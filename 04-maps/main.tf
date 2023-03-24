variable "users" {
  #   type    = list  
  #   here well will take map through map 
  default = {
    Piyush : { country : "US", department : "Devops_Engineer" },
    Shiv : { country : "Australia", department : "CIA" },
    Ramit : { country : "Thailand", department : "Google" },
    Rajiv : { country : "India", department : "Gym" }
  }

}


resource "aws_iam_user" "my_iam_users" {
  #   count = length(var.names)
  #   name  = var.names[count.index]
  for_each = var.users
  name     = each.key
  tags = {
    # country : each.value
    country : each.value.country
    department : each.value.department
  }
}