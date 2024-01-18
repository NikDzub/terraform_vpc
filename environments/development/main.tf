data "aws_caller_identity" "current" {}
output "is_localstack" {
  value = data.aws_caller_identity.current.id == "000000000000"
}

module "vpc" {
  source               = "../../modules/vpc"
  env_prefix           = var.env_prefix
  vpc_cidr_block       = var.vpc_cidr_block
  subnet_cidr_block    = var.subnet_cidr_block
  availability_zone    = var.availability_zone
  my_ip                = var.my_ip
  instance_type        = var.instance_type
  public_key_location  = var.public_key_location
  private_key_location = var.private_key_location
}
