resource "aws_vpc" "my_app" {
  cidr_block           = var.vpc_cidr_block
  instance_tenancy     = "default"
  enable_dns_hostnames = true
  tags = {
    Name : "${var.env_prefix}_vpc"
  }
}

module "subnet" {
  source     = "../subnet"
  vpc_id     = aws_vpc.my_app.id
  env_prefix = var.env_prefix
}

module "web_server" {
  source                 = "../web_server"
  vpc_id                 = aws_vpc.my_app.id
  env_prefix             = var.env_prefix
  public_key_location    = var.public_key_location
  availability_zone      = var.availability_zone
  my_ip                  = var.my_ip
  instance_type          = var.instance_type
  private_app_sub_az1_id = module.subnet.private_app_sub_az1_id
}




