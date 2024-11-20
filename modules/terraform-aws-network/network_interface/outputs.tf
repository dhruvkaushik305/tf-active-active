output "net_ids" {
  value = { for key, value in awsaws_network_interface.net_interface : key => value.id }
}
