resource "aws_security_group" "sg" {
  name        = var.sg_name
  description = var.sg_description
  vpc_id      = var.sg_vpc_id

  lifecycle {
    # Necessary if changing 'name' or 'name_prefix' properties.
    create_before_destroy = true
  }
}

resource "aws_security_group_rule" "rules" {
  for_each = rules

  type              = each.type
  from_port         = each.from_port
  to_port           = each.to_port
  protocol          = each.protocol
  security_group_id = aws_security_group.sg.id
}