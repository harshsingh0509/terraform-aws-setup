resource "aws_instance" "ubuntu_server" {
  ami           = "ami-084568db4383264d4"
  instance_type = "t2.micro"
  key_name      = "harsh_tut"
  subnet_id     = aws_subnet.private_subnet.id
  vpc_security_group_ids = [aws_security_group.allow_ssh.id]
  iam_instance_profile   = aws_iam_instance_profile.ec2_profile.name

  tags = {
    Name = "Terraform-Ubuntu-Instance"
  }
}

resource "aws_security_group" "allow_ssh" {
  vpc_id      = aws_vpc.main.id  
  name        = "allow_ssh"
  description = "Allow SSH inbound traffic"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["52.91.243.29/32"]  
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

