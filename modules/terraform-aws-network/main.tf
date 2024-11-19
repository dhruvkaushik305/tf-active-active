resource "aws_internet_gateway" "igw" {
  vpc_id = var.vpc_id
}

resource "aws_subnet" "subnets" {
  for_each = var.subnets

  vpc_id            = var.vpc_id
  cidr_block        = each.value.cidr_block
  availability_zone = each.value.availability_zone
}

resource "aws_security_group" "sg" {
  for_each = toset(var.subnets.keys)

  name   = "${each.key}-sg"
  vpc_id = var.vpc_id
}

resource "aws_vpc_security_group_ingress_rule" "public_ingress_rules" {
  for_each = {
    for idx, rule in var.public_sg_rule_ingress : "${rule.from_port}-${rule.to_port}-${rule.cidr_ipv4}" => rule
  }
  security_group_id = aws_security_group.sg["public"].id
  ip_protocol       = "tcp"
  from_port         = each.value.from_port
  to_port           = each.value.to_port
  cidr_ipv4         = each.value.cidr_ipv4
}

resource "aws_vpc_security_group_egress_rule" "public_egress_rules" {
  for_each = {
    for idx, rule in var.public_sg_rule_egress : "${rule.from_port}-${rule.to_port}-${rule.cidr_ipv4}" => rule
  }
  security_group_id = aws_security_group.sg["public"].id
  ip_protocol       = "tcp"
  from_port         = each.value.from_port
  to_port           = each.value.to_port
  cidr_ipv4         = each.value.cidr_ipv4
}

resource "aws_vpc_security_group_ingress_rule" "private_web_ingress_rules" {
  for_each = {
    for idx, rule in var.private_web_sg_rule_ingress : "${rule.from_port}-${rule.to_port}-${rule.cidr_ipv4}" => rule
  }
  security_group_id = aws_security_group.sg["web"].id
  ip_protocol       = "tcp"
  from_port         = each.value.from_port
  to_port           = each.value.to_port
  cidr_ipv4         = each.value.cidr_ipv4
}

resource "aws_vpc_security_group_egress_rule" "private_web_egress_rules" {
  for_each = {
    for idx, rule in var.private_web_sg_rule_egress : "${rule.from_port}-${rule.to_port}-${rule.cidr_ipv4}" => rule
  }
  security_group_id = aws_security_group.sg["web"].id
  ip_protocol       = "tcp"
  from_port         = each.value.from_port
  to_port           = each.value.to_port
  cidr_ipv4         = each.value.cidr_ipv4
}

resource "aws_vpc_security_group_ingress_rule" "private_app_ingress_rules" {
  for_each = {
    for idx, rule in var.private_app_sg_rule_ingress : "${rule.from_port}-${rule.to_port}-${rule.cidr_ipv4}" => rule
  }
  security_group_id = aws_security_group.sg["app"].id
  ip_protocol       = "tcp"
  from_port         = each.value.from_port
  to_port           = each.value.to_port
  cidr_ipv4         = each.value.cidr_ipv4
}

resource "aws_vpc_security_group_egress_rule" "private_app_egress_rules" {
  for_each = {
    for idx, rule in var.private_app_sg_rule_egress : "${rule.from_port}-${rule.to_port}-${rule.cidr_ipv4}" => rule
  }
  security_group_id = aws_security_group.sg["app"].id
  ip_protocol       = "tcp"
  from_port         = each.value.from_port
  to_port           = each.value.to_port
  cidr_ipv4         = each.value.cidr_ipv4
}

resource "aws_network_interface" "public_net" {
  subnet_id       = aws_subnet.subnets["public"]
  security_groups = [aws_security_group.sg["public"].id]
}

resource "aws_network_interface" "web_net" {
  subnet_id       = aws_subnet.subnets["web"]
  security_groups = [aws_security_group.sg["web"].id]
}

resource "aws_network_interface" "app_net" {
  subnet_id       = aws_subnet.subnets["app"]
  security_groups = [aws_security_group.sg["app"].id]
}

resource "aws_eip" "eip" {
  instance = var.public_instance_id
}

resource "aws_nat_gateway" "nat_gw" {
  subnet_id     = aws_subnet.subnets["public"].id
  allocation_id = aws_eip.eip.id

  depends_on = [aws_internet_gateway.igw]
}
