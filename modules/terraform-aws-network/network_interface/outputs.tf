output "net_ids" {
  value = { for key, value in aws_network_interface.net_interface : key => value.id }
}
