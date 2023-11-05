<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~> 1.6 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 5.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | ~> 5.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_infrastructure_ou"></a> [infrastructure\_ou](#module\_infrastructure\_ou) | ./modules/flagscript-staged-ou | n/a |
| <a name="module_security_ou"></a> [security\_ou](#module\_security\_ou) | ./modules/flagscript-staged-ou | n/a |
| <a name="module_suspended_ou"></a> [suspended\_ou](#module\_suspended\_ou) | ./modules/foundational-ou | n/a |
| <a name="module_workloads_ou"></a> [workloads\_ou](#module\_workloads\_ou) | ./modules/foundational-ou | n/a |

## Resources

| Name | Type |
|------|------|
| [aws_organizations_organization.flagscript_org](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/organizations_organization) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_allowed_service_principals"></a> [allowed\_service\_principals](#input\_allowed\_service\_principals) | List of AWS service principal names for which you want to enable integration with your organization. | `list(string)` | `[]` | no |
| <a name="input_application_id"></a> [application\_id](#input\_application\_id) | Application Id | `string` | n/a | yes |
| <a name="input_enabled_policy_types"></a> [enabled\_policy\_types](#input\_enabled\_policy\_types) | List of Organizations policy types to enable in the Organization Root. | `list(string)` | <pre>[<br>  "AISERVICES_OPT_OUT_POLICY",<br>  "BACKUP_POLICY",<br>  "SERVICE_CONTROL_POLICY",<br>  "TAG_POLICY"<br>]</pre> | no |
| <a name="input_feature_set"></a> [feature\_set](#input\_feature\_set) | Specify 'ALL' (default) or 'CONSOLIDATED\_BILLING'. | `string` | `"ALL"` | no |
| <a name="input_org_owner"></a> [org\_owner](#input\_org\_owner) | Owner moniker for the flagscript organization. | `string` | `"flagscript"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_infrastructure_ou_arn"></a> [infrastructure\_ou\_arn](#output\_infrastructure\_ou\_arn) | Arn of the infrastructure ou. |
| <a name="output_infrastructure_ou_id"></a> [infrastructure\_ou\_id](#output\_infrastructure\_ou\_id) | Id of the infrastructure ou. |
| <a name="output_org_arn"></a> [org\_arn](#output\_org\_arn) | Arn of the flagscript organization. |
| <a name="output_org_id"></a> [org\_id](#output\_org\_id) | Id of the flagscript organization. |
| <a name="output_prod_infrastructure_ou_arn"></a> [prod\_infrastructure\_ou\_arn](#output\_prod\_infrastructure\_ou\_arn) | Arn of the prod infrastructure ou. |
| <a name="output_prod_infrastructure_ou_id"></a> [prod\_infrastructure\_ou\_id](#output\_prod\_infrastructure\_ou\_id) | Id of the prod infrastructure ou. |
| <a name="output_prod_security_ou_arn"></a> [prod\_security\_ou\_arn](#output\_prod\_security\_ou\_arn) | Arn of the prod security ou. |
| <a name="output_prod_security_ou_id"></a> [prod\_security\_ou\_id](#output\_prod\_security\_ou\_id) | Id of the prod security ou. |
| <a name="output_security_ou_arn"></a> [security\_ou\_arn](#output\_security\_ou\_arn) | Arn of the security ou. |
| <a name="output_security_ou_id"></a> [security\_ou\_id](#output\_security\_ou\_id) | Id of the security ou. |
| <a name="output_suspended_ou_arn"></a> [suspended\_ou\_arn](#output\_suspended\_ou\_arn) | Arn of the suspended ou. |
| <a name="output_suspended_ou_id"></a> [suspended\_ou\_id](#output\_suspended\_ou\_id) | Id of the suspended ou. |
| <a name="output_test_infrastructure_ou_arn"></a> [test\_infrastructure\_ou\_arn](#output\_test\_infrastructure\_ou\_arn) | Arn of the test infrastructure ou. |
| <a name="output_test_infrastructure_ou_id"></a> [test\_infrastructure\_ou\_id](#output\_test\_infrastructure\_ou\_id) | Id of the test infrastructure ou. |
| <a name="output_test_security_ou_arn"></a> [test\_security\_ou\_arn](#output\_test\_security\_ou\_arn) | Arn of the test security ou. |
| <a name="output_test_security_ou_id"></a> [test\_security\_ou\_id](#output\_test\_security\_ou\_id) | Id of the test security ou. |
| <a name="output_workloads_ou_arn"></a> [workloads\_ou\_arn](#output\_workloads\_ou\_arn) | Arn of the workloads ou. |
| <a name="output_workloads_ou_id"></a> [workloads\_ou\_id](#output\_workloads\_ou\_id) | Id of the workloads ou. |
<!-- END_TF_DOCS -->