<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.5 |
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
| [aws_organizations_organizational_unit.workload_ou](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/organizations_organizational_unit) | resource |
| [aws_organizations_organizational_unit.workload_prod_ou](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/organizations_organizational_unit) | resource |
| [aws_organizations_organizational_unit.workload_test_ou](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/organizations_organizational_unit) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_application_id"></a> [application\_id](#input\_application\_id) | Application Id | `string` | n/a | yes |
| <a name="input_client_id"></a> [client\_id](#input\_client\_id) | The id for the client. | `string` | n/a | yes |
| <a name="input_org_owner"></a> [org\_owner](#input\_org\_owner) | Owner moniker for the flagscript organization. | `string` | `"flagscript"` | no |
| <a name="input_workloads_ou_id"></a> [workloads\_ou\_id](#input\_workloads\_ou\_id) | ID of the flagscript workloads ou. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_ou_arn"></a> [ou\_arn](#output\_ou\_arn) | ARN of the client workload organizational unit. |
| <a name="output_ou_id"></a> [ou\_id](#output\_ou\_id) | Identifier of the client workload organizational unit. |
| <a name="output_prod_ou_arn"></a> [prod\_ou\_arn](#output\_prod\_ou\_arn) | ARN of the production client workload production organizational unit. |
| <a name="output_prod_ou_id"></a> [prod\_ou\_id](#output\_prod\_ou\_id) | Identifier of the production client workload production organizational unit. |
| <a name="output_test_ou_arn"></a> [test\_ou\_arn](#output\_test\_ou\_arn) | ARN of the test client workload test organizational unit. |
| <a name="output_test_ou_id"></a> [test\_ou\_id](#output\_test\_ou\_id) | Identifier of the test client workload test organizational unit. |
<!-- END_TF_DOCS -->