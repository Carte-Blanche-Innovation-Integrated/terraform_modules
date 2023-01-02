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
	 sg_name = 
	 sg_vpc_id = 

	 # Optional variables
	 common_tags = {}
	 rules = [
  {
    "cidrs": [
      "0.0.0.0/0"
    ],
    "from_port": 0,
    "protocol": "all",
    "sg": "",
    "to_port": 0,
    "type": "ingress"
  },
  {
    "cidrs": [
      "0.0.0.0/0"
    ],
    "from_port": 0,
    "protocol": "all",
    "sg": "",
    "to_port": 0,
    "type": "egress"
  }
]
	 sg_description = "Managed by Terraform"
}
```
## Resources

| Name | Type |
|------|------|
| [aws_security_group.sg](https://registry.terraform.io/providers/hashicorp/aws/4.46.0/docs/resources/security_group) | resource |
| [aws_security_group_rule.rules](https://registry.terraform.io/providers/hashicorp/aws/4.46.0/docs/resources/security_group_rule) | resource |
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_common_tags"></a> [common\_tags](#input\_common\_tags) | A map of common tags to be applied on all the created resources | `map(string)` | `{}` | no |
| <a name="input_rules"></a> [rules](#input\_rules) | List of all ingress/egress rules to be attached to the sg | <pre>list(<br>    object(<br>      {<br>        type      = string<br>        to_port   = number<br>        from_port = number<br>        protocol  = string<br>        cidrs     = list(string)<br>        sg        = string<br>      }<br>    )<br>  )</pre> | <pre>[<br>  {<br>    "cidrs": [<br>      "0.0.0.0/0"<br>    ],<br>    "from_port": 0,<br>    "protocol": "all",<br>    "sg": "",<br>    "to_port": 0,<br>    "type": "ingress"<br>  },<br>  {<br>    "cidrs": [<br>      "0.0.0.0/0"<br>    ],<br>    "from_port": 0,<br>    "protocol": "all",<br>    "sg": "",<br>    "to_port": 0,<br>    "type": "egress"<br>  }<br>]</pre> | no |
| <a name="input_sg_description"></a> [sg\_description](#input\_sg\_description) | Description of the security group | `string` | `"Managed by Terraform"` | no |
| <a name="input_sg_name"></a> [sg\_name](#input\_sg\_name) | Name of the security group | `string` | n/a | yes |
| <a name="input_sg_vpc_id"></a> [sg\_vpc\_id](#input\_sg\_vpc\_id) | ID of the vpc where sg is placed | `string` | n/a | yes |
## Outputs

| Name | Description |
|------|-------------|
| <a name="output_sg_arn"></a> [sg\_arn](#output\_sg\_arn) | ARN of the security group |
| <a name="output_sg_id"></a> [sg\_id](#output\_sg\_id) | ID of the security group |
<!-- END_TF_DOCS -->