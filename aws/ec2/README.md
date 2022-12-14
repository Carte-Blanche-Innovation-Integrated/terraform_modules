<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.3 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | 4.46.0 |
| <a name="requirement_local"></a> [local](#requirement\_local) | 2.2.3 |
| <a name="requirement_random"></a> [random](#requirement\_random) | 3.4.3 |
| <a name="requirement_tls"></a> [tls](#requirement\_tls) | 4.0.4 |
## Usage
Basic usage of this module is as follows:
```hcl
module "example" {
	 source  = "<module-path>"

	 # Required variables
	 instance_name  = 

	 # Optional variables
	 associate_public_ip  = true
	 ebs_vols  = []
	 enable_monitoring  = true
	 iam_role_name  = null
	 instance_termination_protection  = false
	 instance_type  = "t2.micro"
	 key_pair_name  = null
	 sgs  = []
	 should_create_keypair  = false
	 subnet_id  = null
	 user_data_file_path  = null
}
```
## Resources

| Name | Type |
|------|------|
| [aws_ebs_volume.volume](https://registry.terraform.io/providers/hashicorp/aws/4.46.0/docs/resources/ebs_volume) | resource |
| [aws_iam_instance_profile.instance_profile](https://registry.terraform.io/providers/hashicorp/aws/4.46.0/docs/resources/iam_instance_profile) | resource |
| [aws_instance.ec2](https://registry.terraform.io/providers/hashicorp/aws/4.46.0/docs/resources/instance) | resource |
| [aws_key_pair.key_pair](https://registry.terraform.io/providers/hashicorp/aws/4.46.0/docs/resources/key_pair) | resource |
| [aws_volume_attachment.attachment](https://registry.terraform.io/providers/hashicorp/aws/4.46.0/docs/resources/volume_attachment) | resource |
| [local_sensitive_file.private_key](https://registry.terraform.io/providers/hashicorp/local/2.2.3/docs/resources/sensitive_file) | resource |
| [random_shuffle.az](https://registry.terraform.io/providers/hashicorp/random/3.4.3/docs/resources/shuffle) | resource |
| [tls_private_key.key_pair](https://registry.terraform.io/providers/hashicorp/tls/4.0.4/docs/resources/private_key) | resource |
| [aws_ami.amazon_linux](https://registry.terraform.io/providers/hashicorp/aws/4.46.0/docs/data-sources/ami) | data source |
| [aws_availability_zones.all](https://registry.terraform.io/providers/hashicorp/aws/4.46.0/docs/data-sources/availability_zones) | data source |
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_associate_public_ip"></a> [associate\_public\_ip](#input\_associate\_public\_ip) | Should a public ip address be attached with the instance? | `bool` | `true` | no |
| <a name="input_ebs_vols"></a> [ebs\_vols](#input\_ebs\_vols) | List that contains the size of one or more EBS volumes. | `list(number)` | `[]` | no |
| <a name="input_enable_monitoring"></a> [enable\_monitoring](#input\_enable\_monitoring) | Should the detailed monitoring for this instance be enabled? | `bool` | `true` | no |
| <a name="input_iam_role_name"></a> [iam\_role\_name](#input\_iam\_role\_name) | Name of the iam role, needed to create an instance profile for ec2. | `string` | `null` | no |
| <a name="input_instance_name"></a> [instance\_name](#input\_instance\_name) | Name of the ec2 instance. | `string` | n/a | yes |
| <a name="input_instance_termination_protection"></a> [instance\_termination\_protection](#input\_instance\_termination\_protection) | Should instance deletion protection be enabled? | `bool` | `false` | no |
| <a name="input_instance_type"></a> [instance\_type](#input\_instance\_type) | Family of the instance | `string` | `"t2.micro"` | no |
| <a name="input_key_pair_name"></a> [key\_pair\_name](#input\_key\_pair\_name) | Name of the key pair. If 'should\_create\_keypair' is true then this <br>string is used as the new key name. If it is false then this key pair is considered<br>to be created already. | `string` | `null` | no |
| <a name="input_sgs"></a> [sgs](#input\_sgs) | List of SG ids for EC2 instance. | `list(string)` | `[]` | no |
| <a name="input_should_create_keypair"></a> [should\_create\_keypair](#input\_should\_create\_keypair) | Should a new key pair be created for the ec2 instance? | `bool` | `false` | no |
| <a name="input_subnet_id"></a> [subnet\_id](#input\_subnet\_id) | ID of the subnet you want to place the instance inside. | `string` | `null` | no |
| <a name="input_user_data_file_path"></a> [user\_data\_file\_path](#input\_user\_data\_file\_path) | Path of the file in which user data is stored. | `string` | `null` | no |
## Outputs

| Name | Description |
|------|-------------|
| <a name="output_dns"></a> [dns](#output\_dns) | n/a |
<!-- END_TF_DOCS -->