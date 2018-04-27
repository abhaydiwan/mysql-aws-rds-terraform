variable "subnets" {
  type        = "list"
  description = "Subnets to deploy in"
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
