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
