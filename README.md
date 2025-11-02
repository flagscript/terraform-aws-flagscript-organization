<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~> 1.13 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 6.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | ~> 6.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_iam_organizations_features.flagscript_org_iam_organizations_features](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_organizations_features) | resource |
| [aws_organizations_organization.flagscript_org](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/organizations_organization) | resource |
| [aws_organizations_organizational_unit.deployments_ou](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/organizations_organizational_unit) | resource |
| [aws_organizations_organizational_unit.deployments_prod_ou](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/organizations_organizational_unit) | resource |
| [aws_organizations_organizational_unit.deployments_test_ou](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/organizations_organizational_unit) | resource |
| [aws_organizations_organizational_unit.infrastructure_ou](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/organizations_organizational_unit) | resource |
| [aws_organizations_organizational_unit.infrastructure_prod_ou](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/organizations_organizational_unit) | resource |
| [aws_organizations_organizational_unit.infrastructure_test_ou](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/organizations_organizational_unit) | resource |
| [aws_organizations_organizational_unit.sandbox_ou](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/organizations_organizational_unit) | resource |
| [aws_organizations_organizational_unit.security_ou](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/organizations_organizational_unit) | resource |
| [aws_organizations_organizational_unit.security_prod_ou](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/organizations_organizational_unit) | resource |
| [aws_organizations_organizational_unit.security_test_ou](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/organizations_organizational_unit) | resource |
| [aws_organizations_organizational_unit.suspended_ou](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/organizations_organizational_unit) | resource |
| [aws_organizations_organizational_unit.transitional_ou](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/organizations_organizational_unit) | resource |
| [aws_organizations_organizational_unit.workloads_ou](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/organizations_organizational_unit) | resource |
| [aws_organizations_organizational_unit.workloads_prod_ou](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/organizations_organizational_unit) | resource |
| [aws_organizations_organizational_unit.workloads_test_ou](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/organizations_organizational_unit) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_application_id"></a> [application\_id](#input\_application\_id) | Application Id | `string` | `"flagscript-organization"` | no |
| <a name="input_org_owner"></a> [org\_owner](#input\_org\_owner) | Owner moniker for the flagscript organization. This is your owner id for your enthusiast organization. | `string` | `"flagscript"` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | Additional tags to merge with every created resource in this module. | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_deployments_ou_arn"></a> [deployments\_ou\_arn](#output\_deployments\_ou\_arn) | Arn of the deployments ou. |
| <a name="output_deployments_ou_id"></a> [deployments\_ou\_id](#output\_deployments\_ou\_id) | Id of the deployments ou. |
| <a name="output_infrastructure_ou_arn"></a> [infrastructure\_ou\_arn](#output\_infrastructure\_ou\_arn) | Arn of the infrastructure ou. |
| <a name="output_infrastructure_ou_id"></a> [infrastructure\_ou\_id](#output\_infrastructure\_ou\_id) | Id of the infrastructure ou. |
| <a name="output_org_arn"></a> [org\_arn](#output\_org\_arn) | Arn of the flagscript organization. |
| <a name="output_org_id"></a> [org\_id](#output\_org\_id) | Id of the flagscript organization. |
| <a name="output_prod_deployments_ou_arn"></a> [prod\_deployments\_ou\_arn](#output\_prod\_deployments\_ou\_arn) | Arn of the prod deployments ou. |
| <a name="output_prod_deployments_ou_id"></a> [prod\_deployments\_ou\_id](#output\_prod\_deployments\_ou\_id) | Id of the prod deployments ou. |
| <a name="output_prod_infrastructure_ou_arn"></a> [prod\_infrastructure\_ou\_arn](#output\_prod\_infrastructure\_ou\_arn) | Arn of the prod infrastructure ou. |
| <a name="output_prod_infrastructure_ou_id"></a> [prod\_infrastructure\_ou\_id](#output\_prod\_infrastructure\_ou\_id) | Id of the prod infrastructure ou. |
| <a name="output_prod_security_ou_arn"></a> [prod\_security\_ou\_arn](#output\_prod\_security\_ou\_arn) | Arn of the prod security ou. |
| <a name="output_prod_security_ou_id"></a> [prod\_security\_ou\_id](#output\_prod\_security\_ou\_id) | Id of the prod security ou. |
| <a name="output_security_ou_arn"></a> [security\_ou\_arn](#output\_security\_ou\_arn) | Arn of the security ou. |
| <a name="output_security_ou_id"></a> [security\_ou\_id](#output\_security\_ou\_id) | Id of the security ou. |
| <a name="output_suspended_ou_arn"></a> [suspended\_ou\_arn](#output\_suspended\_ou\_arn) | Arn of the suspended ou. |
| <a name="output_suspended_ou_id"></a> [suspended\_ou\_id](#output\_suspended\_ou\_id) | Id of the suspended ou. |
| <a name="output_test_deployments_ou_arn"></a> [test\_deployments\_ou\_arn](#output\_test\_deployments\_ou\_arn) | Arn of the test deployments ou. |
| <a name="output_test_deployments_ou_id"></a> [test\_deployments\_ou\_id](#output\_test\_deployments\_ou\_id) | Id of the test deployments ou. |
| <a name="output_test_infrastructure_ou_arn"></a> [test\_infrastructure\_ou\_arn](#output\_test\_infrastructure\_ou\_arn) | Arn of the test infrastructure ou. |
| <a name="output_test_infrastructure_ou_id"></a> [test\_infrastructure\_ou\_id](#output\_test\_infrastructure\_ou\_id) | Id of the test infrastructure ou. |
| <a name="output_test_security_ou_arn"></a> [test\_security\_ou\_arn](#output\_test\_security\_ou\_arn) | Arn of the test security ou. |
| <a name="output_test_security_ou_id"></a> [test\_security\_ou\_id](#output\_test\_security\_ou\_id) | Id of the test security ou. |
| <a name="output_workloads_ou_arn"></a> [workloads\_ou\_arn](#output\_workloads\_ou\_arn) | Arn of the workloads ou. |
| <a name="output_workloads_ou_id"></a> [workloads\_ou\_id](#output\_workloads\_ou\_id) | Id of the workloads ou. |
<!-- END_TF_DOCS -->