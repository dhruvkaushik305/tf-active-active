output "net_ids" {
  value = module.network_interfaces.net_ids
}

output "tg_security_group_id" {
  value = module.security_groups.tg_security_group_id
}

output "tg_subnet_id" {
  value = module.subnets.tg_subnet_id
}
