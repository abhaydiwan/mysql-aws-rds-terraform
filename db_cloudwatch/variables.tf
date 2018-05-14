variable "alarm_name" {
  description = "Name of the alarm"
  default     = ""
}

variable "alarm_description" {
  description = "Alaram Description"
  default     = ""
}

variable "comparison_operator" {
  description = "comparison operator"
}

variable "evaluation_periods" {
  description = "evaluation periods"
}

variable "metric_name" {
  description = "metric name"
  default     = ""
}

variable "namespace" {
  description = "namespace"
  default     = ""
}

variable "period" {
  description = "period"
}

variable "statistic" {
  description = "statistic"
  default = ""
}


variable "threshold" {
  description = "threshold"
  default     = ""
}


variable "aws_rds_id" {
  description = "aws_rds_id"
  default     = ""
}

variable "alarm_sns" {
  description = "alarm_sns"
  default     = ""
}
