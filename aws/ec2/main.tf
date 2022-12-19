resource "random_shuffle" "az" {
  input        = data.aws_availability_zones.all.names
  result_count = 1
}

locals {
  postfix = ["f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p"]

  az = random_shuffle.az.result[0]
  tags = {
    "Name" = var.instance_name
  }
}

resource "aws_iam_instance_profile" "instance_profile" {
  count = var.iam_role_name == null ? 0 : 1

  name = var.iam_role_name
  role = var.iam_role_name
}

resource "tls_private_key" "key_pair" {
  count = var.should_create_keypair ? 1 : 0

  algorithm = "ED25519"
}

resource "aws_key_pair" "key_pair" {
  count = var.should_create_keypair ? 1 : 0

  key_name   = var.key_pair_name
  public_key = trimspace(tls_private_key.key_pair[0].public_key_openssh)
}

resource "local_sensitive_file" "private_key" {
  count = var.should_create_keypair ? 1 : 0

  content  = tls_private_key.key_pair[0].private_key_pem
  filename = var.path_to_store_private_key
}

resource "aws_ebs_volume" "volume" {
  count = length(var.ebs_vols)

  type = "gp2"

  availability_zone = local.az
  size              = var.ebs_vols[count.index]
  tags              = local.tags
}

resource "aws_instance" "ec2" {
  hibernation                 = false
  user_data_replace_on_change = true

  root_block_device {
    delete_on_termination = true
  }

  ami                         = data.aws_ami.amazon_linux.id
  instance_type               = var.instance_type
  user_data                   = var.user_data_file_path != null ? file(var.user_data_file_path) : null
  iam_instance_profile        = try(var.iam_role_name, aws_iam_instance_profile.instance_profile[0].name)
  key_name                    = var.should_create_keypair ? aws_key_pair.key_pair[0].key_name : try(var.key_pair_name, null)
  subnet_id                   = var.subnet_id
  monitoring                  = var.enable_monitoring
  associate_public_ip_address = var.associate_public_ip
  vpc_security_group_ids      = var.sgs
  availability_zone           = local.az
  disable_api_termination     = var.instance_termination_protection
  tags                        = local.tags
}

resource "aws_volume_attachment" "attachment" {
  for_each = { for i, v in aws_ebs_volume.volume : i => v.id }

  device_name = "/dev/sd${local.postfix[each.key]}"
  volume_id   = each.value
  instance_id = aws_instance.ec2.id
}

