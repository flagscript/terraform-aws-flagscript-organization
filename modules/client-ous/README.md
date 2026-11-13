# client-ous

Creates a client's organizational units under the Flagscript `Workloads` OU, one for test and one for production:

```text
Workloads
├── Test
│   └── <ClientName>
└── Prod
    └── <ClientName>
```

The OU name comes from `client_id`: it is split on hyphens, each word is title-cased, and the words are joined. For example, `acme-corp` becomes `AcmeCorp`.

## Prerequisites

- Run in the organization's **management account**.
- `workloads_ou_id` must point to an OU that has child OUs named exactly `Test` and `Prod`. The root module's `Workloads` OU meets this requirement.

## Usage

```hcl
module "acme_ous" {
  source  = "flagscript/flagscript-organization/aws//modules/client-ous"
  version = "~> 0.9"

  application_id  = "acme-portal"
  client_id       = "acme-corp"
  workloads_ou_id = module.organization.workloads_ou_id
}

# Place accounts in the new OUs with the account submodule
# using module.acme_ous.test_ou_id and module.acme_ous.prod_ou_id.
```

The OUs are tagged with `client_id` as their cost allocation owner and `org_owner` as their account, data and operations owner.

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
| ---- | ------- |
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.16 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 6.72 |

## Providers

| Name | Version |
| ---- | ------- |
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 6.72 |

## Modules

No modules.

## Resources

| Name | Type |
| ---- | ---- |
| [aws_organizations_organizational_unit.workload_prod_ou](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/organizations_organizational_unit) | resource |
| [aws_organizations_organizational_unit.workload_test_ou](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/organizations_organizational_unit) | resource |
| [aws_organizations_organizational_units.workloads_ou](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/organizations_organizational_units) | data source |

## Inputs

| Name | Description | Type | Default | Required |
| ---- | ----------- | ---- | ------- | :------: |
| <a name="input_application_id"></a> [application\_id](#input\_application\_id) | Application Id | `string` | n/a | yes |
| <a name="input_client_id"></a> [client\_id](#input\_client\_id) | The id for the client. | `string` | n/a | yes |
| <a name="input_workloads_ou_id"></a> [workloads\_ou\_id](#input\_workloads\_ou\_id) | ID of the flagscript workloads ou. | `string` | n/a | yes |
| <a name="input_org_owner"></a> [org\_owner](#input\_org\_owner) | Owner moniker for the flagscript organization. This is your owner id for your enthusiast organization. | `string` | `"flagscript"` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | Additional tags to merge with every created resource in this module. | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
| ---- | ----------- |
| <a name="output_prod_ou_arn"></a> [prod\_ou\_arn](#output\_prod\_ou\_arn) | ARN of the production client workload production organizational unit. |
| <a name="output_prod_ou_id"></a> [prod\_ou\_id](#output\_prod\_ou\_id) | Identifier of the production client workload production organizational unit. |
| <a name="output_test_ou_arn"></a> [test\_ou\_arn](#output\_test\_ou\_arn) | ARN of the test client workload test organizational unit. |
| <a name="output_test_ou_id"></a> [test\_ou\_id](#output\_test\_ou\_id) | Identifier of the test client workload test organizational unit. |
<!-- END_TF_DOCS -->
