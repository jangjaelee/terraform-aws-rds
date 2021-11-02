resource "aws_security_group" "this" {
  count       = var.create_securitygroup ? 1 : 0

  name        = "${var.vpc_name}-RDS-sg"
  description = "${var.vpc_name} RDS instance security group"
  vpc_id = data.aws_vpc.this.id

  ingress {
    description = "Ingress Security Group Rule for RDS"
    from_port   = var.rds_port
    to_port     = var.rds_port
    protocol    = var.rds_protocol
    #cidr_blocks = ["0.0.0.0/0"]
    cidr_blocks = var.ingress-sg-rule
  }

  egress {
    description = "Egress Security Group Rule for RDS"    
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    #cidr_blocks = ["0.0.0.0/0"]
    cidr_blocks = var.egress-sg-rule
  }

  tags = merge(
    {
      "Name" = format("%s-rds-sg", var.vpc_name)
    },
    local.common_tags,
  )
}