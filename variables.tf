variable "vpc_name" {
  description = "Name to be used on all the resources as identifier for VPC"
  type        = string
}

variable "rds_name" {
  description = "Name of RDS instance"
  type        = string
}

variable "engine" {
  description = "Database engine to be used for this instance"
  type        = string
}

variable "engine_version" {
  description = "The version number of the database engine to use"
  type        = string
}

variable "instance_class" {
  description = "The compute and memory capacity of the DB instance"
  type        = string
}

variable "storage_type" {
  description = "Storage Type for RDS"
  type        = string
  default     = "io1"
}

variable "allocated_storage" {
  description = "The amount of storage (in gibibytes) to allocate for the DB instance"
  type        = number
}

variable "max_allocated_storage" {
  description = "The amount of storage (in gibibytes) to allocate for the DB instance"
  type        = number
}

variable "backup_retention_period" {
  description = "The number of days for which automated backups are retained"
  type        = number
  default     = 0
}

variable "copy_tags_to_snapshot" {
  description = "Indicates whether to copy tags from the DB instance to snapshots of the DB instance"
  type        = bool
  default     = true
}

variable "deletion_protection" {
  description = "Indicates whether the DB instance has deletion protection enabled"
  type        = bool
}

variable "multi_az" {
  description = "Indicates whether the DB instance is a Multi-AZ deployment"
  type        = bool
}

variable "storage_encrypted" {
  description = "Indicates whether the DB instance is encrypted"
  type        = bool
}

variable "kms_arn_rds" {
	description = "KMS ARN for RDS Storage"
	type        = string
}

variable "username" {
  description = "The name for the master user"
  type        = string
}

variable "password" {
  description = "The password for the master user"
  type        = string
}

variable "publicly_accessible" {
  description = "(optional) describe your variable"
  type        = bool  
  default     = false
}

variable "rds_port" {
  description = "The database port"
  type        = number
}

variable "rds_protocol" {
  description = "RDS connection & security group protocol"
  type        = string
}

variable "egress-sg-rule" {
  description = "egress security group rule for RDS"
  type        = list(string)
  default     = ["0.0.0.0/0"]
}

variable "ingress-sg-rule" {
  description = "ingress security group rule for RDS"
  type        = list(string)
  default     = ["0.0.0.0/0"]
}

variable "create_securitygroup" {
  description = "Create Security Gorup for RDS"
  type        = bool
  default     = true
}

/*
variable "vpc_security_group_ids" {
  description = "List of Amazon EC2 VPC security groups to associate with this DB instance"
  type        = list(string)
}
*/

variable "rds_param_name" {
  description = "Identifier for the DB parameter group"
  type        = string
}

variable "rds_param_description" {
  description = "Description for the DB parameter group"
  type        = string
}

variable "rds_param_family" {
  description = "DB family that this DB parameter group will apply to"
  type        = string
}

variable "rds_param_timezone" {
  description = "timezone of RDS"
  type        = string
  default     = "Asia/Seoul"
}

variable "rds_subnet_name" {
  description = "Name of RDS Subnet Groups"
  type        = string
}

variable "rds_subnet_description" {
  description = "Description of RDS Subnet Groups"
  type        = string
}

variable "monitoring_interval" {
  description = "The interval, in seconds, between points when Enhanced Monitoring metrics are collected for the DB instance. To disable collecting Enhanced Monitoring metrics, specify 0"
  type        = number
  default     = 60
}

variable "major_ver_upgrade" {
  description = "Indicates that major version upgrades are allowed. Changing this parameter does not result in an outage and the change is asynchronously applied as soon as possible."
  type        = bool
  default     = false
}

variable "minor_ver_upgrade" {
  description = "Indicates that minor engine upgrades will be applied automatically to the DB instance during the maintenance window."
  type        = bool
  default     = true
}

variable "apply_immediately" {
  description = "Specifies whether any database modifications are applied immediately, or during the next maintenance window"
  type        = bool
  default     = false
}

variable "private_sub_env1" {
  description = "Private Sub-Environment 1"
  type        = string
  default     = ""
}

variable "private_sub_env2" {
  description = "Private Sub-Environment 2"
  type        = string
  default     = ""
}

variable "env" {
  description = "Environment"
  type        = string
}