# resource "aws_db_instance" "master_db" {
#   db_name                = "app_db"
#   username               = var.db_username
#   password               = var.db_password
#   instance_class         = "db.t2.micro"
#   allocated_storage      = 10
#   db_subnet_group_name   = var.db_sub_group.name
#   vpc_security_group_ids = [var.security_groups[0].id]
#   engine                 = "mysql"
#   engine_version         = "8.0.31"
#   multi_az               = true
#   identifier             = "${var.env_prefix}rdsinstance"
#   availability_zone      = var.availability_zones[0]

# }
