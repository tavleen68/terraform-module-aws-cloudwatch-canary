variable "canary_configs" {
  description = "Map of canary configurations with canary names and ZIP file paths."
  type        = map(string)
  default     = null
}

variable "canary_role_name" {
  description = "Name of the IAM role for the canary."
  type        = string
  default     = null
}

variable "canary_policy_name" {
  description = "Name of the IAM policy for the canary."
  type        = string
  default     = null
}

variable "canary_artifact_s3_location" {
  description = "S3 bucket location for storing canary artifacts."
  type        = string
  default     = null
}

variable "canary_handler" {
  description = "Lambda handler for the canary."
  type        = string
  default     = null
}

variable "canary_runtime_version" {
  description = "Runtime version for the canary."
  type        = string
  default     = null
}

variable "canary_schedule_expression" {
  description = "Schedule expression for the canary."
  type        = string
  default     = null
}

variable "canary_timeout_in_seconds" {
  description = "Timeout in seconds for the canary."
  type        = number
  default     = null
}

variable "success_retention_period" {
  description = "Retention period in days for successful canary runs."
  type        = number
  default     = null
}

variable "failure_retention_period" {
  description = "Retention period in days for failed canary runs."
  type        = number
  default     = null
}

variable "alarm_comparison_operator" {
  description = "Comparison operator for the CloudWatch alarm."
  type        = string
  default     = null
}

variable "alarm_evaluation_periods" {
  description = "Evaluation periods for the CloudWatch alarm."
  type        = number
  default     = null
}

variable "alarm_metric_name" {
  description = "Metric name for the CloudWatch alarm."
  type        = string
  default     = null
}

variable "alarm_namespace" {
  description = "Namespace for the CloudWatch alarm metric."
  type        = string
  default     = null
}

variable "alarm_period" {
  description = "Period for the CloudWatch alarm metric in seconds."
  type        = number
  default     = null
}

variable "alarm_statistic" {
  description = "Statistic for the CloudWatch alarm metric."
  type        = string
  default     = null
}

variable "alarm_threshold" {
  description = "Threshold for the CloudWatch alarm."
  type        = number
  default     = null
}

variable "sns_topic_name" {
  description = "Name of the SNS topic for canary alarms."
  type        = string
  default     = null
}

variable "sns_subscription_protocol" {
  description = "Protocol for SNS subscription."
  type        = string
  default     = null
}

variable "sns_subscription_endpoint" {
  description = "Endpoint for SNS subscription."
  type        = string
  default     = null
}
variable "assume_role_policy" {
  description = "Path to the file containing the IAM policy that grants an entity permission to assume the Lambda execution role"
  type        = string
  default     = null
}
variable "policy_file" {
  description = "The name of the policy_file for the Lambda function"
  type        = string
  default     = null
}
