# Flagscript Organization

An opinionated, low-cost AWS Organization for enthusiasts and small teams. This module turns an AWS management account into an organization with a recommended organizational unit (OU) layout, the policy types and trusted service access you need for most organization-wide services, a monthly cost budget, and organization-level cost tooling.

The OU layout follows the AWS guidance in [Best practices for organizational units](https://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_ous_best_practices.html).

## What it creates

- **The organization** with `feature_set = "ALL"` and these policy types enabled: AI services opt-out, backup, chatbot, EC2 declarative, resource control, Security Hub, service control and tag policies.
- **Trusted service access** for 38 AWS service principals, including IAM Access Analyzer, AWS Backup, CloudTrail, AWS Config (including multi-account setup), Control Tower, GuardDuty, Security Hub, Security Lake, Inspector, Macie, Detective, IAM Identity Center (SSO), RAM, IPAM, Systems Manager, Service Catalog, CloudFormation StackSets, Compute Optimizer, Cost Optimization Hub and tag policies.
- **Centralized root access**: the `RootCredentialsManagement` and `RootSessions` features of IAM, so member accounts can run without root credentials.
- **The OU tree** shown below.
- **A monthly cost budget** (`global-cost-budget`) that sends a forecasted-spend email at the warning threshold and again at 100% of the limit.
- **Cost Optimization Hub** enrollment for the whole organization, including member accounts.
- **Cost allocation tags** `flagscript:cost-allocation:application-id` and `flagscript:cost-allocation:owner`, activated in Billing.

### Organizational units

```text
Root
├── AFT
├── Deployments
│   ├── Test
│   └── Prod
├── Infrastructure
│   ├── Test
│   └── Prod
├── Sandbox
├── Security
├── Security Tooling
│   ├── Test
│   └── Prod
├── Suspended
├── Transitional
└── Workloads
    ├── Test
    └── Prod
```

Every OU gets the module's common `flagscript:*` tags plus anything you pass in `tags`. The ID and ARN of each OU is an output, so other configurations can place accounts in it.

## Usage

Apply this module with credentials for the **management account**. The organization must not already exist. If it does, import it first.

```hcl
provider "aws" {
  region = "us-west-2"
}

module "organization" {
  source  = "flagscript/flagscript-organization/aws"
  version = "~> 0.11"

  org_owner = "my-org"

  global_cost_budget_limit               = "50"
  global_cost_budget_warning_threshold   = 80
  global_cost_budget_notification_emails = ["billing@example.com"]
}
```

Set `global_cost_budget_notification_emails`. Otherwise the budget alerts have no one to send to.

### Using with AWS Control Tower

The organization already trusts AWS Config and Control Tower, so you can deploy a Control Tower landing zone on top of it. To encrypt Control Tower's logs with your own key, use the [`control-tower-kms-key`](https://registry.terraform.io/modules/flagscript/flagscript-organization/aws/latest/submodules/control-tower-kms-key) submodule.

## Submodules

These submodules build on the organization:

| Submodule                                                                                                                                       | Purpose                                                                                                                                   |
| ----------------------------------------------------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------- |
| [`account`](https://registry.terraform.io/modules/flagscript/flagscript-organization/aws/latest/submodules/account)                             | Creates a member account in an OU, sets its contacts, and assigns IAM Identity Center permission sets.                                    |
| [`account-setup`](https://registry.terraform.io/modules/flagscript/flagscript-organization/aws/latest/submodules/account-setup)                 | Baseline hardening inside a member account: password policy, account alias, STS token preference, S3 public access block, and an optional GitHub OIDC provider and permissions boundary policy. |
| [`client-ous`](https://registry.terraform.io/modules/flagscript/flagscript-organization/aws/latest/submodules/client-ous)                       | Creates a client's OUs under `Workloads/Test` and `Workloads/Prod`.                                                                       |
| [`control-tower-kms-key`](https://registry.terraform.io/modules/flagscript/flagscript-organization/aws/latest/submodules/control-tower-kms-key) | A KMS key and key policy that Control Tower can use to encrypt CloudTrail and AWS Config data.                                            |

Reference a submodule with a `//modules/<name>` source:

```hcl
module "client_ous" {
  source  = "flagscript/flagscript-organization/aws//modules/client-ous"
  version = "~> 0.11"

  application_id  = "acme-portal"
  client_id       = "acme-corp"
  workloads_ou_id = module.organization.workloads_ou_id
}
```

## Examples

- [default-organization](https://github.com/flagscript/terraform-aws-flagscript-organization/tree/main/examples/default-organization): the organization with all defaults.
