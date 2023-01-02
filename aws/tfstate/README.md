# Terraform state module (with s3 and dynamodb backend)

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
	 name = 

	 # Optional variables
	 common_tags = {}
}
```
## Resources

| Name | Type |
|------|------|
| [aws_dynamodb_table.terraform](https://registry.terraform.io/providers/hashicorp/aws/4.46.0/docs/resources/dynamodb_table) | resource |
| [aws_s3_bucket.bucket](https://registry.terraform.io/providers/hashicorp/aws/4.46.0/docs/resources/s3_bucket) | resource |
| [aws_s3_bucket_public_access_block.access_block](https://registry.terraform.io/providers/hashicorp/aws/4.46.0/docs/resources/s3_bucket_public_access_block) | resource |
| [aws_s3_bucket_versioning.versioning](https://registry.terraform.io/providers/hashicorp/aws/4.46.0/docs/resources/s3_bucket_versioning) | resource |
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_common_tags"></a> [common\_tags](#input\_common\_tags) | A map of common tags to be applied on all the created resources | `map(string)` | `{}` | no |
| <a name="input_name"></a> [name](#input\_name) | This name will be used as s3 bucket name and dynamodb table name. | `string` | n/a | yes |
## Outputs

No outputs.
<!-- END_TF_DOCS -->