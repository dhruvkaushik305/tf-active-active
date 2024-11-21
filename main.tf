module "region1" {
  source = "./modules/terraform-aws-region"

  vpc_cidr_block     = var.region1_cidr
  sg_rules_ingress   = var.sg_rules_ingress
  sg_rules_egress    = var.sg_rules_egress
  subnets_cidr       = var.region1_subnets_cidr
  elb_listeners      = var.elb_listeners
  availability_zones = var.region1_availability_zones
  ami_ids            = var.region1_ami_ids
}


module "region2" {
  source = "./modules/terraform-aws-region"

  vpc_cidr_block     = var.region2_cidr
  sg_rules_ingress   = var.sg_rules_ingress
  sg_rules_egress    = var.sg_rules_egress
  subnets_cidr       = var.region2_subnets_cidr
  elb_listeners      = var.elb_listeners
  availability_zones = var.region2_availability_zones
  ami_ids            = var.region2_ami_ids
}
