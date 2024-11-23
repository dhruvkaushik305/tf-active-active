output "sg_ids" {
  value = { for key, value in aws_security_group.sg : key => value.id }
}
output "tg_security_group_id" {
  value = aws_security_group.sg["web"].id
}
