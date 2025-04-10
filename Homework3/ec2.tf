# Ubuntu AMI
data "aws_ami" "ubuntu" {
  most_recent = true
  owners      = ["099720109477"]  

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-*-amd64-server-*"]
  }
}

# Amazon Linux 2 AMI
data "aws_ami" "amazon" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }
}


resource "aws_instance" "ubuntu" {
  ami                    = data.aws_ami.ubuntu.id
  instance_type          = "t2.micro"
  subnet_id              = aws_subnet.public1.id
  vpc_security_group_ids = [aws_security_group.kaizen_sg.id]
  associate_public_ip_address = true
  key_name = "homework-key"
  user_data = file("apache.sh")


  tags = {
    Name = "Ubuntu"
  }
}

resource "aws_instance" "amazon" {
  ami                    = data.aws_ami.amazon.id
  instance_type          = "t2.micro"
  subnet_id              = aws_subnet.public2.id
  vpc_security_group_ids = [aws_security_group.kaizen_sg.id]
  associate_public_ip_address = true
  key_name = "homework-key"
  user_data = file("httpd.sh")

  tags = {
    Name = "Amazon-fixed"
    user_data_replace_on_change = true
  }
}