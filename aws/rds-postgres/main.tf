resource "aws_db_subnet_group" "postgres" {
  name       = "${var.identifier}-sbntgrp"
  subnet_ids = var.subnet_ids

  tags = var.common_tags
}

resource "aws_db_instance" "master" {
  allocated_storage               = var.allocated_storage
  allow_major_version_upgrade     = var.allow_major_version_upgrade
  apply_immediately               = var.apply_immediately
  auto_minor_version_upgrade      = true
  backup_retention_period         = var.backup_retention_period
  backup_window                   = var.backup_window
  copy_tags_to_snapshot           = true
  db_name                         = var.db_name
  db_subnet_group_name            = aws_db_subnet_group.postgres.name
  delete_automated_backups        = var.delete_automated_backups
  enabled_cloudwatch_logs_exports = toset(["postgresql", "upgrade"])
  engine                          = "postgres"
  engine_version                  = var.postgres_engine_version
  final_snapshot_identifier       = var.final_snapshot_identifier
  identifier                      = "${var.identifier}-master"
  instance_class                  = var.instance_class
  maintenance_window              = var.maintenance_window
  max_allocated_storage           = var.max_allocated_storage
  monitoring_interval             = var.monitoring_interval
  monitoring_role_arn             = var.monitoring_interval != 0 ? module.iam.iam_role_arn : null
  multi_az                        = var.multi_az
  password                        = var.password
  performance_insights_enabled    = true
  port                            = 5432
  publicly_accessible             = var.is_public
  skip_final_snapshot             = var.skip_final_snapshot
  storage_type                    = "gp2"
  tags                            = var.common_tags
  username                        = var.username
  vpc_security_group_ids          = var.sg_ids
}

resource "aws_db_instance" "slaves" {
  count = var.read_replicas

  allow_major_version_upgrade     = var.allow_major_version_upgrade
  apply_immediately               = var.apply_immediately
  auto_minor_version_upgrade      = true
  backup_retention_period         = 0
  backup_window                   = null
  copy_tags_to_snapshot           = true
  enabled_cloudwatch_logs_exports = toset(["postgresql", "upgrade"])
  final_snapshot_identifier       = null
  identifier                      = "${var.identifier}-slave-${count.index}"
  instance_class                  = var.instance_class
  maintenance_window              = var.maintenance_window
  max_allocated_storage           = var.max_allocated_storage
  monitoring_interval             = var.monitoring_interval
  monitoring_role_arn             = var.monitoring_interval != 0 ? module.iam.iam_role_arn : null
  multi_az                        = var.multi_az
  performance_insights_enabled    = true
  port                            = 5432
  publicly_accessible             = var.is_public
  replicate_source_db             = aws_db_instance.master.id
  skip_final_snapshot             = true
  storage_type                    = "gp2"
  tags                            = var.common_tags
  vpc_security_group_ids          = var.sg_ids

  depends_on = [aws_db_instance.master]
}

# resource "aws_iam_role" "role" {
#   count = var.monitoring_interval != 0 ? 1 : 0

#   name = "rds-monitoring-role"

#   assume_role_policy = <<EOF
# {
#   "Version": "2012-10-17",
#   "Statement": [
#     {
#       "Sid": "",
#       "Effect": "Allow",
#       "Principal": {
#         "Service": "monitoring.rds.amazonaws.com"
#       },
#       "Action": "sts:AssumeRole"
#     }
#   ]
# }
# EOF

#   tags = var.common_tags
# }

# resource "aws_iam_role_policy_attachment" "attachment" {
#   count = var.monitoring_interval != 0 ? 1 : 0

#   policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonRDSEnhancedMonitoringRole"
#   role       = aws_iam_role.role[0].name
# }

module "iam" {
  source = "../iam"

  should_create        = var.monitoring_interval != 0 ? true : false
  role_name            = "rds-monitoring-role"
  assume_role_policy   = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "",
      "Effect": "Allow",
      "Principal": {
        "Service": "monitoring.rds.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
EOF
  aws_managed_policies = ["arn:aws:iam::aws:policy/service-role/AmazonRDSEnhancedMonitoringRole"]
  common_tags          = var.common_tags
}
