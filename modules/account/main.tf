# Account
resource "aws_organizations_account" "flagscript_account" {
  close_on_deletion          = var.close_on_deletion
  email                      = var.email
  iam_user_access_to_billing = var.iam_user_access_to_billing
  name                       = var.name
  parent_id                  = var.parent_id
  tags = merge(
    local.common_tags,
    {
      "Name" = var.name
    }
  )
}

# Account Contact Information
resource "aws_account_primary_contact" "account_primary_contact" {
  account_id         = aws_organizations_account.flagscript_account.id
  address_line_1     = var.primary_contact_info.address
  city               = var.primary_contact_info.city
  company_name       = var.primary_contact_info.company
  country_code       = var.primary_contact_info.country_code
  district_or_county = var.primary_contact_info.county
  full_name          = var.primary_contact_info.company
  phone_number       = var.primary_contact_info.phone
  postal_code        = var.primary_contact_info.postal_code
  state_or_region    = var.primary_contact_info.state
  website_url        = var.primary_contact_info.website
}

resource "aws_account_alternate_contact" "account_billing_contact" {
  account_id             = aws_organizations_account.flagscript_account.id
  alternate_contact_type = "BILLING"
  email_address          = local.billing_contact_info.email
  name                   = local.billing_contact_info.name
  phone_number           = local.billing_contact_info.phone
  title                  = local.billing_contact_info.title
}

resource "aws_account_alternate_contact" "account_operations_contact" {
  account_id             = aws_organizations_account.flagscript_account.id
  alternate_contact_type = "OPERATIONS"
  email_address          = local.operations_contact_info.email
  name                   = local.operations_contact_info.name
  phone_number           = local.operations_contact_info.phone
  title                  = local.operations_contact_info.title
}

resource "aws_account_alternate_contact" "account_security_contact" {
  account_id             = aws_organizations_account.flagscript_account.id
  alternate_contact_type = "SECURITY"
  email_address          = local.security_contact_info.email
  name                   = local.security_contact_info.name
  phone_number           = local.security_contact_info.phone
  title                  = local.security_contact_info.title
}
