resource "aws_network_interface" "net_interface" {
  for_each = var.subnet_sg_ids

  subnet_id       = each.value.subnet_id
  security_groups = each.value.security_group_ids

  tags = {
    name = "${each.key}-network-interface"
  }
}
