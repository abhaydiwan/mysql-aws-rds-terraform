
resource "aws_db_instance" "rds" {
  identifier                = "${var.project}-${var.environment}${var.tag}-rds${var.number}"
  allocated_storage         = "${var.storage}"
  engine                    = "${var.engine}"
  engine_version            = "${var.engine_version}"
  instance_class            = "${var.size}"
  storage_type              = "${var.storage_type}"
  username                  = "${var.rds_username}"
  password                  = "${var.rds_password}"
  vpc_security_group_ids    = ["${var.vpc_security_group_ids}"]
  db_subnet_group_name      = "${var.db_subnet_group_name}"
  parameter_group_name      = "${var.parameter_group_name}"
  multi_az                  = "${var.multi_az}"
  replicate_source_db       = "${var.replicate_source_db}"
  backup_retention_period   = "${var.backup_retention_period}"
  storage_encrypted         = "${var.storage_encrypted}"
  apply_immediately         = "${var.apply_immediately}"
  skip_final_snapshot       = "${var.skip_final_snapshot}"
  final_snapshot_identifier = "${var.project}-${var.environment}${var.tag}-rds${var.number}-final-${md5(timestamp())}"
  availability_zone         = "${var.availability_zone}"
  snapshot_identifier       = "${var.snapshot_identifier}"

  tags {

    Name         = "${var.project}-${var.environment}${var.tag}-rds${var.number}"
    Tech.Env     = "${var.environment}"
    Tech.AppCode ="${var.appcode}"
    Project      = "${var.project}"
  }

  lifecycle {
    ignore_changes = ["final_snapshot_identifier"]
  }
}

output "aws_rds_id" {
  value = "${aws_db_instance.rds.id}"
}
