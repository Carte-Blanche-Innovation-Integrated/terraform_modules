resource "aws_launch_template" "template" {

  name        = var.name
  description = var.description

  disable_api_stop        = true
  disable_api_termination = true

  iam_instance_profile {
    arn = var.instance_profile_arn
  }

  image_id                             = data.aws_ami.amazon_linux.id
  instance_initiated_shutdown_behavior = "terminate"

  instance_type = var.instance_type
  key_name      = var.key_pair_name

  metadata_options {
    http_endpoint               = "enabled"
    http_tokens                 = "required"
    http_put_response_hop_limit = 1
    instance_metadata_tags      = "enabled"
  }

  monitoring {
    enabled = true
  }

  network_interfaces {
    associate_public_ip_address = var.associate_public_ip
  }

  vpc_security_group_ids = var.sgs

  tag_specifications {
    resource_type = "instance"

    tags = var.common_tags
  }

  user_data = var.user_data_file_path != "" ? filebase64(var.user_data_file_path) : null
  tags      = var.common_tags
}
