output "subnet_ids" {
  value = { for key, value in aws_subnet.subnets : key => value.id }
}

output "tg_subnet_id" {
  value = aws_subnet.subnets["web"].id
}
