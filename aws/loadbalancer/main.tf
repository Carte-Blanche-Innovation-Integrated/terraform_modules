resource "aws_lb" "lb" {
  name               = var.name
  internal           = false
  load_balancer_type = "application"
  subnets            = data.aws_subnet_ids.all.ids
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

resource "aws_lb_listener" "listener" {
  load_balancer_arn = aws_lb.lb.arn
  certificate_arn   = var.certificate_arn
  port              = "443"
  protocol          = "HTTPS"
  ssl_policy        = "ELBSecurityPolicy-2016-08"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.target_group.arn
  }
}

resource "aws_lb_listener" "front_end" {
  load_balancer_arn = aws_lb.lb.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type = "redirect"

    redirect {
      port        = "443"
      protocol    = "HTTPS"
      status_code = "HTTP_302"
    }
  }
}
