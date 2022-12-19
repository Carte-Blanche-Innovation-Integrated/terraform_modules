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
  for_each = var.rules

  type      = each.value.type
  from_port = each.value.from_port
  to_port   = each.value.to_port
  protocol  = each.value.protocol

  cidr_blocks              = try(each.value.sg ? null : each.value.cidrs, null)
  source_security_group_id = try(each.value.sg, null)

  security_group_id = aws_security_group.sg.id
}