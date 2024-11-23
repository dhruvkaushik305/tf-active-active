terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.76.0"
    }
  }
}

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

  igw_id            = module.internet_gateway.gateway_id
  vpc_id            = aws_vpc.vpc_main.id
  subnets_cidr      = var.subnets_cidr[count.index]
  availability_zone = var.availability_zones[count.index]
  sg_rules_ingress  = var.sg_rules_ingress[count.index]
  sg_rules_egress   = var.sg_rules_egress[count.index]
}

resource "aws_route_table" "region_rt" {
  vpc_id = aws_vpc.vpc_main.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = module.internet_gateway.gateway_id
  }
}
module "instances" {
  source = "../terraform-aws-compute"

  count = length(var.availability_zones)

  availability_zone     = var.availability_zones[count.index]
  network_interface_ids = module.networking[count.index].net_ids
  ami_id                = var.ami_id
}

module "lb" {
  source = "../terraform-aws-network/load_balancers"

  vpc_id              = aws_vpc.vpc_main.id
  instances_id        = [for ec2 in module.instances : ec2.tg_instance_id]
  subnet_ids          = [for network in module.networking : network.tg_subnet_id]
  security_groups_ids = [for network in module.networking : network.tg_security_group_id]
}
