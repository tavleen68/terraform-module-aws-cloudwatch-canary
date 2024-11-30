resource "aws_iam_role" "canary" {
  name = var.canary_role_name

  assume_role_policy = file(var.assume_role_policy)
}

resource "aws_iam_role_policy" "canary_policy" {
  name = var.canary_policy_name
  role = aws_iam_role.canary.id

  policy = file(var.policy_file)
}

resource "aws_synthetics_canary" "some" {
  for_each             = var.canary_configs
  name                 = "${each.key}-canary"
  artifact_s3_location = var.canary_artifact_s3_location
  execution_role_arn   = aws_iam_role.canary.arn
  handler              = var.canary_handler
  zip_file             = each.value
  runtime_version      = var.canary_runtime_version

  schedule {
    expression = var.canary_schedule_expression
  }

  run_config {
    timeout_in_seconds = var.canary_timeout_in_seconds
  }

  success_retention_period = var.success_retention_period
  failure_retention_period = var.failure_retention_period
}

resource "aws_cloudwatch_metric_alarm" "canary_alarm" {
  for_each            = var.canary_configs
  alarm_name          = "${each.key}-canary-alarm"
  comparison_operator = var.alarm_comparison_operator
  evaluation_periods  = var.alarm_evaluation_periods
  metric_name         = var.alarm_metric_name
  namespace           = var.alarm_namespace
  period              = var.alarm_period
  statistic           = var.alarm_statistic
  threshold           = var.alarm_threshold

  alarm_actions = [aws_sns_topic.some.arn]

  dimensions = {
    CanaryName = aws_synthetics_canary.some[each.key].name
  }
}

resource "aws_sns_topic" "some" {
  name = var.sns_topic_name
}

resource "aws_sns_topic_subscription" "some" {
  topic_arn = aws_sns_topic.some.arn
  protocol  = var.sns_subscription_protocol
  endpoint  = var.sns_subscription_endpoint
}
