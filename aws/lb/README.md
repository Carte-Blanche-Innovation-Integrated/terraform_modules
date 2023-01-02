# Load balancer module

External Application loadbalancer with one target group and 2 listeners(port 80 and 443)

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
	 health_check_path = 
	 name = 
	 vpc_id = 

	 # Optional variables
	 common_tags = {}
	 deregistration_delay = 100
	 health_check_enabled = true
	 healthy_threshold = 2
	 interval = 20
	 sg_ids = []
	 slow_start = 120
	 target_port = 80
	 timeout = 5
	 unhealthy_threshold = 9
}
```
## Resources

| Name | Type |
|------|------|
| [aws_lb.lb](https://registry.terraform.io/providers/hashicorp/aws/4.46.0/docs/resources/lb) | resource |
| [aws_lb_target_group.target_group](https://registry.terraform.io/providers/hashicorp/aws/4.46.0/docs/resources/lb_target_group) | resource |
| [aws_subnet_ids.all](https://registry.terraform.io/providers/hashicorp/aws/4.46.0/docs/data-sources/subnet_ids) | data source |
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_common_tags"></a> [common\_tags](#input\_common\_tags) | A map of common tags to be applied on all the created resources | `map(string)` | `{}` | no |
| <a name="input_deregistration_delay"></a> [deregistration\_delay](#input\_deregistration\_delay) | Time(in seconds) allowed for the instances in the target group to deregister themselves and stop serving requests | `number` | `100` | no |
| <a name="input_health_check_enabled"></a> [health\_check\_enabled](#input\_health\_check\_enabled) | Is health check enabled for this LB? | `bool` | `true` | no |
| <a name="input_health_check_path"></a> [health\_check\_path](#input\_health\_check\_path) | Health check url to hit | `string` | n/a | yes |
| <a name="input_healthy_threshold"></a> [healthy\_threshold](#input\_healthy\_threshold) | How many consecutive successful pings after we deem the instance healthy? | `number` | `2` | no |
| <a name="input_interval"></a> [interval](#input\_interval) | How much time(in seconds) to wait before sending the next ping to target instance? | `number` | `20` | no |
| <a name="input_name"></a> [name](#input\_name) | Name of the loadbalancer | `string` | n/a | yes |
| <a name="input_sg_ids"></a> [sg\_ids](#input\_sg\_ids) | List of SG ids which allow the traffic from/out of lb | `list(string)` | `[]` | no |
| <a name="input_slow_start"></a> [slow\_start](#input\_slow\_start) | Starting time(in seconds) of the instance before the health check pings are sent to the instance | `number` | `120` | no |
| <a name="input_target_port"></a> [target\_port](#input\_target\_port) | Port which is used to send/recieve data to/from the target group | `number` | `80` | no |
| <a name="input_timeout"></a> [timeout](#input\_timeout) | Timeout(in seconds) if no reply comes back from the pings | `number` | `5` | no |
| <a name="input_unhealthy_threshold"></a> [unhealthy\_threshold](#input\_unhealthy\_threshold) | How many consecutive unsuccessful pings after we deem the instance unhealthy? | `number` | `9` | no |
| <a name="input_vpc_id"></a> [vpc\_id](#input\_vpc\_id) | ID of the VPC | `string` | n/a | yes |
## Outputs

| Name | Description |
|------|-------------|
| <a name="output_dns_name"></a> [dns\_name](#output\_dns\_name) | n/a |
| <a name="output_lb_arn"></a> [lb\_arn](#output\_lb\_arn) | n/a |
| <a name="output_lb_target_group_arn"></a> [lb\_target\_group\_arn](#output\_lb\_target\_group\_arn) | n/a |
<!-- END_TF_DOCS -->
