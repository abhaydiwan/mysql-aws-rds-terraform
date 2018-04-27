resource "aws_db_subnet_group" "rds" {
  name        = "${var.project}-${var.environment}${var.tag}-rds"
  description = "Our main group of subnets"
  subnet_ids  = ["${var.subnets}"]
}

output "db_subnet_group_id" {
  value = "${aws_db_subnet_group.rds.id}"
}
