output "aws_master_host" {
  value = aws_db_instance.master.address
}

output "aws_slave_hosts" {
  value = length(aws_db_instance.slaves) >= 1 ? aws_db_instance.slaves[*].address : null
}

output "master_db_user" {
  sensitive = true
  value     = aws_db_instance.master.username
}

output "master_db_password" {
  sensitive = true
  value     = aws_db_instance.master.password
}

output "master_db_name" {
  value = aws_db_instance.master.name
}
