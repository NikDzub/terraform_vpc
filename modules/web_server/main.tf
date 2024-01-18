resource "aws_security_group" "alb" {
  name        = "alb"
  description = "http/https access on port 80/443"
  vpc_id      = var.vpc_id

  ingress {
    description = "http"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    description = "https"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name : "${var.env_prefix}_alb_sg"
  }
}

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

resource "aws_key_pair" "my_app" {
  key_name   = "${var.env_prefix}_server_key"
  public_key = file("${var.public_key_location}")

}


resource "aws_instance" "myapp_server" {
  ami           = data.aws_ami.latest_amazon_linux.id
  instance_type = var.instance_type

  subnet_id              = var.private_app_sub_az1_id
  vpc_security_group_ids = [aws_security_group.alb.id]
  availability_zone      = var.availability_zone

  associate_public_ip_address = true
  key_name                    = aws_key_pair.my_app.key_name
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
    Name = "${var.env_prefix}_myapp_server"
  }

}
