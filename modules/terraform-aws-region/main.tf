resource "aws_vpc" "vpc_main" {
  provider = var.aws_provider == "aws.mumbai" ? aws.mumbai : aws.hyderabad

  cidr_block = var.cidr_block
}

module "internet_gateway" {
  source = "../terraform-aws-network/internet_gateways"
  vpc_id = aws_vpc.vpc_main.id
}

module "networking" {
  source = "../terraform-aws-network"

  count = length(var.availability_zones)

  vpc_id            = aws_vpc.vpc_main.id
  sg_rules_ingress  = var.sg_rules_ingress
  sg_rules_egress   = var.sg_rules_egress
  subnets_cidr      = var.subnets_cidr[count.index]
  availability_zone = var.availability_zones[count.index]
}

module "instances" {
  source = "../terraform-aws-compute"

  count                 = length(var.availability_zones)
  az                    = var.availability_zones[count.index]
  network_interface_ids = module.networking.net_ids
  ami_id                = var.ami_ids[count.index]
}

module "elb" {
  source        = "../terraform-aws-network/load_balancers"
  azs           = var.availability_zones
  elb_listeners = var.elb_listeners
}
