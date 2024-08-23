resource "aws_iam_openid_connect_provider" "github_openid_provider" {
  count = var.install_github_openid_profider ? 1 : 0
  url   = "https://token.actions.githubusercontent.com"
  client_id_list = [
    "sts.amazonaws.com",
  ]
  thumbprint_list = ["D89E3BD43D5D909B47A18977AA9D5CE36CEE184C"]
  tags = merge(
    local.common_tags,
    {
      Name = var.openid_provider_name
      "oidc-provider-type" : "github"
    }
  )
}
