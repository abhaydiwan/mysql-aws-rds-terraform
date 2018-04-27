# Create RDS with Subnet and paramter group,
resource "aws_security_group" "sg_rds" {
  name        = "sg_rds_${var.project}_${var.environment}${var.tag}"
  description = "Security group that is needed for the RDS"
  vpc_id      = "${var.vpc_id}"

  tags {
    Name        = "${var.appcode}-${var.environment}${var.tag}-sg_rds"
    Environment = "${var.environment}"
    Project     = "${var.project}"
  }
}

resource "aws_security_group_rule" "ingress" {
  type        = "ingress"
  from_port   = 3306
  to_port     = 3306
  protocol    = "TCP"
  cidr_blocks = "${var.allowed_cidr_blocks}"

  security_group_id = "${aws_security_group.sg_rds.id}"
}

resource "aws_security_group_rule" "egress" {
  type        = "egress"
  from_port   = 3306
  to_port     = 3306
  protocol    = "TCP"
  cidr_blocks = "${var.allowed_cidr_blocks}"

  security_group_id = "${aws_security_group.sg_rds.id}"
}

output "security_group_id" {
  value = "${aws_security_group.sg_rds.id}"
}
