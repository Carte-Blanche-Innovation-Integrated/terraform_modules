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
	 domain = 

	 # Optional variables
	 records = []
}
```
## Resources

| Name | Type |
|------|------|
| [aws_route53_record.simple_records](https://registry.terraform.io/providers/hashicorp/aws/4.46.0/docs/resources/route53_record) | resource |
| [aws_route53_zone.public_zone](https://registry.terraform.io/providers/hashicorp/aws/4.46.0/docs/resources/route53_zone) | resource |
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_domain"></a> [domain](#input\_domain) | The domain name you want this hosted zone to be associated with. | `string` | n/a | yes |
| <a name="input_records"></a> [records](#input\_records) | List of records to add to the hosted zone | <pre>list(object(<br>    {<br>      name  = string<br>      type  = string<br>      ttl   = number<br>      value = list(string)<br>    }<br>  ))</pre> | `[]` | no |
## Outputs

No outputs.
<!-- END_TF_DOCS -->