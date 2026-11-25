resource "aws_iam_openid_connect_provider" "github" {
  count = var.install_github_openid_provider ? 1 : 0
  client_id_list = [
    "sts.amazonaws.com",
  ]
  url = "https://token.actions.githubusercontent.com"
  tags = merge(
    local.common_tags,
    {
      "Name" = "token.actions.githubusercontent.com"
    }
  )
}
