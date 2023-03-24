# variable "application_name" {
#   default = "07-backend-state"
# }

# variable "project_name" {
#   default = "users"
# }

# variable "enviroment" {
#   default = "dev"
# }


terraform {
  backend "s3" {
    bucket         = "my-s3-bucket-data-for-frontend-application-001"
    key            = "07-backend-state/users/backend-state"
    region         = "us-east-1"
    dynamodb_table = "dev_application_locks"
    encrypt        = true
  }
}
resource "aws_iam_user" "my_iam_user" {
  name = "${terraform.workspace}_my_iam_user_abc"

}