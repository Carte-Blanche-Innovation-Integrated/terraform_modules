# Module for Hosted zone record(s)

Create one or more records with, optional, certificate creation in a hosted zone.

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
	 zone_id = 

	 # Optional variables
	 records = []
}
```
## Resources

| Name | Type |
|------|------|
| [aws_route53_record.simple_records](https://registry.terraform.io/providers/hashicorp/aws/4.46.0/docs/resources/route53_record) | resource |
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_records"></a> [records](#input\_records) | List of records to add to the hosted zone | <pre>list(object(<br>    {<br>      name  = string<br>      type  = string<br>      ttl   = number<br>      value = list(string)<br>    }<br>  ))</pre> | `[]` | no |
| <a name="input_zone_id"></a> [zone\_id](#input\_zone\_id) | The Hosted Zone ID | `string` | n/a | yes |
## Outputs

| Name | Description |
|------|-------------|
| <a name="output_record_fqdns"></a> [record\_fqdns](#output\_record\_fqdns) | Fully qualified domain names of all the records created |
<!-- END_TF_DOCS -->
