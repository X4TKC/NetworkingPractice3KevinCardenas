
resource "aws_instance" "ec2office2" {
  ami                         = data.aws_ami.ubuntu.id
  subnet_id                   = aws_subnet.Office2.id
  vpc_security_group_ids      = [aws_security_group.private.id]
  associate_public_ip_address = false
  key_name                    = aws_key_pair.deployer.key_name
  instance_type               = "t2.micro"

  tags = {
    Name = "KC-Ec2-2"
  }
}
