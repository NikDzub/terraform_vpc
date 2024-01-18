# VPC
resource "aws_vpc" "main" {
  cidr_block           = var.vpc_cidr_block
  instance_tenancy     = "default"
  enable_dns_hostnames = true
  tags = {
    Name : "${var.env_prefix}_vpc"

  }
}

# IGW
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main.id
  tags = {
    Name : "${var.env_prefix}_internet_gateway"
  }
}

# PUBLIC ROUTE TABLES
resource "aws_route_table" "pub_rt" {
  vpc_id = aws_vpc.main.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
  tags = {
    Name : "${var.env_prefix}_pub_rt"
  }
}

# PRIVATE ROUTE TABLES
resource "aws_route_table" "priv_rt" {
  vpc_id = aws_vpc.main.id
  tags = {
    Name : "${var.env_prefix}_priv_rt"
  }
}
