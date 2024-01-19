# AZ1 SUBNETS
resource "aws_subnet" "public_sub_az1" {
  vpc_id            = var.vpc_id
  cidr_block        = element(var.public_sub_cidr_blocks, 0)
  availability_zone = element(var.availability_zones, 0)
  tags = {
    Name : "${var.env_prefix}_public_sub_az1"
  }
}
resource "aws_subnet" "private_app_sub_az1" {
  vpc_id                  = var.vpc_id
  cidr_block              = element(var.private_sub_cidr_blocks, 0)
  availability_zone       = element(var.availability_zones, 0)
  map_public_ip_on_launch = false
  tags = {
    Name : "${var.env_prefix}_private_app_sub_az1"
  }
}

resource "aws_subnet" "private_data_sub_az1" {
  vpc_id                  = var.vpc_id
  cidr_block              = element(var.private_sub_cidr_blocks, 1)
  availability_zone       = element(var.availability_zones, 0)
  map_public_ip_on_launch = false
  tags = {
    Name : "${var.env_prefix}_private_data_sub_az1"
  }
}

# AZ2 SUBNETS
resource "aws_subnet" "public_sub_az2" {
  vpc_id            = var.vpc_id
  cidr_block        = element(var.public_sub_cidr_blocks, 1)
  availability_zone = element(var.availability_zones, 1)
  tags = {
    Name : "${var.env_prefix}_public_sub_az2"
  }
}
resource "aws_subnet" "private_app_sub_az2" {
  vpc_id                  = var.vpc_id
  cidr_block              = element(var.private_sub_cidr_blocks, 2)
  availability_zone       = element(var.availability_zones, 1)
  map_public_ip_on_launch = false
  tags = {
    Name : "${var.env_prefix}_private_app_sub_az2"
  }
}
resource "aws_subnet" "private_data_sub_az2" {
  vpc_id                  = var.vpc_id
  cidr_block              = element(var.private_sub_cidr_blocks, 3)
  availability_zone       = element(var.availability_zones, 1)
  map_public_ip_on_launch = false
  tags = {
    Name : "${var.env_prefix}_private_data_sub_az2"
  }
}

##############################################################

# PUBLIC ROUTE TABLE ASSOCIATIONS
resource "aws_route_table_association" "public_az1" {
  subnet_id      = aws_subnet.public_sub_az1.id
  route_table_id = var.pub_rt.id
}
resource "aws_route_table_association" "public_az2" {
  subnet_id      = aws_subnet.public_sub_az2.id
  route_table_id = var.pub_rt.id
}

# PRIVATE ROUTE TABLE ASSOCIATIONS
resource "aws_route_table_association" "priv_app_az1" {
  subnet_id      = aws_subnet.private_app_sub_az1.id
  route_table_id = var.priv_rt.id
}
resource "aws_route_table_association" "priv_data_az1" {
  subnet_id      = aws_subnet.private_data_sub_az1.id
  route_table_id = var.priv_rt.id
}
resource "aws_route_table_association" "priv_app_az2" {
  subnet_id      = aws_subnet.private_app_sub_az2.id
  route_table_id = var.priv_rt.id
}
resource "aws_route_table_association" "priv_data_az2" {
  subnet_id      = aws_subnet.private_data_sub_az2.id
  route_table_id = var.priv_rt.id
}

##############################################################

# NAT EIP
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

# NAT GW
resource "aws_nat_gateway" "nat_gw_az1" {
  allocation_id = aws_eip.eip4_nat_gw_az1.id
  subnet_id     = aws_subnet.public_sub_az1.id
  depends_on    = [var.igw]
  tags = {
    Name = "nat_gw_az_1"
  }
}
resource "aws_nat_gateway" "nat_gw_az2" {
  allocation_id = aws_eip.eip4_nat_gw_az2.id
  subnet_id     = aws_subnet.public_sub_az2.id
  depends_on    = [var.igw]
  tags = {
    Name = "nat_gw_az_2"
  }
}

##############################################################

# resource "aws_db_subnet_group" "db_sub_group" {
#   name        = "${var.env_prefix}_db_subnets"
#   subnet_ids  = [aws_subnet.private_data_sub_az1.id, aws_subnet.private_data_sub_az2.id]
#   description = "subnets for db instance"

#   tags = {
#     Name = "${var.env_prefix}_db_subnets"
#   }
# }
# Error: creating RDS DB Subnet Group (dev_db_subnets): InternalFailure: API for service 'rds' not yet implemented or pro feature - please check https://docs.localstack.cloud/references/coverage/ for further information
# Relational Database Service (RDS) is supported by LocalStack only in the pro version.
