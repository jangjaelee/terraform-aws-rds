resource "aws_db_subnet_group" "this" {
  name        = "${replace(lower(var.rds_subnet_name), "_", "-")}-rds-sngrp"
  description = var.rds_subnet_description
  subnet_ids  = data.aws_subnet_ids.this.ids

  tags = merge(
    {
      "Name" = format("%s-rds-sngrp", var.rds_subnet_name)
    },
    local.common_tags,
  )
}