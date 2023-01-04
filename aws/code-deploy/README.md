# Code deploy module

Inplace deployment with a LB on EC2 AutoScalingGroup

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
	 app_name = 
	 target_filters = 

	 # Optional variables
	 common_tags = {}
	 create_iam_role = true
	 create_sns_topics = false
}
```
## Resources

| Name | Type |
|------|------|
| [aws_codedeploy_app.app](https://registry.terraform.io/providers/hashicorp/aws/4.46.0/docs/resources/codedeploy_app) | resource |
| [aws_codedeploy_deployment_group.group](https://registry.terraform.io/providers/hashicorp/aws/4.46.0/docs/resources/codedeploy_deployment_group) | resource |
| [aws_sns_topic.topics](https://registry.terraform.io/providers/hashicorp/aws/4.46.0/docs/resources/sns_topic) | resource |
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_app_name"></a> [app\_name](#input\_app\_name) | Name of the CodeDeploy app | `string` | n/a | yes |
| <a name="input_common_tags"></a> [common\_tags](#input\_common\_tags) | A map of common tags to be applied on all the created resources | `map(string)` | `{}` | no |
| <a name="input_create_iam_role"></a> [create\_iam\_role](#input\_create\_iam\_role) | Should an IAM role be created for CodeDeploy? | `bool` | `true` | no |
| <a name="input_create_sns_topics"></a> [create\_sns\_topics](#input\_create\_sns\_topics) | Should SNS topics be created for the CodeDeploy app so that we can generate notifications based on the status of deployments on different events. Currently supports 'DeploymentStart', 'DeploymentSuccess', 'DeploymentFailure' | `bool` | `false` | no |
| <a name="input_target_filters"></a> [target\_filters](#input\_target\_filters) | Tag filters associated with the deployment group. | `map(string)` | n/a | yes |
## Outputs

| Name | Description |
|------|-------------|
| <a name="output_app_name"></a> [app\_name](#output\_app\_name) | Name of the application |
| <a name="output_deployment_group_name"></a> [deployment\_group\_name](#output\_deployment\_group\_name) | Name of the deployment group |
| <a name="output_sns_topics_arn"></a> [sns\_topics\_arn](#output\_sns\_topics\_arn) | ARNs of all the created SNS topics, if any. |
<!-- END_TF_DOCS -->