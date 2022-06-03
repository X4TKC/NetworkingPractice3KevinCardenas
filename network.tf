resource "aws_vpc" "KCVPC" {
  cidr_block       = "192.168.0.0/20"
  instance_tenancy = "default"
  tags = {
    Name = "KCVPC"
  }
}
resource "aws_subnet" "Office2" {
  vpc_id     = aws_vpc.KCVPC.id
  cidr_block = "192.168.0.0/23"

  tags = {
    Name = "Office 2"
  }
}
resource "aws_subnet" "Office1" {
  vpc_id     = aws_vpc.KCVPC.id
  cidr_block = "192.168.2.0/25"

  tags = {
    Name = "Office 1"
  }
}
resource "aws_subnet" "Office3" {
  vpc_id     = aws_vpc.KCVPC.id
  cidr_block = "192.168.2.128/26"

  tags = {
    Name = "Office 3"
  }
}
resource "aws_subnet" "RemoteOffice" {
  vpc_id     = aws_vpc.KCVPC.id
  cidr_block = "192.168.2.192/26"

  tags = {
    Name = "Remote office"
  }
}
resource "aws_internet_gateway" "kc_igw" {
  vpc_id = aws_vpc.KCVPC.id

  tags = {
    Name = "kc_igw"
  }
}

resource "aws_route_table" "kc_rt" {
  vpc_id = aws_vpc.KCVPC.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.kc_igw.id
  }


  tags = {
    Name = "kc_rt"
  }
}

resource "aws_route_table_association" "my_rt_assoc_igw" {
  subnet_id      = aws_subnet.RemoteOffice.id
  route_table_id = aws_route_table.kc_rt.id
}


