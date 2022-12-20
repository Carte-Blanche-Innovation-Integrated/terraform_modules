resource "aws_iam_role" "role" {
  name = var.role_name
  assume_role_policy = var.assume_role_policy == "" ? jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = ""
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      },
    ]
  }) : var.assume_role_policy
}

resource "aws_iam_role_policy_attachment" "managed_rp_attachments" {
  count = length(var.aws_managed_policies)

  role       = aws_iam_role.role.name
  policy_arn = var.aws_managed_policies[count.index]
}

resource "aws_iam_policy" "policies" {
  count = length(var.new_policies)

  name        = var.new_policies[count.index].name
  path        = "/"
  description = var.new_policies[count.index].description
  policy      = var.new_policies[count.index].policy
}

resource "aws_iam_role_policy_attachment" "custom_rp_attachments" {
  count = length(var.new_policies)

  role       = aws_iam_role.role.name
  policy_arn = aws_iam_policy.policies[count.index].arn
}
