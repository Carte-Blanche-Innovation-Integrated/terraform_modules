<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.3 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | 4.46.0 |
| <a name="requirement_random"></a> [random](#requirement\_random) | 3.4.3 |
## Usage
Basic usage of this module is as follows:
```hcl
module "example" {
	 source = "<module-path>"

	 # Required variables
	 vpc_cidr = 
	 vpc_name = 

	 # Optional variables
	 enable_nat = false
	 private_subnet_cidrs = []
	 public_subnet_cidrs = []
	 single_nat = true
}
```
## Resources

| Name | Type |
|------|------|
| [aws_eip.public_nat_eips](https://registry.terraform.io/providers/hashicorp/aws/4.46.0/docs/resources/eip) | resource |
| [aws_internet_gateway.igw](https://registry.terraform.io/providers/hashicorp/aws/4.46.0/docs/resources/internet_gateway) | resource |
| [aws_nat_gateway.nat_gateways](https://registry.terraform.io/providers/hashicorp/aws/4.46.0/docs/resources/nat_gateway) | resource |
| [aws_route.private_internet_access](https://registry.terraform.io/providers/hashicorp/aws/4.46.0/docs/resources/route) | resource |
| [aws_route.public_internet_access](https://registry.terraform.io/providers/hashicorp/aws/4.46.0/docs/resources/route) | resource |
| [aws_route_table.private_tables](https://registry.terraform.io/providers/hashicorp/aws/4.46.0/docs/resources/route_table) | resource |
| [aws_route_table.public_tables](https://registry.terraform.io/providers/hashicorp/aws/4.46.0/docs/resources/route_table) | resource |
| [aws_route_table_association.private_associations](https://registry.terraform.io/providers/hashicorp/aws/4.46.0/docs/resources/route_table_association) | resource |
| [aws_route_table_association.public_associations](https://registry.terraform.io/providers/hashicorp/aws/4.46.0/docs/resources/route_table_association) | resource |
| [aws_subnet.private_subnets](https://registry.terraform.io/providers/hashicorp/aws/4.46.0/docs/resources/subnet) | resource |
| [aws_subnet.public_subnets](https://registry.terraform.io/providers/hashicorp/aws/4.46.0/docs/resources/subnet) | resource |
| [aws_vpc.vpc](https://registry.terraform.io/providers/hashicorp/aws/4.46.0/docs/resources/vpc) | resource |
| [random_shuffle.az](https://registry.terraform.io/providers/hashicorp/random/3.4.3/docs/resources/shuffle) | resource |
| [aws_availability_zones.all](https://registry.terraform.io/providers/hashicorp/aws/4.46.0/docs/data-sources/availability_zones) | data source |
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_enable_nat"></a> [enable\_nat](#input\_enable\_nat) | Whether to create nat gateways or not. | `bool` | `false` | no |
| <a name="input_private_subnet_cidrs"></a> [private\_subnet\_cidrs](#input\_private\_subnet\_cidrs) | A list of CIDR blocks for the private subnets | `list(any)` | `[]` | no |
| <a name="input_public_subnet_cidrs"></a> [public\_subnet\_cidrs](#input\_public\_subnet\_cidrs) | A list of CIDR blocks for the public subnets | `list(any)` | `[]` | no |
| <a name="input_single_nat"></a> [single\_nat](#input\_single\_nat) | Should create only one nat, hooked up with all private subnets? | `bool` | `true` | no |
| <a name="input_vpc_cidr"></a> [vpc\_cidr](#input\_vpc\_cidr) | CIDR block for the VPC | `string` | n/a | yes |
| <a name="input_vpc_name"></a> [vpc\_name](#input\_vpc\_name) | Name of the VPC | `string` | n/a | yes |
## Outputs

| Name | Description |
|------|-------------|
| <a name="output_private_subnet_cidrs"></a> [private\_subnet\_cidrs](#output\_private\_subnet\_cidrs) | n/a |
| <a name="output_private_subnet_ids"></a> [private\_subnet\_ids](#output\_private\_subnet\_ids) | n/a |
| <a name="output_public_subnet_cidrs"></a> [public\_subnet\_cidrs](#output\_public\_subnet\_cidrs) | n/a |
| <a name="output_public_subnet_ids"></a> [public\_subnet\_ids](#output\_public\_subnet\_ids) | n/a |
| <a name="output_vpc_id"></a> [vpc\_id](#output\_vpc\_id) | n/a |
<!-- END_TF_DOCS -->