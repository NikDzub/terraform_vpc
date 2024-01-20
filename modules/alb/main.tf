# resource "aws_alb" "main" {
#   name                       = "${var.env_prefix}alb"
#   internal                   = false
#   load_balancer_type         = "application"
#   security_groups            = [var.security_groups[0].id]
#   subnets                    = [var.subnets[0].id, var.subnets[1].id] # do for in
#   enable_deletion_protection = true

#   tags = {
#     Name = "${var.env_prefix}_alb"
#   }
# }

# https://docs.localstack.cloud/references/coverage/coverage_elbv2/

# Elastic Load Balancer v2 (ELB v2) is supported by LocalStack
# only in the pro version.

# Error: reading ELBv2 Load Balancer (devalb): InvalidClientTokenId: The security token included in the request is invalid.
# status code: 403, request id: 9f59b514-7c8a-440f-bf52-7d310b399a35
