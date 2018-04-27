

resource "aws_db_parameter_group" "rds" {
  count       = "${length(var.rds_custom_parameter_group_name) == 0 ? 1 : 0}"
  name_prefix = "${var.engine}-${var.appcode}-${var.environment}${var.tag}-"
  family      = "${var.default_parameter_group_family}"
  description = "RDS ${var.project} ${var.environment} parameter group for ${var.engine}"
  parameter   = "${var.default_db_parameters[var.engine]}"
}

output "aws_db_parameter_group_name" {
  value = "${aws_db_parameter_group.rds.name}"
}
