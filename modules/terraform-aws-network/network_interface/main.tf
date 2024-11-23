resource "aws_network_interface" "net_interface" {
  for_each = var.subnet_ids

  subnet_id       = each.value
  security_groups = [var.sg_ids[each.key]]

  tags = {
    name = "${each.key}-network-interface"
  }
}
