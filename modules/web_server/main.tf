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

resource "aws_key_pair" "nginx_server" {
  key_name   = "${var.env_prefix}_server_key"
  public_key = file("${var.public_key_location}")

}

resource "aws_instance" "nginx_server" {
  ami           = data.aws_ami.latest_amazon_linux.id
  instance_type = var.instance_type

  subnet_id              = var.private_app_sub_az1.id
  vpc_security_group_ids = [var.security_groups[0].id]
  availability_zone      = var.availability_zones[0]

  associate_public_ip_address = true
  key_name                    = aws_key_pair.nginx_server.key_name

  # connection {
  #   type        = "ssh"
  #   host        = self.public_ip
  #   user        = "ec2-user"
  #   private_key = var.private_key_location
  # }
  # provisioner "file" {
  #   source      = "./entry_script.sh"
  #   destination = "/home/ec2-user/entry_script.sh"
  # }
  # provisioner "remote-exec" {
  #   script = file("entry_script.sh")
  # }
  # provisioner "local-exec" {
  #   command = "echo ${self.public_ip}"
  # }

  user_data = file("../../modules/web_server/entry_script.sh")
  tags = {
    Name = "${var.env_prefix}_nginx_server_az1"
  }
}
