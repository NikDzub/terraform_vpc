output "vpc_id" {
  value = aws_vpc.main.id
}
output "vpc" {
  value = aws_vpc.main
}
output "igw" {
  value = aws_internet_gateway.igw
}
output "pub_rt" {
  value = aws_route_table.pub_rt
}
output "priv_rt" {
  value = aws_route_table.priv_rt
}
