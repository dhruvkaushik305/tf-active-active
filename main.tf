module "region" {
  source             = "./modules/terraform-aws-region"
  aws_provider       = var.regions[count.index]
  vpc_cidr_block     = var.vpc_cidr_blocks[count.index]
  sg_rules_ingress   = var.sg_rules_ingress
  sg_rules_egress    = var.sg_rules_egress
  subnets_cidr       = var.subnets_cidr[count.index]
  elb_listeners      = var.elb_listeners
  availability_zones = var.availability_zones[count.index]
  count              = length(var.regions)
}
