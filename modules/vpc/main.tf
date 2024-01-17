resource "aws_vpc" "my_app" {
  cidr_block           = var.vpc_cidr_block
  instance_tenancy     = "default"
  enable_dns_hostnames = true
  tags = {
    Name : "${var.env_prefix}_vpc"
  }
}

resource "aws_subnet" "myapp_1" {
  vpc_id            = aws_vpc.my_app.id
  cidr_block        = var.subnet_cidr_block
  availability_zone = var.availability_zone
  tags = {
    Name : "${var.env_prefix}_subnet_1"
  }
}

resource "aws_internet_gateway" "my_app" {
  vpc_id = aws_vpc.my_app.id
  tags = {
    Name : "${var.env_prefix}_internet_gateway"
  }
}

resource "aws_route_table" "my_app" {
  vpc_id = aws_vpc.my_app.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.my_app.id
  }
  tags = {
    Name : "${var.env_prefix}_route_table"
  }
}

resource "aws_route_table_association" "myapp_1" {
  subnet_id      = aws_subnet.myapp_1.id
  route_table_id = aws_route_table.my_app.id
}

resource "aws_security_group" "myapp_1" {
  name   = "myapp_1_sg"
  vpc_id = aws_vpc.my_app.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.my_ip]
  }
  ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks     = ["0.0.0.0/0"]
    prefix_list_ids = []
  }
  tags = {
    Name : "${var.env_prefix}_sg"
  }
}

data "aws_ami" "latest_amazon_linux" {
  most_recent = true
  owners      = ["amazon"]
  filter {
    name   = "name"
    values = ["amzn2-ami-*-gp2"]
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

output "server_pub_ip" {
  value = aws_instance.myapp_server.public_ip
}

resource "aws_instance" "myapp_server" {
  ami           = data.aws_ami.latest_amazon_linux.id
  instance_type = var.instance_type

  subnet_id              = aws_subnet.myapp_1.id
  vpc_security_group_ids = [aws_security_group.myapp_1.id]
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
  user_data = file("../../modules/vpc/entry_script.sh")
  tags = {
    Name = "${var.env_prefix}_myapp_server"
  }

}
