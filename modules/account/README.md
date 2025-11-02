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
| [aws_account_alternate_contact.account_billing_contact](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/account_alternate_contact) | resource |
| [aws_account_alternate_contact.account_operations_contact](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/account_alternate_contact) | resource |
| [aws_account_alternate_contact.account_security_contact](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/account_alternate_contact) | resource |
| [aws_account_primary_contact.account_primary_contact](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/account_primary_contact) | resource |
| [aws_organizations_account.flagscript_account](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/organizations_account) | resource |
| [aws_ssoadmin_account_assignment.devops_permission_set_assignment](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ssoadmin_account_assignment) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_application_id"></a> [application\_id](#input\_application\_id) | Application Id | `string` | n/a | yes |
| <a name="input_client_id"></a> [client\_id](#input\_client\_id) | The id for the client. | `string` | n/a | yes |
| <a name="input_contact_info"></a> [contact\_info](#input\_contact\_info) | Contact information for the account. | <pre>object({<br/>    address      = string<br/>    city         = string<br/>    company      = string<br/>    country_code = string<br/>    county       = string<br/>    email        = string<br/>    name         = string<br/>    phone        = string<br/>    postal_code  = string<br/>    state        = string<br/>    title        = string<br/>    website      = string<br/>  })</pre> | n/a | yes |
| <a name="input_devops_group_id"></a> [devops\_group\_id](#input\_devops\_group\_id) | Id of the devops iamic group. | `string` | n/a | yes |
| <a name="input_devops_permission_set_arn"></a> [devops\_permission\_set\_arn](#input\_devops\_permission\_set\_arn) | Arn of the devops permission set. | `string` | n/a | yes |
| <a name="input_email"></a> [email](#input\_email) | The email address of the account. | `string` | n/a | yes |
| <a name="input_identity_store_arn"></a> [identity\_store\_arn](#input\_identity\_store\_arn) | Arn of the identity store. | `string` | n/a | yes |
| <a name="input_name"></a> [name](#input\_name) | The name for the aws account. | `string` | n/a | yes |
| <a name="input_org_owner"></a> [org\_owner](#input\_org\_owner) | Owner moniker for the flagscript organization. | `string` | `"flagscript"` | no |
| <a name="input_parent_id"></a> [parent\_id](#input\_parent\_id) | ID of the parent organizational unit. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_arn"></a> [arn](#output\_arn) | The ARN for this account. |
| <a name="output_id"></a> [id](#output\_id) | The AWS account id. |
<!-- END_TF_DOCS -->