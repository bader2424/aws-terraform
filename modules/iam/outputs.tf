output "user_name" {
  value = aws_iam_user.dev.name
}

output "group_name" {
  value = aws_iam_group.dev_group.name
}

output "policy_attachment_name" {
  value = aws_iam_policy_attachment.admin_attach.name
}
