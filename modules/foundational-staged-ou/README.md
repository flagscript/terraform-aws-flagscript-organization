<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.6 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 5.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 5.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_organizations_organizational_unit.foundational_ou](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/organizations_organizational_unit) | resource |
| [aws_organizations_organizational_unit.foundational_prod_ou](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/organizations_organizational_unit) | resource |
| [aws_organizations_organizational_unit.foundational_test_ou](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/organizations_organizational_unit) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_application_id"></a> [application\_id](#input\_application\_id) | Application Id | `string` | n/a | yes |
| <a name="input_name"></a> [name](#input\_name) | The name for the organizational unit. | `string` | n/a | yes |
| <a name="input_org_owner"></a> [org\_owner](#input\_org\_owner) | Owner moniker for the flagscript organization. | `string` | `"flagscript"` | no |
| <a name="input_parent_id"></a> [parent\_id](#input\_parent\_id) | ID of the parent organizational unit, which may be the root. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_ou_arn"></a> [ou\_arn](#output\_ou\_arn) | ARN of the foundational organizational unit. |
| <a name="output_ou_id"></a> [ou\_id](#output\_ou\_id) | Identifier of the foundational organizational unit. |
| <a name="output_prod_ou_arn"></a> [prod\_ou\_arn](#output\_prod\_ou\_arn) | ARN of the production foundational organizational unit. |
| <a name="output_prod_ou_id"></a> [prod\_ou\_id](#output\_prod\_ou\_id) | Identifier of the production foundational organizational unit. |
| <a name="output_test_ou_arn"></a> [test\_ou\_arn](#output\_test\_ou\_arn) | ARN of the test foundational organizational unit. |
| <a name="output_test_ou_id"></a> [test\_ou\_id](#output\_test\_ou\_id) | Identifier of the test foundational organizational unit. |
<!-- END_TF_DOCS -->