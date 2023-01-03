resource "aws_lb" "lb" {
  name               = var.name
  internal           = false
  load_balancer_type = "application"
  subnets            = var.subnet_ids
  security_groups    = var.sg_ids
  tags               = var.common_tags
}

resource "aws_lb_target_group" "target_group" {
  name                 = var.name
  protocol             = "HTTP"
  vpc_id               = var.vpc_id
  target_type          = "instance"
  port                 = var.target_port
  deregistration_delay = var.deregistration_delay
  slow_start           = var.slow_start

  health_check {
    enabled             = var.health_check_enabled
    healthy_threshold   = var.healthy_threshold
    unhealthy_threshold = var.unhealthy_threshold
    interval            = var.interval
    timeout             = var.timeout
    path                = var.health_check_path
  }

  tags = var.common_tags
}
