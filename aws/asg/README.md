# ASG module

Auto scaling group with SimpleScaling policy type which can be attached to a launch template.

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
	 launch_template_id = 
	 name = 
	 target_group_arns = 

	 # Optional variables
	 adjustment_type = "ChangeInCapacity"
	 create_auto_scaling_policy = false
	 desired_capacity = 2
	 max_size = 2
	 min_size = 2
	 scaling_adjustment = 4
	 scaling_cooldown = 300
}
```
## Resources

| Name | Type |
|------|------|
| [aws_autoscaling_group.asg](https://registry.terraform.io/providers/hashicorp/aws/4.46.0/docs/resources/autoscaling_group) | resource |
| [aws_autoscaling_policy.asg_policy](https://registry.terraform.io/providers/hashicorp/aws/4.46.0/docs/resources/autoscaling_policy) | resource |
| [aws_availability_zones.all](https://registry.terraform.io/providers/hashicorp/aws/4.46.0/docs/data-sources/availability_zones) | data source |
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_adjustment_type"></a> [adjustment\_type](#input\_adjustment\_type) | Whether the adjustment is an absolute number or a percentage of the current capacity. Valid values are ChangeInCapacity, ExactCapacity, and PercentChangeInCapacity | `string` | `"ChangeInCapacity"` | no |
| <a name="input_create_auto_scaling_policy"></a> [create\_auto\_scaling\_policy](#input\_create\_auto\_scaling\_policy) | Should the auto scaling policy be created? | `bool` | `false` | no |
| <a name="input_desired_capacity"></a> [desired\_capacity](#input\_desired\_capacity) | Number of desired instances running at a time | `number` | `2` | no |
| <a name="input_launch_template_id"></a> [launch\_template\_id](#input\_launch\_template\_id) | ID of the EC2 launch template | `string` | n/a | yes |
| <a name="input_max_size"></a> [max\_size](#input\_max\_size) | Maximum number of instances that can be run in this AutoSG at once | `number` | `2` | no |
| <a name="input_min_size"></a> [min\_size](#input\_min\_size) | Minimum number of instances that can be run in this AutoSG at once | `number` | `2` | no |
| <a name="input_name"></a> [name](#input\_name) | Name of the auto scaling group | `string` | n/a | yes |
| <a name="input_scaling_adjustment"></a> [scaling\_adjustment](#input\_scaling\_adjustment) | Number of instances by which to scale | `number` | `4` | no |
| <a name="input_scaling_cooldown"></a> [scaling\_cooldown](#input\_scaling\_cooldown) | Amount of time, in seconds, after a scaling activity completes and before the next scaling activity can start. | `number` | `300` | no |
| <a name="input_target_group_arns"></a> [target\_group\_arns](#input\_target\_group\_arns) | List of ARNs of the LB target group | `list(string)` | n/a | yes |
## Outputs

No outputs.
<!-- END_TF_DOCS -->
