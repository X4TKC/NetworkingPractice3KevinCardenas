resource "aws_vpc" "main" {
  cidr_block       = "192.168.0.0/20"
  instance_tenancy = "default"
  tags = {
    Name = "main"
  }
}
resource "aws_subnet" "Office2" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "192.168.0.0/23"

  tags = {
    Name = "Office 2"
  }
}
resource "aws_subnet" "Office1" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "192.168.2.0/25"

  tags = {
    Name = "Office 1"
  }
}
resource "aws_subnet" "Office3" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "192.168.2.128/26"

  tags = {
    Name = "Office 3"
  }
}
resource "aws_subnet" "RemoteOffice" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "192.168.2.192/27"

  tags = {
    Name = "Remote office"
  }
}



