# Amazon RDS Terraform module

Terraform module which creates RDS resources on AWS.

These types of resources are supported:

* [RDS DB Instance](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/db_instance)
* [RDS Subnet Group](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/db_subnet_group)
* [RDS Parameter Group](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/db_parameter_group)
* [SecurityGroup](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group)



## Usage
### Create RDS

main.tf
```hcl
module "rds" {
  source = "git@github.com:jangjaelee/terraform-aws-rds.git"

  vpc_name                = local.vpc_name
  rds_name                = local.vpc_name
  engine                  = "postgres"
  engine_version          = "10.12"
  instance_class          = "db.t3.medium"
  storage_type            = "gp2"
  allocated_storage       = 50
  max_allocated_storage   = 100
  backup_retention_period = 15
  deletion_protection     = true
  multi_az                = true
  storage_encrypted       = true
  kms_arn_rds             = ""
  #kms_arn_rds             = "arn:aws:kms:ap-northeast-2:331286438690:key/0484060c-3ad2-439a-9600-c17d529312ed"  
  publicly_accessible     = false

  username                = "database"
  password                = "database!@#"

  rds_port                = 55432
  rds_protocol            = "tcp"
  egress-sg-rule          = ["0.0.0.0/0"]  // default is ["0.0.0.0/0"]
  ingress-sg-rule         = ["10.240.0.0/17"]  // default is ["0.0.0.0/0"]

  #create_securitygroup    = "false"  // default is true
  #vpc_security_group_ids  = ""

  rds_param_name          = local.cluster_name
  rds_param_description   = "DEV duplication for PostgresSQL of Terraform Platform"
  rds_param_family        = "postgres10"
  rds_param_timezone      = "Asia/Seoul"

  rds_subnet_name         = local.cluster_name
  rds_subnet_description  = "DEV duplication for PostgresSQL of Terraform Platform"

  monitoring_interval     = 0
  major_ver_upgrade       = false
  minor_ver_upgrade       = true
  apply_immediately       = true

  private_sub_env1 = "pri1"
  private_sub_env2 = "pri2"
  env = "dev"
}
```

locals.tf
```hcl
locals {
  vpc_name = "KubeSphere-dev"
  cluster_name = "KubeSphere-v121-dev"
  cluster_version = "1.21"
}
```

providers.tf
```hcl
provider "aws" {
  version = ">= 3.2.0"
  region = var.region
  allowed_account_ids = var.account_id
  profile = "eks_service"
}
```

terraform.tf
```hcl
terraform {
  required_version = ">= 0.13.0"

  backend "s3" {
    bucket = "kubesphere-terraform-state-backend"
    key = "kubesphere/rds/terraform.tfstate"
    region = "ap-northeast-2"
    dynamodb_table = "kubesphere-terraform-state-locks"
    encrypt = true
    profile = "eks_service"
  }
}
```

variables.tf
```hcl
variable "region" {
  description = "AWS Region"
  type        = string
  default     = "ap-northeast-2"
}

variable "account_id" {
  description = "List of Allowed AWS account IDs"
  type        = list(string)
  default     = ["123456789012"]
}
```
