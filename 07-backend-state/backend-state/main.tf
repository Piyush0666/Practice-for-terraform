//S3 bucket
//Locking =We dont want state to be corrupted so that is why we will lock and then we will use s3 bucket
//For lock we use -Dynamo DB. This DB supports locks 



resource "aws_s3_bucket" "my_enterprise_backend_state" {
  bucket = "my-s3-bucket-data-for-frontend-application-001"

  lifecycle {
    prevent_destroy = true
  }

  #    versioning {
  #        enabled = true
  #    }
  # sse = Server Side Encryption & AES =Advance Encryption Standard
  #    server_side_encryption_configuration {
  #        rule {
  #            apply_server_side_encryption_by_default {
  #                sse_algorithm = "AES256"
  #            }
  #        }
  #    }

}

resource "aws_s3_bucket_versioning" "versioning_example" {
  bucket = aws_s3_bucket.my_enterprise_backend_state.id
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "example" {
  bucket = aws_s3_bucket.my_enterprise_backend_state.bucket
  #  apply_server_side_encryption_by_default this will 
  # created beacuse we want to store state information in server side encryption
  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}
//Locking - Dynamo DB

resource "aws_dynamodb_table" "enterprise_backend_lock" {
  name         = "dev_application_locks"
  billing_mode = "PAY_PER_REQUEST"

  hash_key = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }

}
