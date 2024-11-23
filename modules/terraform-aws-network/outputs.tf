output "net_ids" {
  value = module.network_interfaces.net_ids
}

output "tg_subnet_id" {
  value = module.subnets.tg_subnet_id
}

output "allocation_id" {
  value = module.nat_gateway.allocation_id
}
