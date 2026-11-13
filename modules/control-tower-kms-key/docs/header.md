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
