data "aws_vpc" "this" {
  filter {
    name   = "tag:Name"
    values = ["${var.vpc_name}-vpc"]
  }
}

data "aws_subnet_ids" "this" {
  vpc_id = data.aws_vpc.this.id

  filter {
    name   = "tag:Name"
    values = ["${var.vpc_name}-private-${var.private_sub_env1}-sn"]
  }
}