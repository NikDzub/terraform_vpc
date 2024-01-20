data "aws_ami" "latest_amazon_linux" {
  most_recent = true
  owners      = ["amazon"]
  filter {
    name   = "name"
    values = [var.img_name]
  }
  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

resource "aws_key_pair" "web_server" {
  key_name   = "${var.env_prefix}_server_key"
  public_key = file("${var.public_key_location}")

}

resource "aws_launch_template" "web_server_template" {
  name                   = "web-server-template"
  image_id               = data.aws_ami.latest_amazon_linux.id
  instance_type          = var.instance_type
  user_data              = file("../../modules/web_server/entry_script.sh")
  key_name               = aws_key_pair.web_server.key_name
  vpc_security_group_ids = [var.security_groups[0].id, var.security_groups[1].id]
}

# todo - add count for az and subnets
# WEBSERVER PRIVATE APP SUBNET - AZ1
resource "aws_instance" "web_server" {
  count                       = length(var.private_app_subs)
  ami                         = aws_launch_template.web_server_template.image_id
  instance_type               = aws_launch_template.web_server_template.instance_type
  subnet_id                   = element(var.private_app_subs, count.index).id
  vpc_security_group_ids      = aws_launch_template.web_server_template.vpc_security_group_ids
  availability_zone           = element(var.availability_zones, count.index)
  associate_public_ip_address = true
  key_name                    = aws_launch_template.web_server_template.key_name
  user_data                   = aws_launch_template.web_server_template.user_data

  tags = {
    Name = "${var.env_prefix}_web_server_server_az1"
  }
}

# WEBSERVER PRIVATE APP SUBNET - AZ2
# resource "aws_instance" "web_server_az2" {
#   count                       = length(private_app_subs)
#   ami                         = aws_launch_template.web_server_template.image_id
#   instance_type               = aws_launch_template.web_server_template.instance_type
#   subnet_id                   = var.private_app_sub_az2.id
#   vpc_security_group_ids      = aws_launch_template.web_server_template.vpc_security_group_ids
#   availability_zone           = var.availability_zones[1]
#   associate_public_ip_address = true
#   key_name                    = aws_launch_template.web_server_template.key_name
#   user_data                   = aws_launch_template.web_server_template.user_data

#   tags = {
#     Name = "${var.env_prefix}_web_server_server_az1"
#   }
# }

# OLD - WEBSERVER PRIVATE APP SUBNET - AZ2
# resource "aws_instance" "web_server_az2" {
#   ami           = data.aws_ami.latest_amazon_linux.id
#   instance_type = var.instance_type

#   subnet_id              = var.private_app_sub_az2.id
#   vpc_security_group_ids = [var.security_groups[0].id]
#   availability_zone      = var.availability_zones[1]

#   associate_public_ip_address = true
#   key_name                    = aws_key_pair.web_server.key_name

#   # connection {
#   #   type        = "ssh"
#   #   host        = self.public_ip
#   #   user        = "ec2-user"
#   #   private_key = var.private_key_location
#   # }
#   # provisioner "file" {
#   #   source      = "./entry_script.sh"
#   #   destination = "/home/ec2-user/entry_script.sh"
#   # }
#   # provisioner "remote-exec" {
#   #   script = file("entry_script.sh")
#   # }
#   # provisioner "local-exec" {
#   #   command = "echo ${self.public_ip}"
#   # }

#   user_data = file("../../modules/web_server/entry_script.sh")
#   tags = {
#     Name = "${var.env_prefix}_web_server_server_az1"
#   }
# }
