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
| [aws_iam_account_alias.alias](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_account_alias) | resource |
| [aws_iam_account_password_policy.password_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_account_password_policy) | resource |
| [aws_s3_account_public_access_block.account_s3_public_access_block](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_account_public_access_block) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_application_id"></a> [application\_id](#input\_application\_id) | Application Id | `string` | n/a | yes |
| <a name="input_client_id"></a> [client\_id](#input\_client\_id) | The id for the client. | `string` | n/a | yes |
| <a name="input_name"></a> [name](#input\_name) | The name for the aws account. | `string` | n/a | yes |
| <a name="input_org_owner"></a> [org\_owner](#input\_org\_owner) | Owner moniker for the flagscript organization. | `string` | `"flagscript"` | no |

## Outputs

No outputs.
<!-- END_TF_DOCS -->