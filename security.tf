resource "aws_security_group" "allow_ssh" {
  name        = "allow_ssh"
  description = "Allow ssh inbound traffic"
  vpc_id      = aws_vpc.KCVPC.id

  ingress {
    description = "ssh from VPC"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "allow_ssh"
  }
}
resource "aws_security_group" "private" {
  name        = "private"
  description = "private inbound traffic"
  vpc_id      = aws_vpc.KCVPC.id

  ingress {
    description = "private"
    from_port   = 8
    to_port     = 0
    protocol    = "icmp"
    cidr_blocks = ["192.168.2.192/26"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "allow_remote"
  }
}
resource "aws_security_group" "allow_remote" {
  name        = "allow_remote"
  description = "Allow remote inbound traffic"
  vpc_id      = aws_vpc.KCVPC.id

  ingress {
    description = "ssh from remote"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["192.168.2.192/26"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "allow_remote"
  }
}
