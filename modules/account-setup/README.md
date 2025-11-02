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
| [aws_iam_account_alias.alias](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_account_alias) | resource |
| [aws_iam_account_password_policy.password_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_account_password_policy) | resource |
| [aws_iam_openid_connect_provider.github_openid_provider](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_openid_connect_provider) | resource |
| [aws_s3_account_public_access_block.account_s3_public_access_block](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_account_public_access_block) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_install_github_openid_profider"></a> [install\_github\_openid\_profider](#input\_install\_github\_openid\_profider) | Whether or not to install the github oidc provider. Currently for flagscript, this is only for accounts where github is pushing s3 content. | `bool` | `false` | no |
| <a name="input_name"></a> [name](#input\_name) | The name for the aws account. | `string` | n/a | yes |
| <a name="input_openid_provider_name"></a> [openid\_provider\_name](#input\_openid\_provider\_name) | Name of the github openid provider. | `string` | `"FlagscriptGitHibOpenIdProvider"` | no |

## Outputs

No outputs.
<!-- END_TF_DOCS -->