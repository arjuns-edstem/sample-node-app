resource "aws_cloudwatch_log_group" "logs" {
  name = "/fargate/service/${local.cloudwatch_group}"
  retention_in_days = var.logs_retention_in_days
  tags = merge(local.tags, {
    Name = local.cloudwatch_group
  })
}
