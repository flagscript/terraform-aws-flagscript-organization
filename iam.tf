resource "aws_iam_organizations_features" "flagscript_org_iam_organizations_features" {
  depends_on = [aws_organizations_organization.flagscript_org]
  enabled_features = [
    "RootCredentialsManagement",
    "RootSessions"
  ]
}
