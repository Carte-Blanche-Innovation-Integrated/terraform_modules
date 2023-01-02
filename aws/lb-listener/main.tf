resource "aws_lb_listener" "listeners" {
  for_each = { for i, each in var.listeners : i => each }

  load_balancer_arn = var.lb_arn
  certificate_arn   = lookup(var.each, "certificate_arn", null)
  port              = var.each["port"]
  protocol          = var.each["protocol"]
  ssl_policy        = lookup(var.each, "ssl_policy", null)

  default_action {
    type             = var.each["action"]["type"]
    target_group_arn = lookup(var.each["action"], "target_group_arn", null)

    dynamic "redirect" {
      count = var.each["action"]["type"] == "redirect" ? 1 : 0

      content {
        port        = var.each["action"]["port"]
        protocol    = var.each["action"]["protocol"]
        status_code = var.each["action"]["status_code"]
      }
    }
  }

  tags = var.common_tags
}
