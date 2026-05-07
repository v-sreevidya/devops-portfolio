# resource "aws_s3_bucket" "bucket" {
  
#   bucket = var.bucket_name

#   tags={
#     Name = "learning"
#     Environment = "dev"
#   }
# }

resource "aws_vpc" "vpc" {
  cidr_block = "10.1.0.0/16"
  
  tags = {
    Name = "vpc-testing"
  }
}

resource "aws_subnet" "subnet" {
  vpc_id = aws_vpc.vpc.id
  cidr_block = "10.1.1.0/24"

  tags = {
    Name = "subnet-testing"
  }
  
}

resource "aws_security_group" "sg" {
  name = "testing-security-group"
  vpc_id = aws_vpc.vpc.id
  description = "Allow HTTP and SSh"
  
  ingress  {
    description = "Allow HTTP"
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    
  }
  egress  {
    description = "Allow outbound HTTP"
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]

  }
  tags = {
    Name = "testing-sg"
  }
}

resource "aws_instance" "vm" {
  count = 1
  instance_type = "t3.micro"
  ami = "ami-0a85d4ea54a19d2ff"
  vpc_security_group_ids = [aws_security_group.sg.id]
  subnet_id = aws_subnet.subnet.id
  associate_public_ip_address = true
  

  tags = {
    Name ="sv-testing-${count.index}"
  }
  
}
