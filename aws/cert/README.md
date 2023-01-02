# Module for ACM cert

Create an ACM certificate with automatic DNS validation via route 53.

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
	 record_fqdn = 
	 zone_id = 

	 # Optional variables
	 common_tags = {}
}
```
## Resources

| Name | Type |
|------|------|
| [aws_acm_certificate.cert](https://registry.terraform.io/providers/hashicorp/aws/4.46.0/docs/resources/acm_certificate) | resource |
| [aws_acm_certificate_validation.cert](https://registry.terraform.io/providers/hashicorp/aws/4.46.0/docs/resources/acm_certificate_validation) | resource |
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_common_tags"></a> [common\_tags](#input\_common\_tags) | A map of common tags to be applied on all the created resources | `map(string)` | `{}` | no |
| <a name="input_record_fqdn"></a> [record\_fqdn](#input\_record\_fqdn) | FQDN for which the certificate is issued | `string` | n/a | yes |
| <a name="input_zone_id"></a> [zone\_id](#input\_zone\_id) | The Hosted Zone ID | `string` | n/a | yes |
## Outputs

| Name | Description |
|------|-------------|
| <a name="output_certificate_arn"></a> [certificate\_arn](#output\_certificate\_arn) | ARN of the certificate |
<!-- END_TF_DOCS -->
