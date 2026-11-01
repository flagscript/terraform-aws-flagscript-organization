# control-tower-kms-key

Creates a customer managed KMS key that AWS Control Tower can use to encrypt its CloudTrail logs and AWS Config data.

## What it creates

- **A symmetric KMS key** in `control_tower_home_region`, with the alias `alias/control-tower-kms-key`.
- **A key policy** that allows:
  - the current account's IAM principals full use of the key
  - AWS Config to `kms:Decrypt` and `kms:GenerateDataKey`
  - CloudTrail to `kms:Decrypt` and `kms:GenerateDataKey*`, but only for the Control Tower `aws-controltower-BaselineCloudTrail` trail in the home region

## Usage

Apply in the **management account** before you set up or update your Control Tower landing zone, then choose this key in the landing zone's KMS encryption settings.

```hcl
module "control_tower_kms_key" {
  source  = "flagscript/flagscript-organization/aws//modules/control-tower-kms-key"
  version = "~> 0.9"

  control_tower_home_region = "us-west-2"
  enable_key_rotation       = true
}
```

With the root module, also set `control_tower_deployed = true` so the organization trusts AWS Config and Control Tower.

## Notes

- This module has no outputs. Look up the key in the AWS console or by its alias, `alias/control-tower-kms-key`.
- Key rotation is off by default (`enable_key_rotation = false`). Consider turning it on.
- When destroyed, the key is scheduled for deletion after `deletion_window_in_days` (30 days by default). Control Tower cannot decrypt its logs once the key is deleted.

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
| [aws_kms_alias.control_tower_kms_key_alias](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/kms_alias) | resource |
| [aws_kms_key.control_tower_kms_key](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/kms_key) | resource |
| [aws_kms_key_policy.control_tower_kms_key_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/kms_key_policy) | resource |
| [aws_caller_identity.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/caller_identity) | data source |
| [aws_iam_policy_document.control_tower_kms_key_policy_document](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_partition.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/partition) | data source |

## Inputs

| Name | Description | Type | Default | Required |
| ---- | ----------- | ---- | ------- | :------: |
| <a name="input_application_id"></a> [application\_id](#input\_application\_id) | Application Id | `string` | `"control-tower"` | no |
| <a name="input_control_tower_home_region"></a> [control\_tower\_home\_region](#input\_control\_tower\_home\_region) | Home region of control tower. | `string` | `"us-west-2"` | no |
| <a name="input_deletion_window_in_days"></a> [deletion\_window\_in\_days](#input\_deletion\_window\_in\_days) | The waiting period, specified in number of days. | `number` | `30` | no |
| <a name="input_enable_key"></a> [enable\_key](#input\_enable\_key) | Specifies whether the key is enabled. | `bool` | `true` | no |
| <a name="input_enable_key_rotation"></a> [enable\_key\_rotation](#input\_enable\_key\_rotation) | Specifies whether key rotation is enabled. | `bool` | `false` | no |
| <a name="input_org_owner"></a> [org\_owner](#input\_org\_owner) | Owner moniker for the flagscript organization. This is your owner id for your enthusiast organization. | `string` | `"flagscript"` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | Additional tags to merge with every created resource in this module. | `map(string)` | `{}` | no |

## Outputs

No outputs.
<!-- END_TF_DOCS -->
