output "nat_gateway_id" {
  value = aws_nat_gateway.nat_gw.id
}

output "allocation_id" {
  value = aws_eip.eip.id
}
