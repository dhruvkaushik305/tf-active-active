resource "aws_subnet" "subnets" {
  for_each = var.subnets_cidr

  map_public_ip_on_launch = true
  vpc_id                  = var.vpc_id
  cidr_block              = each.value.cidr_block
  availability_zone       = var.availability_zone

  tags = {
    name = "${each.key}-subnet"
  }
}

