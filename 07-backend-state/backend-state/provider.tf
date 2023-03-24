provider "aws" {
  region                   = "us-east-1"
  shared_config_files      = ["/Users/Lucifer/.aws/config"]
  shared_credentials_files = ["/Users/Lucifer/.aws/credentials"]
  profile                  = "development"
  //version = "~> 2.46" (No longer necessary)
}
