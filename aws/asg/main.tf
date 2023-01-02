resource "aws_autoscaling_group" "asg" {
  name               = var.name
  availability_zones = data.aws_availability_zones.all.names
  desired_capacity   = var.desired_capacity
  max_size           = var.max_size
  min_size           = var.min_size

  launch_template {
    id      = var.launch_template_id
    version = "$Latest"
  }

  health_check_type = "ELB"

  target_group_arns = var.target_group_arns

  timeouts {
    delete = "20m"
  }
}

resource "aws_autoscaling_policy" "asg_policy" {
  count                  = var.create_auto_scaling_policy ? 1 : 0
  name                   = "${var.name}-policy"
  scaling_adjustment     = var.scaling_adjustment
  adjustment_type        = var.adjustment_type
  cooldown               = var.scaling_cooldown
  policy_type            = "SimpleScaling"
  autoscaling_group_name = aws_autoscaling_group.asg.name
}
