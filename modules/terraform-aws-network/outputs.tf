output "tg_subnet_id" {
  value = module.subnets.tg_subnet_id
}

output "allocation_id" {
  value = module.nat_gateway.allocation_id
}

output "subnet_ids" {
  value = module.subnets.subnet_ids
}
