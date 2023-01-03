resource "aws_lb_listener" "listener" {
  load_balancer_arn = var.lb_arn
  certificate_arn   = lookup(var.listener, "certificate_arn", null)
  port              = var.listener["port"]
  protocol          = var.listener["protocol"]
  ssl_policy        = lookup(var.listener, "ssl_policy", null)

  default_action {
    type             = var.action["type"]
    target_group_arn = lookup(var.action, "target_group_arn", null)

    dynamic "redirect" {
      count = var.action["type"] == "redirect" ? 1 : 0

      content {
        port        = var.redirect["port"]
        protocol    = var.redirect["protocol"]
        status_code = var.redirect["status_code"]
      }
    }
  }
  tags = var.common_tags
}
