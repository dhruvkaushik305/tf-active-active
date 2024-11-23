output "net_ids" {
  value = module.network_interfaces.net_ids
}

output "tg_subnet_id" {
  value = module.subnets.tg_subnet_id
}
