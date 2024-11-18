resource "aws_vpc" "region1_vpc" {
  provider = var.aws_provider == "aws.mumbai" ? aws.mumbai : aws.hyderabad

  cidr_block = var.cidr_block
}

//assemble the rest of the vpc
