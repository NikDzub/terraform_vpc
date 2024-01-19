output "alb_sg" {
  value = aws_security_group.alb_sg
}
output "ssh_sg" {
  value = aws_security_group.ssh_sg
}
output "web_server_sg" {
  value = aws_security_group.web_server_sg
}
output "db_sg" {
  value = aws_security_group.db_sg
}
