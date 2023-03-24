data "aws_ami" "aws_ami_Linux_2_latest" {
  most_recent = true
  owners      = ["amazon"]
  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*"]
  }

}

# data "aws_ami_ids" "aws_ami_Linux_2_latest_ids" {

#   owners = ["amazon"]


# }