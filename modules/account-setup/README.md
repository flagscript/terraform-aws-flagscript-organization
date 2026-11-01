# account-setup

Applies a security baseline inside a single member account. Run it with credentials for the **member account itself**, not the management account. A common way is a provider that assumes `OrganizationAccountAccessRole` in the new account.

## What it creates

- **An IAM password policy**: at least 14 characters, uppercase, lowercase, numbers and symbols all required, passwords expire after 90 days, and the last 24 cannot be reused. Users can change their own passwords, and expired passwords can still be reset (`hard_expiry = false`).
- **An IAM account alias** set to `name`, which gives the account a friendly sign-in URL.
- **An S3 account-level public access block** with all four settings turned on.
- **A GitHub Actions OIDC provider** (optional) for `https://token.actions.githubusercontent.com` with the `sts.amazonaws.com` audience. GitHub Actions workflows can then assume IAM roles in the account without long-lived keys.

## Usage

```hcl
provider "aws" {
  alias  = "acme_prod"
  region = "us-west-2"

  assume_role {
    role_arn = "arn:aws:iam::${module.acme_prod_account.id}:role/OrganizationAccountAccessRole"
  }
}

module "acme_prod_setup" {
  source  = "flagscript/flagscript-organization/aws//modules/account-setup"
  version = "~> 0.9"

  providers = {
    aws = aws.acme_prod
  }

  name                           = "acme-prod"
  install_github_openid_profider = true
}
```

## Notes

- Spell the OIDC toggle `install_github_openid_profider`, exactly as the input is named.
- The OIDC provider has no IAM roles. Create the roles your workflows assume, with trust policies scoped to your repositories, separately.
- An account can have only one password policy, one account alias and one S3 account public access block. This module replaces any that already exist.

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
| [aws_iam_account_alias.alias](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_account_alias) | resource |
| [aws_iam_account_password_policy.password_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_account_password_policy) | resource |
| [aws_iam_openid_connect_provider.github_openid_provider](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_openid_connect_provider) | resource |
| [aws_s3_account_public_access_block.account_s3_public_access_block](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_account_public_access_block) | resource |

## Inputs

| Name | Description | Type | Default | Required |
| ---- | ----------- | ---- | ------- | :------: |
| <a name="input_name"></a> [name](#input\_name) | The name for the aws account. | `string` | n/a | yes |
| <a name="input_install_github_openid_profider"></a> [install\_github\_openid\_profider](#input\_install\_github\_openid\_profider) | Whether or not to install the github oidc provider. Currently for flagscript, this is only for accounts where github is pushing s3 content. | `bool` | `false` | no |
| <a name="input_openid_provider_name"></a> [openid\_provider\_name](#input\_openid\_provider\_name) | Name of the github openid provider. | `string` | `"FlagscriptGitHibOpenIdProvider"` | no |

## Outputs

No outputs.
<!-- END_TF_DOCS -->
