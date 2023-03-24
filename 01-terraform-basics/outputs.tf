# output "aws_s3_bucket_versioning" {
#     value = aws_s3_bucket.my_s3_bucket.versioning[0].enabled
# }
# output "aws_s3_bucket_versioning_full_output" {
#     value = aws_s3_bucket.my_s3_bucket
# }
output "aws_iam_user_output" {
    value = aws_iam_user.my_iam_user
}