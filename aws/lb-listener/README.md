# Load balancer listener module

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
	 listeners = 

	 # Optional variables
	 common_tags = {}
}
```
## Resources

| Name | Type |
|------|------|
| [aws_lb_listener.listeners](https://registry.terraform.io/providers/hashicorp/aws/4.46.0/docs/resources/lb_listener) | resource |
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_common_tags"></a> [common\_tags](#input\_common\_tags) | A map of common tags to be applied on all the created resources | `map(string)` | `{}` | no |
| <a name="input_listeners"></a> [listeners](#input\_listeners) | List of listener objects | `list(map(any))` | n/a | yes |
## Outputs

No outputs.
<!-- END_TF_DOCS -->
