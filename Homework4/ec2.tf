resource "aws_instance" "web" {
  ami                    = var.ec2["ami"]
  instance_type          = var.ec2["instance_type"]
  subnet_id              = aws_subnet.public_1.id
  vpc_security_group_ids = [aws_security_group.sg.id]
  key_name               = var.aws_key

  tags = local.common_tags
}