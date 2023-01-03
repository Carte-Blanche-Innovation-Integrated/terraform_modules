resource "aws_ssm_parameter" "secret" {
  name        = var.name
  description = var.description
  tier        = "Standard"
  type        = var.type
  overwrite   = true
  value       = var.value
  key_id      = var.type == "SecureString" ? data.aws_kms_alias.ssm.id : null
  tags        = var.common_tags
}
