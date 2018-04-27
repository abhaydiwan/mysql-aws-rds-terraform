variable "vpc_id" {
  description = "ID of the VPC where to deploy in"
}

variable "security_groups" {
  description = "Security groups that are allowed to access the RDS"
  type        = "list"
  default     = []
}

variable "allowed_cidr_blocks" {
  description = "CIDR blocks that are allowed to access the RDS"
  type        = "list"
  default     = []
}

variable "environment" {
  description = "How do you want to call your environment, this is helpful if you have more than 1 VPC."
  default     = "dev"
}

variable "appcode" {
  description = "AppCode based on CMDB environment"
  default     = "cda"
}

variable "project" {
  description = "The current project"
  default     = "rds"
}

variable "tag" {
  description = "A tag used to identify an RDS in a project that has more than one RDS"
  default     = "rds"
}
