data "aws_ami" "aws_ami_Linux_2_latest" {
  most_recent = true
  owners      = ["amazon"]
  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*"]
  }

}
data "aws_subnets" "default_subnets" {
  filter {
    name   = "vpc-id"
    values = [aws_default_vpc.my_default_vpc.id]
  }
}

# data "aws_ami_ids" "aws_ami_Linux_2_latest_ids" {

#   owners = ["amazon"]


# }