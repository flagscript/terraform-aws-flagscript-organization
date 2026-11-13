# account

Creates a member account in a Flagscript organization, sets its primary and alternate contacts, and grants access through IAM Identity Center.

## What it creates

- **An AWS account** (`aws_organizations_account`) in the OU given by `parent_id`, tagged with the Flagscript ownership and cost allocation tags.
- **A primary contact** and **billing, operations and security alternate contacts**, all filled in from `contact_info`.
- **A DevOps assignment** that gives the group `devops_group_id` the permission set `devops_permission_set_arn` on the new account.
- **Default Flagscript assignments** (when `deploy_default_flagscript_iam_identity_center_permissions = true`):
  - the `cloud-administator` group gets the `administrator` permission set
  - the `security-auditor` group gets the `security-auditor` permission set

## Prerequisites

- Run in the organization's **management account**, or in a delegated administrator account for Organizations and IAM Identity Center.
- IAM Identity Center is enabled in `iam_identity_center_region`.
- When the default assignments are on, these must already exist in IAM Identity Center:
  - groups named `cloud-administator` and `security-auditor`. The first group name is looked up exactly as written, including the missing "r".
  - permission sets named `administrator` and `security-auditor`

## Usage

```hcl
module "acme_prod_account" {
  source  = "flagscript/flagscript-organization/aws//modules/account"
  version = "~> 0.9"

  name      = "acme-prod"
  email     = "aws+acme-prod@example.com"
  client_id = "acme-corp"
  parent_id = module.acme_ous.prod_ou_id

  devops_group_id           = "906753a1b2-11112222-3333-4444-5555-666677778888"
  devops_permission_set_arn = "arn:aws:sso:::permissionSet/ssoins-1234567890abcdef/ps-1234567890abcdef"

  contact_info = {
    address      = "123 Main St"
    city         = "Seattle"
    company      = "Acme Corp"
    country_code = "US"
    county       = "King"
    email        = "ops@example.com"
    name         = "Jane Doe"
    phone        = "+12065550100"
    postal_code  = "98101"
    state        = "WA"
    title        = "Operations Lead"
    website      = "https://example.com"
  }
}
```

The same `contact_info.email`, `name`, `phone` and `title` are used for all three alternate contacts. `contact_info.company` fills both the company name and the full name of the primary contact.

## Notes

- `close_on_deletion` defaults to `true`, so destroying this module **closes the AWS account** instead of only removing it from the organization. Set it to `false` if you want to keep the account.
- The account's email address must be unique across all of AWS.

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
| ---- | ------- |
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~> 1.13 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 6.0 |

## Providers

| Name | Version |
| ---- | ------- |
| <a name="provider_aws"></a> [aws](#provider\_aws) | ~> 6.0 |

## Modules

No modules.

## Resources

| Name | Type |
| ---- | ---- |
| [aws_account_alternate_contact.account_billing_contact](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/account_alternate_contact) | resource |
| [aws_account_alternate_contact.account_operations_contact](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/account_alternate_contact) | resource |
| [aws_account_alternate_contact.account_security_contact](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/account_alternate_contact) | resource |
| [aws_account_primary_contact.account_primary_contact](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/account_primary_contact) | resource |
| [aws_organizations_account.flagscript_account](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/organizations_account) | resource |
| [aws_ssoadmin_account_assignment.cloud_administrator_administrator_set_assignment](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ssoadmin_account_assignment) | resource |
| [aws_ssoadmin_account_assignment.devops_permission_set_assignment](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ssoadmin_account_assignment) | resource |
| [aws_ssoadmin_account_assignment.security_auditor_security_auditor_set_assignment](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ssoadmin_account_assignment) | resource |
| [aws_identitystore_group.cloud_administrator_group](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/identitystore_group) | data source |
| [aws_identitystore_group.security_auditor_group](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/identitystore_group) | data source |
| [aws_ssoadmin_instances.iam_identity_center_instances](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/ssoadmin_instances) | data source |
| [aws_ssoadmin_permission_set.administator_permission_set](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/ssoadmin_permission_set) | data source |
| [aws_ssoadmin_permission_set.security_auditor_permission_set](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/ssoadmin_permission_set) | data source |

## Inputs

| Name | Description | Type | Default | Required |
| ---- | ----------- | ---- | ------- | :------: |
| <a name="input_client_id"></a> [client\_id](#input\_client\_id) | The id for the client. | `string` | n/a | yes |
| <a name="input_devops_group_id"></a> [devops\_group\_id](#input\_devops\_group\_id) | Id of the devops iamic group. | `string` | n/a | yes |
| <a name="input_devops_permission_set_arn"></a> [devops\_permission\_set\_arn](#input\_devops\_permission\_set\_arn) | Arn of the devops permission set. | `string` | n/a | yes |
| <a name="input_email"></a> [email](#input\_email) | The email address of the account. | `string` | n/a | yes |
| <a name="input_name"></a> [name](#input\_name) | The name for the aws account. | `string` | n/a | yes |
| <a name="input_parent_id"></a> [parent\_id](#input\_parent\_id) | ID of the parent organizational unit. | `string` | n/a | yes |
| <a name="input_primary_contact_info"></a> [primary\_contact\_info](#input\_primary\_contact\_info) | Primary contact information for the account. | <pre>object({<br/>    address      = string<br/>    city         = string<br/>    company      = string<br/>    country_code = string<br/>    county       = string<br/>    email        = string<br/>    name         = string<br/>    phone        = string<br/>    postal_code  = string<br/>    state        = string<br/>    title        = string<br/>    website      = string<br/>  })</pre> | n/a | yes |
| <a name="input_application_id"></a> [application\_id](#input\_application\_id) | Application Id | `string` | `"flagscript-organization"` | no |
| <a name="input_billing_contact_info"></a> [billing\_contact\_info](#input\_billing\_contact\_info) | Billing contact information for the account. | <pre>object({<br/>    email = string<br/>    name  = string<br/>    phone = string<br/>    title = string<br/>  })</pre> | `null` | no |
| <a name="input_close_on_deletion"></a> [close\_on\_deletion](#input\_close\_on\_deletion) | If true, a deletion event will close the account. Otherwise, it will only remove from the organization. | `bool` | `true` | no |
| <a name="input_deploy_default_flagscript_iam_identity_center_permissions"></a> [deploy\_default\_flagscript\_iam\_identity\_center\_permissions](#input\_deploy\_default\_flagscript\_iam\_identity\_center\_permissions) | Whether or not to deploy flagscipt default permission sets. | `bool` | `true` | no |
| <a name="input_iam_identity_center_region"></a> [iam\_identity\_center\_region](#input\_iam\_identity\_center\_region) | Region where iam identity center is configured. | `string` | `"us-west-2"` | no |
| <a name="input_iam_user_access_to_billing"></a> [iam\_user\_access\_to\_billing](#input\_iam\_user\_access\_to\_billing) | If set to ALLOW, the new account enables IAM users and roles to access account billing information if they have the required permissions. If set to DENY, then only the root user (and no roles) of the new account can access account billing information. | `string` | `"ALLOW"` | no |
| <a name="input_operations_contact_info"></a> [operations\_contact\_info](#input\_operations\_contact\_info) | Operations contact information for the account. | <pre>object({<br/>    email = string<br/>    name  = string<br/>    phone = string<br/>    title = string<br/>  })</pre> | `null` | no |
| <a name="input_org_owner"></a> [org\_owner](#input\_org\_owner) | Owner moniker for the flagscript organization. This is your owner id for your enthusiast organization. | `string` | `"flagscript"` | no |
| <a name="input_security_contact_info"></a> [security\_contact\_info](#input\_security\_contact\_info) | Security contact information for the account. | <pre>object({<br/>    email = string<br/>    name  = string<br/>    phone = string<br/>    title = string<br/>  })</pre> | `null` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | Additional tags to merge with every created resource in this module. | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
| ---- | ----------- |
| <a name="output_arn"></a> [arn](#output\_arn) | The ARN for this account. |
| <a name="output_id"></a> [id](#output\_id) | The AWS account id. |
<!-- END_TF_DOCS -->
