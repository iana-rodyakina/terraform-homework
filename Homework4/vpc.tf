resource "aws_vpc" "main_vpc" {
  cidr_block           = var.vpc[0].cidr_block
  enable_dns_support   = var.vpc[0].enable_dns_support
  enable_dns_hostnames = var.vpc[0].enable_dns_hostnames

  tags = local.common_tags
}

resource "aws_subnet" "public_1" {
  vpc_id                  = aws_vpc.main_vpc.id
  cidr_block              = var.subnets[0].cidr_block
  availability_zone       = var.subnets[0].availability_zone
  map_public_ip_on_launch = var.subnets[0].auto_assign_ip

  tags = {
    Name = var.subnets[0].name
  }
}

resource "aws_subnet" "public_2" {
  vpc_id                  = aws_vpc.main_vpc.id
  cidr_block              = var.subnets[1].cidr_block
  availability_zone       = var.subnets[1].availability_zone
  map_public_ip_on_launch = var.subnets[1].auto_assign_ip

  tags = {
    Name = var.subnets[1].name
  }
}

resource "aws_subnet" "private_1" {
  vpc_id                  = aws_vpc.main_vpc.id
  cidr_block              = var.subnets[2].cidr_block
  availability_zone       = var.subnets[2].availability_zone
  map_public_ip_on_launch = var.subnets[2].auto_assign_ip

  tags = {
    Name = var.subnets[2].name
  }
}

resource "aws_subnet" "private_2" {
  vpc_id                  = aws_vpc.main_vpc.id
  cidr_block              = var.subnets[3].cidr_block
  availability_zone       = var.subnets[3].availability_zone
  map_public_ip_on_launch = var.subnets[3].auto_assign_ip

  tags = {
    Name = var.subnets[3].name
  }
}

resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.main_vpc.id

  tags = {
    Name = var.igw_name
  }
}

resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.main_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }

  tags = {
    Name = var.route_table_names[0]
  }
}

resource "aws_route_table" "private_rt" {
  vpc_id = aws_vpc.main_vpc.id

  tags = {
    Name = var.route_table_names[1]
  }
}

resource "aws_route_table_association" "public1" {
  subnet_id      = aws_subnet.public_1.id
  route_table_id = aws_route_table.public_rt.id
}

resource "aws_route_table_association" "public2" {
  subnet_id      = aws_subnet.public_2.id
  route_table_id = aws_route_table.public_rt.id
}

resource "aws_route_table_association" "private1" {
  subnet_id      = aws_subnet.private_1.id
  route_table_id = aws_route_table.private_rt.id
}

resource "aws_route_table_association" "private2" {
  subnet_id      = aws_subnet.private_2.id
  route_table_id = aws_route_table.private_rt.id
}



