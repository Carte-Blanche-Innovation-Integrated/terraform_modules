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
	 role_name = 

	 # Optional variables
	 assume_role_policy = ""
	 aws_managed_policies = []
	 common_tags = {}
	 new_policies = []
	 should_create = true
}
```
## Resources

| Name | Type |
|------|------|
| [aws_iam_policy.policies](https://registry.terraform.io/providers/hashicorp/aws/4.46.0/docs/resources/iam_policy) | resource |
| [aws_iam_role.role](https://registry.terraform.io/providers/hashicorp/aws/4.46.0/docs/resources/iam_role) | resource |
| [aws_iam_role_policy_attachment.custom_rp_attachments](https://registry.terraform.io/providers/hashicorp/aws/4.46.0/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.managed_rp_attachments](https://registry.terraform.io/providers/hashicorp/aws/4.46.0/docs/resources/iam_role_policy_attachment) | resource |
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_assume_role_policy"></a> [assume\_role\_policy](#input\_assume\_role\_policy) | Provide the assume role policy. If not provided then by default EC2 assume role policy will be used. | `string` | `""` | no |
| <a name="input_aws_managed_policies"></a> [aws\_managed\_policies](#input\_aws\_managed\_policies) | List of ARNs of AWS managed iam policies to be attached to the role. | `list(string)` | `[]` | no |
| <a name="input_common_tags"></a> [common\_tags](#input\_common\_tags) | A map of common tags to be applied on all the created resources | `map(string)` | `{}` | no |
| <a name="input_new_policies"></a> [new\_policies](#input\_new\_policies) | List of json encoded policies (new) to be created and then attached to this role. | <pre>list(<br>    object(<br>      {<br>        name        = string<br>        description = string<br>        policy      = any<br>      }<br>    )<br>  )</pre> | `[]` | no |
| <a name="input_role_name"></a> [role\_name](#input\_role\_name) | Name of the iam role. | `string` | n/a | yes |
| <a name="input_should_create"></a> [should\_create](#input\_should\_create) | Should all the resources in this module be created? This flag is helpful when conditionally creating this module | `bool` | `true` | no |
## Outputs

| Name | Description |
|------|-------------|
| <a name="output_iam_role_arn"></a> [iam\_role\_arn](#output\_iam\_role\_arn) | ARN of the iam role |
| <a name="output_iam_role_name"></a> [iam\_role\_name](#output\_iam\_role\_name) | Name/ID of the iam role |
<!-- END_TF_DOCS -->