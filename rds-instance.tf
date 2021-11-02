/*
resource "random_password" "this" {
  length = 16
  special = true
  override_special = "_%@"
}
*/

resource "aws_db_instance" "this" {
  identifier                = "${replace(lower(var.rds_name), "_", "-")}-rds"
  engine                    = var.engine
  engine_version            = var.engine_version
  instance_class            = var.instance_class

  storage_type              = var.storage_type
  allocated_storage         = var.allocated_storage
  max_allocated_storage     = var.max_allocated_storage
  backup_retention_period   = var.backup_retention_period
  copy_tags_to_snapshot     = var.copy_tags_to_snapshot
  deletion_protection       = var.deletion_protection
  db_subnet_group_name      = aws_db_subnet_group.this.name
  multi_az                  = var.multi_az
  storage_encrypted         = var.storage_encrypted
  #kms_key_id                = var.kms_arn_rds
  
  final_snapshot_identifier = "${replace(lower(var.rds_name), "_", "-")}-snapshot-final"
 
  username                  = var.username
  password                  = var.password
  //password                  = random_password.this.result
  
  vpc_security_group_ids    = [aws_security_group.this[0].id]
  parameter_group_name      = aws_db_parameter_group.this.name
  publicly_accessible       = var.publicly_accessible
  port                      = var.rds_port

  # Monitoring
  monitoring_interval       = var.monitoring_interval

  # Maintenance
  allow_major_version_upgrade  = var.major_ver_upgrade
  auto_minor_version_upgrade   = var.minor_ver_upgrade
  //maintenance_window          =
  apply_immediately            = var.apply_immediately

  depends_on = [
    #aws_security_group.this,
    aws_db_subnet_group.this,
    aws_db_parameter_group.this
  ]

  tags = merge(
    {
      "Name" = format("%s-rds", var.rds_name)
    },
    local.common_tags,
  )
}
