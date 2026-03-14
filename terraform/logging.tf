resource "aws_cloudwatch_log_group" "app_logs" {
  name              = "blogging-app-logs"
  retention_in_days = 14
}
