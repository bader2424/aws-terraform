resource "aws_db_subnet_group" "db_subnet" {
  name       = "${var.environment}-db-subnet"
  subnet_ids = var.private_subnet_ids

  tags = {
    Name = "${var.environment}-db-subnet"
    Env  = var.environment
  }
}

resource "aws_db_instance" "postgres" {
  identifier           = "${var.environment}-postgres"
  engine               = "postgres"
  instance_class       = "db.t3.micro"
  allocated_storage    = 20
  username             = "admin"
  password             = "Password123!"
  db_subnet_group_name = aws_db_subnet_group.db_subnet.name
  skip_final_snapshot  = true

  tags = {
    Name = "${var.environment}-postgres"
    Env  = var.environment
  }
}
