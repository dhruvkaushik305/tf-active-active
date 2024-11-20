resource "aws_eip" "eip" {
  domain = "vpc"
}

resource "aws_nat_gateway" "nat_gw" {
  subnet_id     = var.subnet_id
  allocation_id = aws_eip.eip.id
}
