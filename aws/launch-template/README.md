# Launch template module

Simple launch template for an AutoSG with the option to configure instance type, security group, instance profile & user data.

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
	 description = 
	 instance_profile_arn = 
	 name = 

	 # Optional variables
	 associate_public_ip = true
	 common_tags = {}
	 instance_type = "t2.micro"
	 key_pair_name = null
	 sgs = []
	 user_data_file_path = ""
}
```
## Resources

| Name | Type |
|------|------|
| [aws_launch_template.template](https://registry.terraform.io/providers/hashicorp/aws/4.46.0/docs/resources/launch_template) | resource |
| [aws_ami.amazon_linux](https://registry.terraform.io/providers/hashicorp/aws/4.46.0/docs/data-sources/ami) | data source |
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_associate_public_ip"></a> [associate\_public\_ip](#input\_associate\_public\_ip) | Should a public ip address be attached with the instance? | `bool` | `true` | no |
| <a name="input_common_tags"></a> [common\_tags](#input\_common\_tags) | A map of common tags to be applied on all the created resources | `map(string)` | `{}` | no |
| <a name="input_description"></a> [description](#input\_description) | Description of the launch template | `string` | n/a | yes |
| <a name="input_instance_profile_arn"></a> [instance\_profile\_arn](#input\_instance\_profile\_arn) | ARN of the instance profile which will be attached to the instances | `string` | n/a | yes |
| <a name="input_instance_type"></a> [instance\_type](#input\_instance\_type) | Family of the instance | `string` | `"t2.micro"` | no |
| <a name="input_key_pair_name"></a> [key\_pair\_name](#input\_key\_pair\_name) | Name of the key pair. Should be created manually from the AWS console. | `string` | `null` | no |
| <a name="input_name"></a> [name](#input\_name) | Name of the launch template | `string` | n/a | yes |
| <a name="input_sgs"></a> [sgs](#input\_sgs) | List of SG ids for EC2 instance. | `list(string)` | `[]` | no |
| <a name="input_user_data_file_path"></a> [user\_data\_file\_path](#input\_user\_data\_file\_path) | Path of the file in which user data is stored. | `string` | `""` | no |
## Outputs

| Name | Description |
|------|-------------|
| <a name="output_template_arn"></a> [template\_arn](#output\_template\_arn) | ARN of the launch template |
| <a name="output_template_id"></a> [template\_id](#output\_template\_id) | ID of the launch template |
| <a name="output_template_latest_version"></a> [template\_latest\_version](#output\_template\_latest\_version) | Latest version of the launch template |
<!-- END_TF_DOCS -->
