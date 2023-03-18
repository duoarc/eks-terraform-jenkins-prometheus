data "aws_ami" "latest-amazon-linux-image" {
  most_recent = true
  owners      = ["amazon"]
  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }
  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

resource "aws_instance" "alt3-server" {
  ami                         = data.aws_ami.latest-amazon-linux-image.id
  instance_type               = "t3.small"
  key_name                    = "jenkins-kp"
  subnet_id                   = aws_subnet.alt3-subnet1.id
  vpc_security_group_ids      = [aws_default_security_group.alt3-sg.id]
  availability_zone           = var.availability_zone
  associate_public_ip_address = true
  user_data                   = file("jenkins-userdata.sh")
  tags = {
    Name = "${var.env}-jenkins-server"
  }
}