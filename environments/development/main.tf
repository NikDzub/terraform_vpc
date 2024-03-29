module "s3" { #[bucket, bucket_acl]
  source     = "../../modules/s3"
  env_prefix = var.env_prefix
}

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

module "security_group" { # [alb_sg, ssh_sg]
  source     = "../../modules/security_group"
  env_prefix = var.env_prefix

  vpc_id = module.vpc.vpc_id
  vpc    = module.vpc.vpc
  my_ip  = var.my_ip
}

module "web_server" { # [key_pair, ec2's, launch_template]
  source     = "../../modules/web_server"
  env_prefix = var.env_prefix

  img_name            = var.img_name
  instance_type       = var.instance_type
  availability_zones  = var.availability_zones
  public_key_location = var.public_key_location

  private_app_subs = [module.subnet.private_app_sub_az1, module.subnet.private_app_sub_az2]
  security_groups  = [module.security_group.alb_sg, module.security_group.web_server_sg]
}

module "alb" { # [aws_alb]
  source     = "../../modules/alb"
  env_prefix = var.env_prefix

  security_groups = [module.security_group.alb_sg]
  subnets         = [module.subnet.public_sub_az1, module.subnet.public_sub_az2]
}
# https://docs.localstack.cloud/references/coverage/coverage_elbv2/
# Elastic Load Balancer v2 (ELB v2) is supported by LocalStack only in the pro version.

module "db" { # [db_instance]
  source     = "../../modules/db"
  env_prefix = var.env_prefix

  db_username        = var.db_username
  db_password        = var.db_password
  availability_zones = var.availability_zones

  # db_sub_group       = module.subnet.db_sub_group
  security_groups = [module.security_group.db_sg]
}
# https://docs.localstack.cloud/references/coverage/coverage_rds/#createdbsubnetgroup
# Relational Database Service (RDS) is supported by LocalStack only in the pro version.

module "asg" {
  source     = "../../modules/asg"
  env_prefix = var.env_prefix

  launch_template  = module.web_server.launch_template
  private_app_subs = [module.subnet.private_app_sub_az1, module.subnet.private_app_sub_az2]
  # load_balancers   = [module.alb.main]
  load_balancers = []
}
# https://docs.localstack.cloud/references/coverage/coverage_autoscaling/#createautoscalinggroup
# Auto Scaling is supported by LocalStack only in the pro version.

module "route_53" { # [oute53_zone, route53_record]
  source     = "../../modules/route_53"
  env_prefix = var.env_prefix

  vpc_id = module.vpc.vpc_id

}
