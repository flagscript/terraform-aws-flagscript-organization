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
