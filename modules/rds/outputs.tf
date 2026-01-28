output "db_instance_id" {
  value = aws_db_instance.postgres.id
}

output "db_subnet_group_name" {
  value = aws_db_subnet_group.db_subnet.name
}
