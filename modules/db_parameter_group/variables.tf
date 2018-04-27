variable "rds_custom_parameter_group_name" {
  description = "A custom parameter group name to attach to the RDS instance. If not provided a default one will be created"
  default     = ""
}

variable "default_parameter_group_family" {
  description = "Parameter group family for the default parameter group, according to the chosen engine and engine version. Will be omitted if `rds_custom_parameter_group_name` is provided. Defaults to mysql5.7"
  default     = "mysql5.7"
}

variable "engine" {
  description = "RDS engine: mysql, oracle, postgres. Defaults to mysql"
  default     = "mysql"
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
