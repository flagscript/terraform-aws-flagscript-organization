# Create the organization
locals {
  flagscript_default_aws_service_access_principals = [
    "account.amazonaws.com",
    # "artifact.amazonaws.com", # does not work
    "auditmanager.amazonaws.com",
    # "backup.amazonaws.com",
    "billing-cost-management.amazonaws.com",
    "cloudtrail.amazonaws.com",
    "compute-optimizer.amazonaws.com",
    # "config.amazonaws.com",
    # "controltower.amazonaws.com",
    "cost-optimization-hub.bcm.amazonaws.com",
    # "dashboard.eks.amazonaws.com",
    "detective.amazonaws.com",
    "devops-guru.amazonaws.com",
    "ec2.amazonaws.com",
    "fms.amazonaws.com",
    "guardduty.amazonaws.com",
    "health.amazonaws.com",
    "iam.amazonaws.com",
    "inspector2.amazonaws.com",
    "ipam.amazonaws.com",
    "license-manager.amazonaws.com",
    "license-manager.member-account.amazonaws.com",
    "license-manager-linux-subscriptions.amazonaws.com",
    "macie.amazonaws.com",
    "malware-protection.guardduty.amazonaws.com",
    "member.org.stacksets.cloudformation.amazonaws.com",
    # "notifications.amazon.com",
    "ram.amazonaws.com",
    "reachabilityanalyzer.networkinsights.amazonaws.com",
    "reporting.trustedadvisor.amazonaws.com",
    "resource-explorer-2.amazonaws.com",
    # "security-ir.amazonaws.com",
    "securityhub.amazonaws.com",
    # "securitylake.amazonaws.com",
    "servicecatalog.amazonaws.com",
    "servicequotas.amazonaws.com",
    "ssm.amazonaws.com",
    "sso.amazonaws.com",
    # "stacksets.cloudformation.amazonaws.com",
    "tagpolicies.tag.amazonaws.com",
    "wellarchitected.amazonaws.com"
  ]
  organization_policy_types = [
    "AISERVICES_OPT_OUT_POLICY",
    "BACKUP_POLICY",
    "CHATBOT_POLICY",
    "DECLARATIVE_POLICY_EC2",
    "RESOURCE_CONTROL_POLICY",
    "SECURITYHUB_POLICY",
    "SERVICE_CONTROL_POLICY",
    "TAG_POLICY"
  ]
}

resource "aws_organizations_organization" "flagscript_org" {
  aws_service_access_principals = local.flagscript_default_aws_service_access_principals
  enabled_policy_types          = local.organization_policy_types
  feature_set                   = "ALL"
}

locals {
  flagscript_root_id = aws_organizations_organization.flagscript_org.roots[0].id
}
