module "region1" {
  source = "./modules/terraform-aws-region"

  sg_names           = var.sg_names
  vpc_cidr_block     = var.region1_cidr
  sg_rules_ingress   = var.region1_sg_rules_ingress
  sg_rules_egress    = var.region1_sg_rules_egress
  subnets_cidr       = var.region1_subnets_cidr
  availability_zones = var.region1_availability_zones
  ami_id             = var.region1_ami_id
  key_name           = var.key_names[0]
}

module "region2" {
  source = "./modules/terraform-aws-region"

  sg_names           = var.sg_names
  providers          = { aws = aws.hyderabad }
  vpc_cidr_block     = var.region2_cidr
  sg_rules_ingress   = var.region2_sg_rules_ingress
  sg_rules_egress    = var.region2_sg_rules_egress
  subnets_cidr       = var.region2_subnets_cidr
  availability_zones = var.region2_availability_zones
  ami_id             = var.region2_ami_id
  key_name           = var.key_names[1]
}

resource "aws_route53_zone" "main" {
  name = "dhruvkaushik.xyz"
}

resource "aws_route53_record" "route53" {
  zone_id        = aws_route53_zone.main.id
  name           = "devops.dhruvkaushik.xyz"
  type           = "CNAME"
  records        = [module.region1.lb_dns_name, module.region2.lb_dns_name]
  set_identifier = "region1"
}
