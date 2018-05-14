resource "aws_cloudwatch_metric_alarm" "db_cloudwtach_alarm" {
  alarm_name          = "${var.alarm_name}"
  alarm_description   = "${var.alarm_description}"
  comparison_operator = "${var.comparison_operator}"
  evaluation_periods  = "${var.evaluation_periods}"
  metric_name         = "${var.metric_name}"
  namespace           = "${var.namespace}"
  period              = "${var.period}"
  statistic           = "${var.statistic}"
  threshold           = "${var.threshold}"

  dimensions {
    DBInstanceIdentifier = "${var.aws_rds_id}"
  }

  alarm_actions             = ["${var.alarm_sns}"]
  #ok_actions                = ["${var.ok_actions} arn:aws:sns:us-east-1:561046501578:MySQLRDSAlert"]
  #insufficient_data_actions = ["${var.insufficient_data_actions}"
}
