# Flagscript Organization

An opinionated, low-cost AWS Organization for enthusiasts and small teams. This module turns an AWS management account into an organization with a recommended organizational unit (OU) layout, the policy types and trusted service access you need for most organization-wide services, a monthly cost budget, and organization-level cost tooling.

The OU layout follows the AWS guidance in [Best practices for organizational units](https://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_ous_best_practices.html).

## What it creates

- **The organization** with `feature_set = "ALL"` and these policy types enabled: AI services opt-out, backup, chatbot, EC2 declarative, resource control, Security Hub, service control and tag policies.
- **Trusted service access** for 32 AWS service principals, including CloudTrail, GuardDuty, Security Hub, Inspector, Macie, Detective, IAM Identity Center (SSO), RAM, IPAM, Systems Manager, Service Catalog, CloudFormation StackSets, Compute Optimizer, Cost Optimization Hub and tag policies. AWS Config and Control Tower are added when `control_tower_deployed = true`.
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
  version = "~> 0.9"

  org_owner = "my-org"

  global_cost_budget_limit               = "50"
  global_cost_budget_warning_threshold   = 80
  global_cost_budget_notification_emails = ["billing@example.com"]
}
```

Set `global_cost_budget_notification_emails`. Otherwise the budget alerts have no one to send to.

### Using with AWS Control Tower

When you deploy Control Tower on top of this organization, set `control_tower_deployed = true` so the organization trusts AWS Config and Control Tower. To encrypt Control Tower's logs with your own key, use the [`control-tower-kms-key`](https://registry.terraform.io/modules/flagscript/flagscript-organization/aws/latest/submodules/control-tower-kms-key) submodule.

## Submodules

These submodules build on the organization:

| Submodule | Purpose |
|-----------|---------|
| [`account`](https://registry.terraform.io/modules/flagscript/flagscript-organization/aws/latest/submodules/account) | Creates a member account in an OU, sets its contacts, and assigns IAM Identity Center permission sets. |
| [`account-setup`](https://registry.terraform.io/modules/flagscript/flagscript-organization/aws/latest/submodules/account-setup) | Baseline hardening inside a member account: password policy, account alias, S3 public access block, and an optional GitHub OIDC provider. |
| [`client-ous`](https://registry.terraform.io/modules/flagscript/flagscript-organization/aws/latest/submodules/client-ous) | Creates a client's OUs under `Workloads/Test` and `Workloads/Prod`. |
| [`control-tower-kms-key`](https://registry.terraform.io/modules/flagscript/flagscript-organization/aws/latest/submodules/control-tower-kms-key) | A KMS key and key policy that Control Tower can use to encrypt CloudTrail and AWS Config data. |

Reference a submodule with a `//modules/<name>` source:

```hcl
module "client_ous" {
  source  = "flagscript/flagscript-organization/aws//modules/client-ous"
  version = "~> 0.9"

  application_id  = "acme-portal"
  client_id       = "acme-corp"
  workloads_ou_id = module.organization.workloads_ou_id
}
```

## Examples

- [default-organization](https://github.com/flagscript/terraform-aws-flagscript-organization/tree/main/examples/default-organization): the organization with all defaults.

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
| [aws_budgets_budget.global_cost_budget](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/budgets_budget) | resource |
| [aws_ce_cost_allocation_tag.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ce_cost_allocation_tag) | resource |
| [aws_costoptimizationhub_enrollment_status.flagscript_cost_optimization_hub](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/costoptimizationhub_enrollment_status) | resource |
| [aws_costoptimizationhub_preferences.flagscript_cost_optimization_hub_preferences](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/costoptimizationhub_preferences) | resource |
| [aws_iam_organizations_features.flagscript_org_iam_organizations_features](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_organizations_features) | resource |
| [aws_organizations_organization.flagscript_org](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/organizations_organization) | resource |
| [aws_organizations_organizational_unit.aft_ou](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/organizations_organizational_unit) | resource |
| [aws_organizations_organizational_unit.deployments_ou](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/organizations_organizational_unit) | resource |
| [aws_organizations_organizational_unit.deployments_prod_ou](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/organizations_organizational_unit) | resource |
| [aws_organizations_organizational_unit.deployments_test_ou](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/organizations_organizational_unit) | resource |
| [aws_organizations_organizational_unit.infrastructure_ou](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/organizations_organizational_unit) | resource |
| [aws_organizations_organizational_unit.infrastructure_prod_ou](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/organizations_organizational_unit) | resource |
| [aws_organizations_organizational_unit.infrastructure_test_ou](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/organizations_organizational_unit) | resource |
| [aws_organizations_organizational_unit.sandbox_ou](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/organizations_organizational_unit) | resource |
| [aws_organizations_organizational_unit.security_ou](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/organizations_organizational_unit) | resource |
| [aws_organizations_organizational_unit.security_tooling_ou](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/organizations_organizational_unit) | resource |
| [aws_organizations_organizational_unit.security_tooling_prod_ou](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/organizations_organizational_unit) | resource |
| [aws_organizations_organizational_unit.security_tooling_test_ou](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/organizations_organizational_unit) | resource |
| [aws_organizations_organizational_unit.suspended_ou](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/organizations_organizational_unit) | resource |
| [aws_organizations_organizational_unit.transitional_ou](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/organizations_organizational_unit) | resource |
| [aws_organizations_organizational_unit.workloads_ou](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/organizations_organizational_unit) | resource |
| [aws_organizations_organizational_unit.workloads_prod_ou](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/organizations_organizational_unit) | resource |
| [aws_organizations_organizational_unit.workloads_test_ou](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/organizations_organizational_unit) | resource |

## Inputs

| Name | Description | Type | Default | Required |
| ---- | ----------- | ---- | ------- | :------: |
| <a name="input_application_id"></a> [application\_id](#input\_application\_id) | Application Id | `string` | `"flagscript-organization"` | no |
| <a name="input_budgets_limit_unit"></a> [budgets\_limit\_unit](#input\_budgets\_limit\_unit) | Limit unit to use for budgets. | `string` | `"USD"` | no |
| <a name="input_control_tower_deployed"></a> [control\_tower\_deployed](#input\_control\_tower\_deployed) | Whether or not control tower will be deployed. | `bool` | `false` | no |
| <a name="input_global_cost_budget_limit"></a> [global\_cost\_budget\_limit](#input\_global\_cost\_budget\_limit) | Limit for the global cost budget. | `string` | `"30"` | no |
| <a name="input_global_cost_budget_notification_emails"></a> [global\_cost\_budget\_notification\_emails](#input\_global\_cost\_budget\_notification\_emails) | Email addresses to notifify the for global cost budget. | `list(string)` | `[]` | no |
| <a name="input_global_cost_budget_warning_threshold"></a> [global\_cost\_budget\_warning\_threshold](#input\_global\_cost\_budget\_warning\_threshold) | Threshold level to warn with a notification compared to limit. | `number` | `75` | no |
| <a name="input_org_owner"></a> [org\_owner](#input\_org\_owner) | Owner moniker for the flagscript organization. This is your owner id for your enthusiast organization. | `string` | `"flagscript"` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | Additional tags to merge with every created resource in this module. | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
| ---- | ----------- |
| <a name="output_aft_ou_arn"></a> [aft\_ou\_arn](#output\_aft\_ou\_arn) | Arn of the aft ou. |
| <a name="output_aft_ou_id"></a> [aft\_ou\_id](#output\_aft\_ou\_id) | Id of the aft ou. |
| <a name="output_deployments_ou_arn"></a> [deployments\_ou\_arn](#output\_deployments\_ou\_arn) | Arn of the deployments ou. |
| <a name="output_deployments_ou_id"></a> [deployments\_ou\_id](#output\_deployments\_ou\_id) | Id of the deployments ou. |
| <a name="output_infrastructure_ou_arn"></a> [infrastructure\_ou\_arn](#output\_infrastructure\_ou\_arn) | Arn of the infrastructure ou. |
| <a name="output_infrastructure_ou_id"></a> [infrastructure\_ou\_id](#output\_infrastructure\_ou\_id) | Id of the infrastructure ou. |
| <a name="output_org_arn"></a> [org\_arn](#output\_org\_arn) | Arn of the flagscript organization. |
| <a name="output_org_id"></a> [org\_id](#output\_org\_id) | Id of the flagscript organization. |
| <a name="output_prod_deployments_ou_arn"></a> [prod\_deployments\_ou\_arn](#output\_prod\_deployments\_ou\_arn) | Arn of the prod deployments ou. |
| <a name="output_prod_deployments_ou_id"></a> [prod\_deployments\_ou\_id](#output\_prod\_deployments\_ou\_id) | Id of the prod deployments ou. |
| <a name="output_prod_infrastructure_ou_arn"></a> [prod\_infrastructure\_ou\_arn](#output\_prod\_infrastructure\_ou\_arn) | Arn of the prod infrastructure ou. |
| <a name="output_prod_infrastructure_ou_id"></a> [prod\_infrastructure\_ou\_id](#output\_prod\_infrastructure\_ou\_id) | Id of the prod infrastructure ou. |
| <a name="output_prod_security_tooling_ou_arn"></a> [prod\_security\_tooling\_ou\_arn](#output\_prod\_security\_tooling\_ou\_arn) | Arn of the prod security tooling ou. |
| <a name="output_prod_security_tooling_ou_id"></a> [prod\_security\_tooling\_ou\_id](#output\_prod\_security\_tooling\_ou\_id) | Id of the prod security tooling ou. |
| <a name="output_root_id"></a> [root\_id](#output\_root\_id) | Id of the flagscript organization root. |
| <a name="output_security_ou_arn"></a> [security\_ou\_arn](#output\_security\_ou\_arn) | Arn of the security ou. |
| <a name="output_security_ou_id"></a> [security\_ou\_id](#output\_security\_ou\_id) | Id of the security ou. |
| <a name="output_security_tooling_ou_arn"></a> [security\_tooling\_ou\_arn](#output\_security\_tooling\_ou\_arn) | Arn of the security tooling ou. |
| <a name="output_security_tooling_ou_id"></a> [security\_tooling\_ou\_id](#output\_security\_tooling\_ou\_id) | Id of the security tooling ou. |
| <a name="output_suspended_ou_arn"></a> [suspended\_ou\_arn](#output\_suspended\_ou\_arn) | Arn of the suspended ou. |
| <a name="output_suspended_ou_id"></a> [suspended\_ou\_id](#output\_suspended\_ou\_id) | Id of the suspended ou. |
| <a name="output_test_deployments_ou_arn"></a> [test\_deployments\_ou\_arn](#output\_test\_deployments\_ou\_arn) | Arn of the test deployments ou. |
| <a name="output_test_deployments_ou_id"></a> [test\_deployments\_ou\_id](#output\_test\_deployments\_ou\_id) | Id of the test deployments ou. |
| <a name="output_test_infrastructure_ou_arn"></a> [test\_infrastructure\_ou\_arn](#output\_test\_infrastructure\_ou\_arn) | Arn of the test infrastructure ou. |
| <a name="output_test_infrastructure_ou_id"></a> [test\_infrastructure\_ou\_id](#output\_test\_infrastructure\_ou\_id) | Id of the test infrastructure ou. |
| <a name="output_test_security_tooling_ou_arn"></a> [test\_security\_tooling\_ou\_arn](#output\_test\_security\_tooling\_ou\_arn) | Arn of the test security tooling ou. |
| <a name="output_test_security_tooling_ou_id"></a> [test\_security\_tooling\_ou\_id](#output\_test\_security\_tooling\_ou\_id) | Id of the test security tooling ou. |
| <a name="output_workloads_ou_arn"></a> [workloads\_ou\_arn](#output\_workloads\_ou\_arn) | Arn of the workloads ou. |
| <a name="output_workloads_ou_id"></a> [workloads\_ou\_id](#output\_workloads\_ou\_id) | Id of the workloads ou. |
<!-- END_TF_DOCS -->
