<!-- BEGIN_TF_DOCS -->
# account-setup

Applies a security baseline inside a single member account. Run it with credentials for the **member account itself**, not the management account. A common way is a provider that assumes `OrganizationAccountAccessRole` in the new account.

## What it creates

- **An IAM password policy**: at least 14 characters, uppercase, lowercase, numbers and symbols all required, passwords expire after 90 days, and the last 24 cannot be reused. Users can change their own passwords, and expired passwords can still be reset (`hard_expiry = false`).
- **An IAM account alias** set to `name`, which gives the account a friendly sign-in URL.
- **An STS token version preference** for the global endpoint (`sts.amazonaws.com`), set by `token_version_preference`. The default `v1Token` works only in Regions that are enabled by default. `v2Token` works in all Regions but the tokens are larger.
- **An S3 account-level public access block** with all four settings turned on.
- **A GitHub Actions OIDC provider** (optional, `install_github_openid_provider = true`) for `https://token.actions.githubusercontent.com` with the `sts.amazonaws.com` audience. GitHub Actions workflows can then assume IAM roles in the account without long-lived keys.
- **A permissions boundary policy** (optional) named `AccountPermissionsBoundaryPolicy`, created from the JSON document in `account_permissions_boundary_policy_json_document`. The module only **creates** the policy. It doesn't attach it to anything. See "Using the permissions boundary" below.

## Usage

```hcl
provider "aws" {
  alias  = "acme_prod"
  region = "us-west-2"

  assume_role {
    role_arn = "arn:aws:iam::${module.acme_prod_account.id}:role/OrganizationAccountAccessRole"
  }
}

data "aws_iam_policy_document" "boundary" {
  statement {
    sid       = "AllowAll"
    effect    = "Allow"
    actions   = ["*"]
    resources = ["*"]
  }

  statement {
    sid    = "DenyBoundaryPolicyChanges"
    effect = "Deny"
    actions = [
      "iam:DeletePolicy",
      "iam:CreatePolicyVersion",
      "iam:DeletePolicyVersion",
      "iam:SetDefaultPolicyVersion",
    ]
    resources = ["arn:aws:iam::*:policy/AccountPermissionsBoundaryPolicy"]
  }

  statement {
    sid    = "DenyBoundaryRemoval"
    effect = "Deny"
    actions = [
      "iam:DeleteRolePermissionsBoundary",
      "iam:DeleteUserPermissionsBoundary",
    ]
    resources = ["*"]
  }
}

module "acme_prod_setup" {
  source  = "flagscript/flagscript-organization/aws//modules/account-setup"
  version = "~> 0.11"

  providers = {
    aws = aws.acme_prod
  }

  name                           = "acme-prod"
  install_github_openid_provider = true

  account_permissions_boundary_policy_json_document = data.aws_iam_policy_document.boundary.json
}
```

The policy document is up to you. The one above only stops roles and users from removing or editing their own boundary. A real boundary should also limit what they can do. You can also load a file with `file("${path.module}/boundary.json")`.

## Using the permissions boundary

A permissions boundary sets the most permissions an IAM role or user can have. It doesn't grant anything on its own. It only takes effect on the roles and users it's attached to.

Use the module's outputs to attach it:

```hcl
resource "aws_iam_role" "app" {
  provider = aws.acme_prod

  name                 = "acme-app"
  assume_role_policy   = data.aws_iam_policy_document.app_trust.json
  permissions_boundary = module.acme_prod_setup.account_permissions_boundary_policy_arn
}
```

Configurations that don't call this module can look the policy up by name with the `aws_iam_policy` data source:

```hcl
data "aws_iam_policy" "boundary" {
  provider = aws.acme_prod
  name     = "AccountPermissionsBoundaryPolicy"
}
```

- **Use the member account's provider.** The data source looks for the name only in the account its provider is signed in to.
- **In the same configuration as this module, use the output, not the literal name**: `name = module.acme_prod_setup.account_permissions_boundary_policy_name`. Terraform then waits for the policy to exist before looking it up. A hard-coded name can be looked up before the policy is created.

Both outputs are `null` when no policy document is given.

## Notes

- The OIDC provider has no IAM roles. Create the roles your workflows assume, with trust policies scoped to your repositories, separately.
- Changing the policy *document* updates the policy in place. Changing its description or name replaces it, which affects every role and user that uses it as a boundary.
- An account can have only one password policy, one account alias, one STS token preference and one S3 account public access block. This module replaces any that already exist.

## Requirements

| Name | Version |
| ---- | ------- |
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.16 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 6.72 |

## Providers

| Name | Version |
| ---- | ------- |
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 6.72 |

## Resources

| Name | Type |
| ---- | ---- |
| [aws_iam_account_alias.alias](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_account_alias) | resource |
| [aws_iam_account_password_policy.password_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_account_password_policy) | resource |
| [aws_iam_openid_connect_provider.github](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_openid_connect_provider) | resource |
| [aws_iam_policy.account_boundary](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_security_token_service_preferences.token_version_preference](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_security_token_service_preferences) | resource |
| [aws_s3_account_public_access_block.account_s3_public_access_block](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_account_public_access_block) | resource |

## Inputs

| Name | Description | Type | Default | Required |
| ---- | ----------- | ---- | ------- | :------: |
| <a name="input_name"></a> [name](#input\_name) | The name for the aws account. | `string` | n/a | yes |
| <a name="input_account_permissions_boundary_policy_json_document"></a> [account\_permissions\_boundary\_policy\_json\_document](#input\_account\_permissions\_boundary\_policy\_json\_document) | Optional JSON document containing the recommended account permissions boundary policy. | `string` | `null` | no |
| <a name="input_install_github_openid_provider"></a> [install\_github\_openid\_provider](#input\_install\_github\_openid\_provider) | Whether or not to install a github oidc provider for the account. | `bool` | `false` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | Additional tags to merge with every created resource in this module. | `map(string)` | `{}` | no |
| <a name="input_token_version_preference"></a> [token\_version\_preference](#input\_token\_version\_preference) | The global endpoint token version preference for the account. | `string` | `"v1Token"` | no |

## Outputs

| Name | Description |
| ---- | ----------- |
| <a name="output_account_permissions_boundary_policy_arn"></a> [account\_permissions\_boundary\_policy\_arn](#output\_account\_permissions\_boundary\_policy\_arn) | Arn of the account permissions boundary policy. |
| <a name="output_account_permissions_boundary_policy_name"></a> [account\_permissions\_boundary\_policy\_name](#output\_account\_permissions\_boundary\_policy\_name) | Name of the account permissions boundary policy. |

## Contributing

Commits follow [Conventional Commits](https://www.conventionalcommits.org/), which commitlint enforces through lefthook. Releases and the changelog are generated by semantic-release when changes merge to `main`.

The documentation tables above are generated by [terraform-docs](https://terraform-docs.io/) on pre-commit. To change the surrounding text, edit `docs/header.md` or `docs/footer.md` (or `modules/<name>/docs/header.md` for a submodule), not this README.

## License

MIT licensed. See [LICENSE](https://github.com/flagscript/terraform-aws-flagscript-organization/blob/main/LICENSE).
<!-- END_TF_DOCS -->
