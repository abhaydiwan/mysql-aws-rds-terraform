#lookup parameters for specic RDS types
provider "aws"{
region="us-east-1"
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

variable "default_ports" {
  default = {
    mysql    = "3306"
    postgres = "5432"
    oracle   = "1521"
  }
}

locals {
  port = "${var.default_ports[var.engine]}"
}

module "db_security_group" {
  source = "./modules/db_security_group"
  vpc_id      = "${var.vpc_id}"
  environment = "${var.environment}"
  appcode     ="${var.appcode}"
  project     ="${var.project}"
  allowed_cidr_blocks = "${var.allowed_cidr_blocks}"

}

module "db_subnet_group" {
  source = "./modules/db_subnet_group"
  subnets="${var.subnets}"
  environment = "${var.environment}"
  appcode     ="${var.appcode}"
  project     ="${var.project}"

}

module "db_parameter_group" {
  source = "./modules/db_parameter_group"
  environment = "${var.environment}"
  appcode     ="${var.appcode}"
  project     ="${var.project}"

}

module "db_instance" {
  source = "./modules/db_instance"
  engine                    = "${var.engine}"
  engine_version            = "${var.engine_version}"
  instance_class            = "${var.size}"
  vpc_security_group_ids    = ["${module.db_security_group.security_group_id}"]
  db_subnet_group_name      = "${module.db_subnet_group.db_subnet_group_id}"
  parameter_group_name      = "${module.db_parameter_group.aws_db_parameter_group_name}"
  rds_username              = "${var.rds_username}"
  rds_password              = "${var.rds_password}"
  environment               = "${var.environment}"
  appcode                   = "${var.appcode}"
  project                   = "${var.project}"
}
#
# CloudWatch resources
#

resource "aws_cloudwatch_metric_alarm" "database_cpu" {
  alarm_name          = "RDS ALARM"
  alarm_description   = "Database server CPU utilization"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = "1"
  metric_name         = "CPUUtilization"
  namespace           = "AWS/RDS"
  period              = "300"
  statistic           = "Average"
  threshold           = "0"

  dimensions {
    DBInstanceIdentifier = "${module.db_instance.mysql.id}"
  }

  alarm_actions             = "arn:aws:sns:us-east-2:561046501578:MySQLAlert"  
  #ok_actions                = ["${var.ok_actions}"]
  #insufficient_data_actions = ["${var.insufficient_data_actions}"]
}
