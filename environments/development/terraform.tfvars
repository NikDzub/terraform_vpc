env_prefix = "dev"
region = "us-east-1"
my_ip = "0.0.0.0"

availability_zones = ["us-east-1b","us-east-1c"]
vpc_cidr_block = "10.0.0.0/16"

public_sub_cidr_blocks = [
    "10.0.1.0/24",
    "10.0.2.0/24",]
private_sub_cidr_blocks = [
    "10.0.100.0/24",
    "10.0.102.0/24",
    "10.0.103.0/24",
    "10.0.104.0/24",]

img_name = "amzn2-ami-*-gp2"
instance_type = "t2.micro"
public_key_location = "~/.ssh/id_rsa.pub"
private_key_location = "~/.ssh/id_rsa"

db_username = "username"
db_password = "password"