
resource "aws_instance" "ec2RemoteOffice" {
  ami                         = data.aws_ami.ubuntu.id
  subnet_id                   = aws_subnet.RemoteOffice.id
  vpc_security_group_ids      = [aws_security_group.allow_ssh.id]
  associate_public_ip_address = true
  key_name                    = aws_key_pair.deployer.key_name
  instance_type               = "t2.micro"

  tags = {
    Name = "Ec2-4"
  }
}
