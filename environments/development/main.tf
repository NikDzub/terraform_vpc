# module "s3" { #[bucket, bucket_acl]
#   source     = "../../modules/s3"
#   env_prefix = var.env_prefix
# }

module "vpc" { # [igw, pub_rt, priv_rt]
  source     = "../../modules/vpc"
  env_prefix = var.env_prefix

  vpc_cidr_block = var.vpc_cidr_block
}

module "subnet" { # [pub/priv_subs, rt_associs, eip, nat_gw]
  source     = "../../modules/subnet"
  env_prefix = var.env_prefix

  vpc_id  = module.vpc.vpc_id
  igw     = module.vpc.igw
  pub_rt  = module.vpc.pub_rt
  priv_rt = module.vpc.priv_rt

  availability_zones      = var.availability_zones
  public_sub_cidr_blocks  = var.public_sub_cidr_blocks
  private_sub_cidr_blocks = var.private_sub_cidr_blocks
}

module "security_group" {
  source     = "../../modules/security_group"
  env_prefix = var.env_prefix

  vpc_id = module.vpc.vpc_id
}

module "web_server" {
  source     = "../../modules/web_server"
  env_prefix = var.env_prefix

  img_name            = var.img_name
  instance_type       = var.instance_type
  availability_zones  = var.availability_zones
  public_key_location = var.public_key_location

  private_app_sub_az1 = module.subnet.private_app_sub_az1
  private_app_sub_az2 = module.subnet.private_app_sub_az2
  security_groups     = [module.security_group.alb_sg]
}
