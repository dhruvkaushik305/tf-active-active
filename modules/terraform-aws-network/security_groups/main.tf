resource "aws_security_group" "sg" {
  for_each = var.sg_names

  name   = "${each.value}-sg"
  vpc_id = var.vpc_id
}

resource "aws_vpc_security_group_ingress_rule" "sg_rules_ingress" {
  for_each = {
    for pair in flatten([
      for sg_key, rule_list in var.sg_rules_ingress : [
        for ingress_rule in rule_list : {
          sg_key = sg_key
          rule   = ingress_rule
        }
      ]
      ]) : "${pair.sg_key}-${pair.rule.from_port}-${pair.rule.to_port}-${pair.rule.cidr_ipv4}" => {
      sg_key = pair.sg_key
      rule   = pair.rule
    }
  }

  security_group_id = aws_security_group.sg[each.value.sg_key].id
  ip_protocol       = "tcp"
  from_port         = each.value.rule.from_port
  to_port           = each.value.rule.to_port
  cidr_ipv4         = each.value.rule.cidr_ipv4
}

resource "aws_vpc_security_group_egress_rule" "sg_rules_egress" {
  for_each = var.sg_names

  security_group_id = aws_security_group.sg[each.key].id
  ip_protocol       = -1
  cidr_ipv4         = "0.0.0.0/0"
}

