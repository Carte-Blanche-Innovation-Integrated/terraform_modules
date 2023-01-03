resource "aws_lb_listener" "listener" {
  load_balancer_arn = var.lb_arn
  certificate_arn   = lookup(var.listener, "certificate_arn", null)
  port              = var.listener["port"]
  protocol          = var.listener["protocol"]
  ssl_policy        = lookup(var.listener, "ssl_policy", null)

  default_action {
    type             = var.listener["action"]["type"]
    target_group_arn = lookup(var.listener["action"], "target_group_arn", null)

    dynamic "redirect" {
      count = var.listener["action"]["type"] == "redirect" ? 1 : 0

      content {
        port        = var.listener["action"]["port"]
        protocol    = var.listener["action"]["protocol"]
        status_code = var.listener["action"]["status_code"]
      }
    }
  }

  tags = var.common_tags
}
