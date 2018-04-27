variable "rds_custom_parameter_group_name" {
  description = "A custom parameter group name to attach to the RDS instance. If not provided a default one will be created"
  default     = ""
}

variable "default_parameter_group_family" {
  description = "Parameter group family for the default parameter group, according to the chosen engine and engine version. Will be omitted if `rds_custom_parameter_group_name` is provided. Defaults to mysql5.7"
  default     = "mysql5.7"
}

variable "engine" {
  description = "The database engine to use"
}

variable "engine_version" {
  description = "The engine version to use"
}

variable "final_snapshot_identifier" {
  description = "The name of your final DB snapshot when this DB instance is deleted."
  default     = false
}

variable "number" {
  description = "number of the database default 01"
  default     = "01"
}

variable "rds_password" {
  description = "RDS root password"
}

variable "rds_username" {
  description = "RDS root user"
  default = "root"
}


variable "replicate_source_db" {
  description = "RDS source to replicate from"
  default     = ""
}


variable "vpc_security_group_ids" {
  description = "List of VPC security groups to associate"
  default     = []
}

variable "db_subnet_group_name" {
  description = "RDS source to replicate from"
  default     = ""
}

variable "parameter_group_name" {
  description = "RDS source to replicate from"
  default     = ""
}
variable "storage_type" {
  description = "Type of storage you want to use"
  default     = "gp2"
}


variable "skip_final_snapshot" {
  description = "Skip final snapshot when destroying RDS"
  default     = false
}

variable "availability_zone" {
  description = "The availability zone where you want to launch your instance in"
  default     = ""
}

variable "snapshot_identifier" {
  description = "Specifies whether or not to create this database from a snapshot. This correlates to the snapshot ID you'd find in the RDS console, e.g: rds:production-2015-06-26-06-05."
  default     = ""
}

variable "instance_class" {
  description = "The instance type of the RDS instance"
}

variable "storage" {
  description = "How many GBs of space does your database need?"
  default     = "10"
}
variable "size" {
  description = "Instance size"
  default     = "db.t2.micro"
}
variable "multi_az" {
  description = "Multi AZ true or false"
  default     = false
}

variable "backup_retention_period" {
  description = "How long do you want to keep RDS backups"
  default     = "14"
}
variable "apply_immediately" {
  description = "Apply changes immediately"
  default     = true
}

variable "storage_encrypted" {
  description = "Encrypt RDS storage"
  default     = false
}
variable "environment" {
  description = "How do you want to call your environment, this is helpful if you have more than 1 VPC."
  default     = "dev"
}

variable "appcode" {
  description = "AppCode based on CMDB environment"
  default     = "CDA"
}

variable "project" {
  description = "The current project"
  default     = "rds"
}

variable "tag" {
  description = "A tag used to identify an RDS in a project that has more than one RDS"
  default     = "rds"
}
variable "default_db_parameters" {
  default = {
    mysql = [
      {
        name  = "slow_query_log"
        value = "1"
      },
      {
        name  = "long_query_time"
        value = "1"
      },
      {
        name  = "general_log"
        value = "0"
      },
      {
        name  = "log_output"
        value = "FILE"
      },
    ]

    postgres = []
    oracle   = []
  }
}
