output "ec2_public_ip" {
  value = aws_instance.alt3-server.public_ip
}