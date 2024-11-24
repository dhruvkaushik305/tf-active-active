module "subnets" {
  source            = "./subnets"
  vpc_id            = var.vpc_id
  availability_zone = var.availability_zone
  subnets_cidr      = var.subnets_cidr
}

module "nat_gateway" {
  source    = "./nat_gateways"
  subnet_id = module.subnets.subnet_ids["public"]
}

resource "aws_route_table" "nat_gateway_rt" {
  vpc_id = var.vpc_id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = module.nat_gateway.nat_gateway_id
  }
}

resource "aws_route_table_association" "nat_private_rt" {
  for_each = { for k, v in module.subnets.subnet_ids : k => v if k == "web" || k == "app" }

  route_table_id = aws_route_table.nat_gateway_rt.id
  subnet_id      = each.value
}

resource "aws_route_table_association" "igw_public_rt" {
  subnet_id      = module.subnets.subnet_ids["public"]
  route_table_id = var.route_table_id
}
