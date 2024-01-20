# resource "aws_launch_configuration" "web_server_config" {
#   name          = "web-server-launch-config"
#   image_id      = "ami-xxxxxxxxxxxxxx" # Replace with your AMI ID
#   instance_type = "t2.micro"           # Replace with your desired instance type

#   # Other configuration options...
# }

# resource "aws_autoscaling_group" "web_server_asg" {
#   desired_capacity     = 2
#   max_size             = 2
#   min_size             = 1
#   vpc_zone_identifier  = [var.subnets[0].id, var.subnets[1].id] # Replace with your subnet IDs
#   launch_configuration = aws_launch_configuration.web_server_config.id

#   # Additional settings like health check, load balancer attachment, etc.
#   health_check_type         = "EC2"
#   health_check_grace_period = 300  # Adjust as needed
#   force_delete              = true # Automatically terminate instances on scale in

#   # Attach the Auto Scaling Group to a load balancer if needed
#   # load_balancers = ["your-load-balancer-name"]
# }

# resource "aws_launch_template" "name" {

# }
