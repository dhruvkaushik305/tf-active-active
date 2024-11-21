resource "aws_vpc" "vpc_main" {
  cidr_block = var.vpc_cidr_block
}

module "internet_gateway" {
  source = "../terraform-aws-network/internet_gateways"
  vpc_id = aws_vpc.vpc_main.id
}

module "networking" {
  source = "../terraform-aws-network"

  count = length(var.availability_zones)

  vpc_id            = aws_vpc.vpc_main.id
  subnets_cidr      = var.subnets_cidr[count.index]
  availability_zone = var.availability_zones[count.index]
  sg_rules_ingress  = var.sg_rules_ingress
  sg_rules_egress   = var.sg_rules_egress
}

module "instances" {
  source = "../terraform-aws-compute"

  count = length(var.availability_zones)

  availability_zone     = var.availability_zones[count.index]
  network_interface_ids = module.networking[count.index].net_ids
  ami_id                = var.ami_ids[count.index]
}

module "elb" {
  source             = "../terraform-aws-network/load_balancers"
  availability_zones = var.availability_zones
  elb_listeners      = var.elb_listeners
}
