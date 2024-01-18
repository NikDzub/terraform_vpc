data "aws_availability_zones" "az" {
  state = "available"
}

# IGW
resource "aws_internet_gateway" "my_app" {
  vpc_id = var.vpc_id
  tags = {
    Name : "${var.env_prefix}_internet_gateway"
  }
}

# AZ1 SUBNETS
resource "aws_subnet" "public_sub_az1" {
  vpc_id            = var.vpc_id
  cidr_block        = element(var.pub_sub_cidrs, 0)
  availability_zone = element(data.aws_availability_zones.az.names, 0)
  tags = {
    Name : "${var.env_prefix}_public_sub_az1"
  }
}
resource "aws_subnet" "private_app_sub_az1" {
  vpc_id                  = var.vpc_id
  cidr_block              = element(var.priv_sub_cidrs, 0)
  availability_zone       = element(data.aws_availability_zones.az.names, 0)
  map_public_ip_on_launch = false
  tags = {
    Name : "${var.env_prefix}_private_app_sub_az1"
  }
}
resource "aws_subnet" "private_data_sub_az1" {
  vpc_id                  = var.vpc_id
  cidr_block              = element(var.priv_sub_cidrs, 1)
  availability_zone       = element(data.aws_availability_zones.az.names, 0)
  map_public_ip_on_launch = false
  tags = {
    Name : "${var.env_prefix}_private_data_sub_az1"
  }
}

# AZ2 SUBNETS
resource "aws_subnet" "public_sub_az2" {
  vpc_id            = var.vpc_id
  cidr_block        = element(var.pub_sub_cidrs, 1)
  availability_zone = element(data.aws_availability_zones.az.names, 1)
  tags = {
    Name : "${var.env_prefix}_public_sub_az2"
  }
}
resource "aws_subnet" "private_app_sub_az2" {
  vpc_id                  = var.vpc_id
  cidr_block              = element(var.priv_sub_cidrs, 2)
  availability_zone       = element(data.aws_availability_zones.az.names, 1)
  map_public_ip_on_launch = false
  tags = {
    Name : "${var.env_prefix}_private_app_sub_az2"
  }
}
resource "aws_subnet" "private_data_sub_az2" {
  vpc_id                  = var.vpc_id
  cidr_block              = element(var.priv_sub_cidrs, 3)
  availability_zone       = element(data.aws_availability_zones.az.names, 1)
  map_public_ip_on_launch = false
  tags = {
    Name : "${var.env_prefix}_private_data_sub_az2"
  }
}

# ROUTE TABLES
resource "aws_route_table" "pub_rt" {
  vpc_id = var.vpc_id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.my_app.id
  }
  tags = {
    Name : "${var.env_prefix}_pub_rt"
  }
}
resource "aws_route_table" "priv_rt" {
  vpc_id = var.vpc_id
  tags = {
    Name : "${var.env_prefix}_priv_rt"
  }
}

# PUBLIC ROUTE TABLE ASSOCIATIONS
resource "aws_route_table_association" "public_az1" {
  subnet_id      = aws_subnet.public_sub_az1.id
  route_table_id = aws_route_table.pub_rt.id
}
resource "aws_route_table_association" "public_az2" {
  subnet_id      = aws_subnet.public_sub_az2.id
  route_table_id = aws_route_table.pub_rt.id
}

# PRIVATE ROUTE TABLE ASSOCIATIONS
resource "aws_route_table_association" "priv_app_az1" {
  subnet_id      = aws_subnet.private_app_sub_az1.id
  route_table_id = aws_route_table.priv_rt.id
}
resource "aws_route_table_association" "priv_data_az1" {
  subnet_id      = aws_subnet.private_data_sub_az1.id
  route_table_id = aws_route_table.priv_rt.id
}
resource "aws_route_table_association" "priv_app_az2" {
  subnet_id      = aws_subnet.private_app_sub_az2.id
  route_table_id = aws_route_table.priv_rt.id
}
resource "aws_route_table_association" "priv_data_az2" {
  subnet_id      = aws_subnet.private_data_sub_az2.id
  route_table_id = aws_route_table.priv_rt.id
}

# NAT
resource "aws_eip" "eip4_nat_gw_az1" {
  domain = "vpc"
  tags = {
    Name = "eip4_nat_gw_az1"
  }
}
resource "aws_eip" "eip4_nat_gw_az2" {
  domain = "vpc"
  tags = {
    Name = "eip4_nat_gw_az2"
  }
}

resource "aws_nat_gateway" "az1" {
  allocation_id = aws_eip.eip4_nat_gw_az1.id
  subnet_id     = aws_subnet.public_sub_az1.id
  depends_on    = [aws_internet_gateway.my_app]
  tags = {
    Name = "nat_gw_az_1"
  }
}
resource "aws_nat_gateway" "az2" {
  allocation_id = aws_eip.eip4_nat_gw_az2.id
  subnet_id     = aws_subnet.public_sub_az2.id
  depends_on    = [aws_internet_gateway.my_app]
  tags = {
    Name = "nat_gw_az_2"
  }
}
