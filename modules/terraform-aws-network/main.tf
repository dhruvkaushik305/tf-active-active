module "subnets" {
  source            = "./subnets"
  vpc_id            = var.vpc_id
  availability_zone = var.availability_zone
  subnets_cidr      = var.subnets_cidr
}

module "security_groups" {
  source           = "./security_groups"
  vpc_id           = var.vpc_id
  subnet_ids       = module.subnets.subnet_ids
  sg_rules_ingress = var.sg_rules_ingress
  sg_rules_egress  = var.sg_rules_egress
}

module "network_interfaces" {
  source        = "./network_interface"
  subnet_sg_ids = module.security_groups.subnet_sg_ids
}

module "nat_gateway" {
  source    = "./nat_gateways"
  subnet_id = module.subnets.subnet_ids["public"]
}

resource "aws_route_table" "subnet_rt" {
  vpc_id = var.vpc_id

  route {
    cidr_block           = var.subnets_cidr["public"].cidr_block
    network_interface_id = module.network_interfaces.net_ids["web"]
  }
  route {
    cidr_block           = var.subnets_cidr["public"].cidr_block
    network_interface_id = module.network_interfaces.net_ids["app"]
  }
  route {
    gateway_id     = var.igw_id
    nat_gateway_id = module.nat_gateway.nat_gateway_id
  }
}
