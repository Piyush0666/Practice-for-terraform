
# plan - execute

#          STATE
#   DESIRED  KNOWN  ACTUAL

resource "aws_s3_bucket" "my_s3_bucket" {
  bucket = "my-s3-bucket-data-for-frontend-application-001"
  #   versioning {
  #       enabled = true
  #   }
}

resource "aws_s3_bucket_versioning" "my_s3_bucket_versioning_example" {
  bucket = aws_s3_bucket.my_s3_bucket.id # here id will be the name of the bucket = "my-s3-bucket-data-for-frontend-application-001"
  versioning_configuration {
    status = "Enabled"
  }

}

resource "aws_iam_user" "my_iam_user" {
  name = "my-iam-user-production-001-updated"

}


























# resource "aws_s3_bucket_versioning" "versioning_example" {
#   bucket = aws_s3_bucket.my_s3_bucket.id
#   versioning_configuration {
#     status = "Enabled"
#   }
# }


# resource "aws_iam_user" "my_iam_user" {
#     name = "my_iam_user_abc_updated"
# }

# output "my_s3_bucket_versioning" {
#     value = aws_s3_bucket.my_s3_bucket.versioning[0].enabled
# }

# output "my_s3_bucket_complete_details" {
#     value = aws_s3_bucket.my_s3_bucket
# }

# output "my_iam_user_complete_details" {
#     value = aws_iam_user.my_iam_user
# }