# RDS module for managed PostgreSQL

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.3 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | 4.46.0 |
## Usage
Basic usage of this module is as follows:
```hcl
module "example" {
	 source = "<module-path>"

	 # Required variables
	 db_name = 
	 identifier = 
	 password = 
	 subnet_ids = 
	 username = 

	 # Optional variables
	 allocated_storage = 30
	 apply_immediately = false
	 backup_retention_period = 3
	 backup_window = "22:00-23:00"
	 common_tags = {}
	 delete_automated_backups = false
	 final_snapshot_identifier = ""
	 instance_class = "db.t3.micro"
	 is_public = false
	 maintenance_window = "Sun:01:00-Sun:02:00"
	 max_allocated_storage = 50
	 monitoring_interval = 60
	 multi_az = false
	 postgres_engine_version = "14.5"
	 read_replicas = 0
	 sg_ids = []
	 skip_final_snapshot = true
}
```
## Resources

| Name | Type |
|------|------|
| [aws_db_instance.master](https://registry.terraform.io/providers/hashicorp/aws/4.46.0/docs/resources/db_instance) | resource |
| [aws_db_instance.slaves](https://registry.terraform.io/providers/hashicorp/aws/4.46.0/docs/resources/db_instance) | resource |
| [aws_db_subnet_group.postgres](https://registry.terraform.io/providers/hashicorp/aws/4.46.0/docs/resources/db_subnet_group) | resource |
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_allocated_storage"></a> [allocated\_storage](#input\_allocated\_storage) | Storage in GBs | `number` | `30` | no |
| <a name="input_apply_immediately"></a> [apply\_immediately](#input\_apply\_immediately) | Should the changes be applied immediately on the DB instance? It will take it down for some short amount of time. | `bool` | `false` | no |
| <a name="input_backup_retention_period"></a> [backup\_retention\_period](#input\_backup\_retention\_period) | How many days will the backup be retained? | `number` | `3` | no |
| <a name="input_backup_window"></a> [backup\_window](#input\_backup\_window) | The daily time range (in UTC) during which automated backups are created if they are enabled | `string` | `"22:00-23:00"` | no |
| <a name="input_common_tags"></a> [common\_tags](#input\_common\_tags) | A map of common tags to be applied on all the created resources | `map(string)` | `{}` | no |
| <a name="input_db_name"></a> [db\_name](#input\_db\_name) | Name of the master database | `string` | n/a | yes |
| <a name="input_delete_automated_backups"></a> [delete\_automated\_backups](#input\_delete\_automated\_backups) | Whether to remove automated backups immediately after the DB instance is deleted | `bool` | `false` | no |
| <a name="input_final_snapshot_identifier"></a> [final\_snapshot\_identifier](#input\_final\_snapshot\_identifier) | The name of your final DB snapshot when this DB instance is deleted. Must be provided if 'skip\_final\_snapshot' is set to false | `string` | `""` | no |
| <a name="input_identifier"></a> [identifier](#input\_identifier) | description | `string` | n/a | yes |
| <a name="input_instance_class"></a> [instance\_class](#input\_instance\_class) | Type of instance like t3.micro etc | `string` | `"db.t3.micro"` | no |
| <a name="input_is_public"></a> [is\_public](#input\_is\_public) | Is this instance publicly accessible? | `bool` | `false` | no |
| <a name="input_maintenance_window"></a> [maintenance\_window](#input\_maintenance\_window) | The window to perform maintenance in. Syntax: 'ddd:hh24:mi-ddd:hh24:mi'. Eg: 'Mon:00:00-Mon:03:00' | `string` | `"Sun:01:00-Sun:02:00"` | no |
| <a name="input_max_allocated_storage"></a> [max\_allocated\_storage](#input\_max\_allocated\_storage) | When configured, the upper limit to which Amazon RDS can automatically scale the storage of the DB instance. Configuring this will automatically ignore differences to allocated\_storage. Must be greater than or equal to allocated\_storage or 0 to disable Storage Autoscaling. | `number` | `50` | no |
| <a name="input_monitoring_interval"></a> [monitoring\_interval](#input\_monitoring\_interval) | The interval, in seconds, between points when Enhanced Monitoring metrics are collected for the DB instance. To disable collecting Enhanced Monitoring metrics, specify 0. Valid Values: 0, 1, 5, 10, 15, 30, 60. | `number` | `60` | no |
| <a name="input_multi_az"></a> [multi\_az](#input\_multi\_az) | Should the database be deployed in multi AZs? | `bool` | `false` | no |
| <a name="input_password"></a> [password](#input\_password) | Master password for the DB | `string` | n/a | yes |
| <a name="input_postgres_engine_version"></a> [postgres\_engine\_version](#input\_postgres\_engine\_version) | Version of postgres | `string` | `"14.5"` | no |
| <a name="input_read_replicas"></a> [read\_replicas](#input\_read\_replicas) | Number of read replicas to be created | `number` | `0` | no |
| <a name="input_sg_ids"></a> [sg\_ids](#input\_sg\_ids) | List of ids of allowed security groups for the incoming traffic for DB | `list(string)` | `[]` | no |
| <a name="input_skip_final_snapshot"></a> [skip\_final\_snapshot](#input\_skip\_final\_snapshot) | When destroying the database should it be backed up? | `bool` | `true` | no |
| <a name="input_subnet_ids"></a> [subnet\_ids](#input\_subnet\_ids) | List of IDs of all the subnets where this DB instance can be placed. | `list(string)` | n/a | yes |
| <a name="input_username"></a> [username](#input\_username) | Master username for the DB | `string` | n/a | yes |
## Outputs

| Name | Description |
|------|-------------|
| <a name="output_aws_master_host"></a> [aws\_master\_host](#output\_aws\_master\_host) | n/a |
| <a name="output_aws_slave_hosts"></a> [aws\_slave\_hosts](#output\_aws\_slave\_hosts) | n/a |
| <a name="output_master_db_name"></a> [master\_db\_name](#output\_master\_db\_name) | n/a |
| <a name="output_master_db_password"></a> [master\_db\_password](#output\_master\_db\_password) | n/a |
| <a name="output_master_db_user"></a> [master\_db\_user](#output\_master\_db\_user) | n/a |
<!-- END_TF_DOCS -->
