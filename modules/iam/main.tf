resource "aws_iam_user" "dev" {
  name = "${var.environment}-dev"
}

resource "aws_iam_group" "dev_group" {
  name = "${var.environment}-dev-group"
}

resource "aws_iam_user_group_membership" "dev_membership" {
  user   = aws_iam_user.dev.name
  groups = [aws_iam_group.dev_group.name]
}

resource "aws_iam_policy_attachment" "admin_attach" {
  name       = "${var.environment}-admin-policy"
  groups     = [aws_iam_group.dev_group.name]
  policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
}
