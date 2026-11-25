# Account alias
resource "aws_iam_account_alias" "alias" {
  account_alias = var.name
}

# Account sts token version preference
resource "aws_iam_security_token_service_preferences" "token_version_preference" {
  global_endpoint_token_version = var.token_version_preference
}

# Account password policy
resource "aws_iam_account_password_policy" "password_policy" {
  allow_users_to_change_password = true
  hard_expiry                    = false
  max_password_age               = 90
  minimum_password_length        = 14
  password_reuse_prevention      = 24
  require_lowercase_characters   = true
  require_numbers                = true
  require_symbols                = true
  require_uppercase_characters   = true
}
