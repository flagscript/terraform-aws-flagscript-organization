resource "aws_organizations_account" "flagscript_account" {
  email = var.email
  # iam_user_access_to_billing = "DENY"
  name      = var.name
  parent_id = var.parent_id
  tags = merge(
    local.common_tags,
    {
      name = var.name
    }
  )
}

resource "aws_account_primary_contact" "account_primary_contact" {
  account_id         = aws_organizations_account.flagscript_account.id
  address_line_1     = var.contact_info.address
  city               = var.contact_info.city
  company_name       = var.contact_info.company
  country_code       = var.contact_info.country_code
  district_or_county = var.contact_info.county
  full_name          = var.contact_info.company
  phone_number       = var.contact_info.phone
  postal_code        = var.contact_info.postal_code
  state_or_region    = var.contact_info.state
  website_url        = var.contact_info.website
}

resource "aws_account_alternate_contact" "account_billing_contact" {
  account_id             = aws_organizations_account.flagscript_account.id
  alternate_contact_type = "BILLING"
  email_address          = var.contact_info.email
  name                   = var.contact_info.name
  phone_number           = var.contact_info.phone
  title                  = var.contact_info.title
}

resource "aws_account_alternate_contact" "account_operations_contact" {
  account_id             = aws_organizations_account.flagscript_account.id
  alternate_contact_type = "OPERATIONS"
  email_address          = var.contact_info.email
  name                   = var.contact_info.name
  phone_number           = var.contact_info.phone
  title                  = var.contact_info.title
}

resource "aws_account_alternate_contact" "account_security_contact" {
  account_id             = aws_organizations_account.flagscript_account.id
  alternate_contact_type = "SECURITY"
  email_address          = var.contact_info.email
  name                   = var.contact_info.name
  phone_number           = var.contact_info.phone
  title                  = var.contact_info.title
}
