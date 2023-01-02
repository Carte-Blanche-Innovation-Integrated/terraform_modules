locals {
  triggers = toset(["DeploymentStart", "DeploymentSuccess", "DeploymentFailure"])
}

resource "aws_codedeploy_app" "app" {
  compute_platform = "Server"
  name             = var.app_name

  tags = var.common_tags
}

# resource "aws_iam_role" "role" {
#   count = var.create_iam_role ? 1 : 0

#   name = "${var.app_name}-codeploy-role"

#   assume_role_policy = <<EOF
# {
#   "Version": "2012-10-17",
#   "Statement": [
#     {
#       "Sid": "",
#       "Effect": "Allow",
#       "Principal": {
#         "Service": "codedeploy.amazonaws.com"
#       },
#       "Action": "sts:AssumeRole"
#     }
#   ]
# }
# EOF

#   tags = var.common_tags
# }

# resource "aws_iam_role_policy_attachment" "attachment" {
#   count = var.create_iam_role ? 1 : 0

#   policy_arn = "arn:aws:iam::aws:policy/service-role/AWSCodeDeployRole"
#   role       = aws_iam_role.role[0].name
# }

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

  dynamic "ec2_tag_filter" {
    for_each = var.target_filters

    content {
      key   = each.key
      type  = "KEY_AND_VALUE"
      value = each.value
    }
  }

  dynamic "trigger_configuration" {
    for_each = { for i, each in aws_sns_topic.topics : local.triggers[i] => each.arn }

    content {
      trigger_events     = [each.key]
      trigger_name       = "${each.key}Trigger"
      trigger_target_arn = each.value
    }
  }

  auto_rollback_configuration {
    enabled = true
    events  = [local.triggers[2]]
  }

  alarm_configuration {
    alarms  = ["${var.app_name}-alarm"]
    enabled = true
  }

  tags = var.common_tags
}
