resource "aws_db_parameter_group" "this" {
  description = var.rds_param_description
  name        = "${replace(lower(var.rds_param_name), "_", "-")}-rds-paramgrp"
  family      = var.rds_param_family

  parameter {
    name  = "timezone"
    value = var.rds_param_timezone
  }

    tags = merge(
    {
      "Name" = format("%s-rds-paramgrp", var.rds_param_name)
    },
    local.common_tags,
  )
}