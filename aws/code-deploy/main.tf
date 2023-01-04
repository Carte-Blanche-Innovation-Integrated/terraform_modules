locals {
  triggers = toset(["DeploymentStart", "DeploymentSuccess", "DeploymentFailure"])
}

resource "aws_codedeploy_app" "app" {
  compute_platform = "Server"
  name             = var.app_name

  tags = var.common_tags
}

module "iam" {
  source = "../iam"

  should_create        = var.create_iam_role
  role_name            = "${var.app_name}-codeploy-role"
  assume_role_policy   = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "",
      "Effect": "Allow",
      "Principal": {
        "Service": "codedeploy.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
EOF
  aws_managed_policies = ["arn:aws:iam::aws:policy/service-role/AWSCodeDeployRole"]
  common_tags          = var.common_tags
}

resource "aws_sns_topic" "topics" {
  for_each = var.create_sns_topics ? local.triggers : []

  name = "${var.app_name}-${each.key}"

  tags = var.common_tags
}

resource "aws_codedeploy_deployment_group" "group" {
  app_name              = aws_codedeploy_app.app.name
  deployment_group_name = "${var.app_name}-deployment-group"
  service_role_arn      = var.create_iam_role ? module.iam.iam_role_arn : var.iam_role_name

  deployment_style {
    deployment_option = "WITH_TRAFFIC_CONTROL"
    deployment_type   = "IN_PLACE"
  }

  load_balancer_info {
    target_group_info {
      name = var.target_group_name
    }
  }

  autoscaling_groups = var.autoscaling_groups

  dynamic "trigger_configuration" {
    for_each = { for i, each in aws_sns_topic.topics : local.triggers[i] => each.arn }

    content {
      trigger_events     = [trigger_configuration.key]
      trigger_name       = "${trigger_configuration.key}Trigger"
      trigger_target_arn = trigger_configuration.value
    }
  }

  auto_rollback_configuration {
    enabled = true
    events  = ["DeploymentFailure"]
  }

  alarm_configuration {
    alarms  = ["${var.app_name}-alarm"]
    enabled = true
  }

  tags = var.common_tags
}
