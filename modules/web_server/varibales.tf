variable "vpc_id" {}
variable "my_ip" {}
variable "env_prefix" {}
variable "img_name" {
  default = "amzn2-ami-*-gp2"
}
variable "public_key_location" {}
variable "instance_type" {
  default = "t2.micro"
}
variable "availability_zone" {}
variable "private_app_sub_az1_id" {}
