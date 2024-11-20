output "subnet_ids" {
  value = { for key, value in aws_subnet.subnets : key => value.id }
}
