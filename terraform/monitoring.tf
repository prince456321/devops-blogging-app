resource "aws_cloudwatch_metric_alarm" "high_cpu_alarm" {
  alarm_name          = "BloggingApp-HighCPU"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = "2"
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = "300"
  statistic           = "Average"
  threshold           = "70"

  dimensions = {
    AutoScalingGroupName = aws_autoscaling_group.app_asg.name
  }

  alarm_description = "Alarm when EC2 CPU exceeds 70%"
  alarm_actions     = []
}
