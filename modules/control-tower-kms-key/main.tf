# Control tower kms key
resource "aws_kms_key" "control_tower_kms_key" {
  region                             = var.control_tower_home_region
  bypass_policy_lockout_safety_check = false
  customer_master_key_spec           = "SYMMETRIC_DEFAULT"
  deletion_window_in_days            = var.deletion_window_in_days
  description                        = "Control tower kms key."
  enable_key_rotation                = var.enable_key_rotation
  is_enabled                         = var.enable_key
  key_usage                          = "ENCRYPT_DECRYPT"
  multi_region                       = false
  tags = merge(
    local.common_tags,
    {
      "Name" = local.key_name
    }
  )
}

data "aws_iam_policy_document" "control_tower_kms_key_policy_document" {

  statement {
    actions   = ["kms:*"]
    effect    = "Allow"
    resources = ["*"]
    sid       = "Enable IAM User Permissions"

    principals {
      type        = "AWS"
      identifiers = ["arn:aws:iam::${local.current_account_id}:root"]
    }
  }

  statement {
    actions = [
      "kms:Decrypt",
      "kms:GenerateDataKey"
    ]
    effect    = "Allow"
    resources = [aws_kms_key.control_tower_kms_key.arn]
    sid       = "Allow Config to use KMS for encryption"

    principals {
      type        = "Service"
      identifiers = ["config.amazonaws.com"]
    }
  }

  statement {
    actions = [
      "kms:Decrypt",
      "kms:GenerateDataKey*"
    ]
    effect    = "Allow"
    resources = [aws_kms_key.control_tower_kms_key.arn]
    sid       = "Allow CloudTrail to use KMS for encryption"

    condition {
      test = "StringEquals"
      values = [
        "arn:${local.current_partition}:cloudtrail:${var.control_tower_home_region}:${local.current_account_id}:trail/aws-controltower-BaselineCloudTrail"
      ]
      variable = "aws:SourceArn"
    }

    condition {
      test = "StringLike"
      values = [
        "arn:${local.current_partition}:cloudtrail:*:${local.current_account_id}:trail/*"
      ]
      variable = "kms:EncryptionContext:aws:cloudtrail:arn"
    }

    principals {
      type        = "Service"
      identifiers = ["cloudtrail.amazonaws.com"]
    }
  }

  # dynamic "statement" {
  #   for_each = length(var.additional_decrypt_arns) > 0 ? ["var.additional_decrypt_arns"] : []
  #   content {
  #     actions = [
  #       "kms:Decrypt",
  #       "kms:GenerateDataKey*"
  #     ]
  #     effect    = "Allow"
  #     resources = [aws_kms_key.control_tower_kms_key.arn]
  #     sid       = "Allow additional arns to decrypt with the kms key."

  #     principals {
  #       type        = "AWS"
  #       identifiers = var.additional_decrypt_arns
  #     }
  #   }
  # }

}

resource "aws_kms_key_policy" "control_tower_kms_key_policy" {
  region = var.control_tower_home_region
  key_id = aws_kms_key.control_tower_kms_key.id
  policy = data.aws_iam_policy_document.control_tower_kms_key_policy_document.json
}

resource "aws_kms_alias" "control_tower_kms_key_alias" {
  region        = var.control_tower_home_region
  name          = "alias/${local.key_name}"
  target_key_id = aws_kms_key.control_tower_kms_key.id
}
