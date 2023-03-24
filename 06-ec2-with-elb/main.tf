#          STATE
#   DESIRED  KNOWN  ACTUAL

resource "aws_default_vpc" "my_default_vpc" {

}
resource "aws_security_group" "http_server_sg_01" {
  name = "http_server_sg_01"
  #   vpc_id      = "vpc-02d474f10f6cb0c87"
  vpc_id      = aws_default_vpc.my_default_vpc.id
  description = "Allow TLS inbound and outbound traffic"


  dynamic "ingress" {
    for_each = [80, 22]
    iterator = port
    content {
      description = "TLS from VPC"
      from_port   = port.value
      to_port     = port.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }

  egress {
    description = "TLS from VPC"
    from_port   = 0
    to_port     = 0
    protocol    = -1
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    "name" = "http_secure_sg_01"
  }

}
resource "aws_security_group" "elb_sg" {
  name = "elb_sg"
  vpc_id      = aws_default_vpc.my_default_vpc.id
  description = "Allow TLS inbound and outbound traffic"


  dynamic "ingress" {
    for_each = [80, 22]
    iterator = port
    content {
      description = "TLS  inbound traffic from VPC"
      from_port   = port.value
      to_port     = port.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }

  egress {
    description = "TLS  outbound traffic from VPC"
    from_port   = 0
    to_port     = 0
    protocol    = -1
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_elb" "elb" {
  name            = "elb"
  subnets         = data.aws_subnets.default_subnets.ids
  security_groups = [aws_security_group.elb_sg.id]
  instances       = values(aws_instance.http_servers_multiple).*.id

  listener {
    instance_port     = 80
    instance_protocol = "http"
    lb_port           = 80
    lb_protocol       = "http"
  }
}
resource "aws_instance" "http_servers_multiple" {
  
  ami                    = data.aws_ami.aws_ami_Linux_2_latest.id
  key_name               = "my-first-ec2"
  instance_type          = "t2.micro"
  vpc_security_group_ids = [aws_security_group.http_server_sg_01.id]

  for_each  = toset(data.aws_subnets.default_subnets.ids)
  subnet_id = each.value 

  tags = {
    name : "http_servers_multiple_${each.value}"
  }



  connection {
    type        = "ssh"
    host        = self.public_ip
    user        = "ec2-user"
    private_key = file(var.aws_mykey_pair)
  }

  provisioner "remote-exec" {
    inline = [
      "sudo yum install httpd -y",
      "sudo service httpd start",
      "echo Welcome to my-world - Virtual Server is at ${self.public_dns} | sudo tee /var/www/html/index.html"
    ]
  }
}















#   # This port is to take traffic from web server the UI
#   ingress {
#     description = "TLS from VPC"
#     from_port   = 80
#     to_port     = 80
#     protocol    = "tcp"
#     cidr_blocks = ["0.0.0.0/0"]
#   }
#   # created for ssh 
#   ingress {
#     description = "TLS from VPC"
#     from_port   = 22
#     to_port     = 22
#     protocol    = "tcp"
#     cidr_blocks = ["0.0.0.0/0"]
#   }
#   Outbound rules 
