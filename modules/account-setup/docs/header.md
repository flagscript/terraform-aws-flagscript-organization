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
