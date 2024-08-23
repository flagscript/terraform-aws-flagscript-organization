resource "aws_iam_openid_connect_provider" "github_openid_provider" {
  count = var.install_github_openid_profider ? 1 : 0
  url   = "https://token.actions.githubusercontent.com"
  client_id_list = [
    "sts.amazonaws.com",
  ]
  thumbprint_list = ["d89e3bd43d5d909b47a18977aa9d5ce36cee184c"]
  tags = merge(
    local.common_tags,
    {
      Name = var.openid_provider_name
      "oidc-provider-type" : "github"
    }
  )
}
