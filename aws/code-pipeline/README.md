# CodePipeline module

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
	 pipeline_name = 
	 stages = 

	 # Optional variables
	 code_pipeline_policy = ""
	 common_tags = {}
}
```
## Resources

| Name | Type |
|------|------|
| [aws_codepipeline.codepipeline](https://registry.terraform.io/providers/hashicorp/aws/4.46.0/docs/resources/codepipeline) | resource |
| [aws_iam_role.codepipeline_role](https://registry.terraform.io/providers/hashicorp/aws/4.46.0/docs/resources/iam_role) | resource |
| [aws_iam_role_policy.codepipeline_policy](https://registry.terraform.io/providers/hashicorp/aws/4.46.0/docs/resources/iam_role_policy) | resource |
| [aws_s3_bucket.codepipeline_bucket](https://registry.terraform.io/providers/hashicorp/aws/4.46.0/docs/resources/s3_bucket) | resource |
| [aws_s3_bucket_acl.codepipeline_bucket_acl](https://registry.terraform.io/providers/hashicorp/aws/4.46.0/docs/resources/s3_bucket_acl) | resource |
| [aws_region.current](https://registry.terraform.io/providers/hashicorp/aws/4.46.0/docs/data-sources/region) | data source |
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_code_pipeline_policy"></a> [code\_pipeline\_policy](#input\_code\_pipeline\_policy) | Provide an IAM policy for CodePipeline role otherwise a default policy will be applied | `string` | `""` | no |
| <a name="input_common_tags"></a> [common\_tags](#input\_common\_tags) | A map of common tags to be applied on all the created resources | `map(string)` | `{}` | no |
| <a name="input_pipeline_name"></a> [pipeline\_name](#input\_pipeline\_name) | Name of the CodePipeline | `string` | n/a | yes |
| <a name="input_stages"></a> [stages](#input\_stages) | A list of stages that constitute this pipeline | <pre>list(object({<br>    name   = string<br>    action = map(any)<br>  }))</pre> | n/a | yes |
## Outputs

No outputs.
<!-- END_TF_DOCS -->
