# resource "aws_autoscaling_group" "web_server_asg" {
#   desired_capacity    = 2
#   max_size            = 2
#   min_size            = 1
#   vpc_zone_identifier = [var.private_app_subs[0].id, var.private_app_subs[1].id]
#   launch_template {
#     id = var.launch_template.id
#   }


#   health_check_type         = "EC2"
#   health_check_grace_period = 300
#   force_delete              = true

#   #   load_balancers = var.load_balancers
# }


