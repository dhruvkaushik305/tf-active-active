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

# resource "aws_route53_zone" "main" {
#   name = "dhruvkaushik.xyz"
# }

# resource "aws_route53_record" "region1_route53_record" {
#   type           = "CNAME"
#   zone_id        = aws_route53_zone.main.id
#   name           = "dhruvkaushik.xyz"
#   ttl            = 300
#   records        = [module.region1.lb_dns_name]
#   set_identifier = "region1"
#   weighted_routing_policy {
#     weight = 50
#   }
# }

# resource "aws_route53_record" "region2_route53_record" {
#   type           = "CNAME"
#   zone_id        = aws_route53_zone.main.id
#   name           = "dhruvkaushik.xyz"
#   ttl            = 300
#   records        = [module.region2.lb_dns_name]
#   set_identifier = "region2"
#   weighted_routing_policy {
#     weight = 50
#   }
# }


resource "aws_route53_zone" "main" {
  name = "dhruvkaushik.xyz"
}

resource "aws_route53_record" "region1_route53_record" {
  type           = "A"
  zone_id        = aws_route53_zone.main.id
  name           = "dhruvkaushik.xyz"
  set_identifier = "region1"

  alias {
    name                   = module.region1.lb_dns_name
    zone_id                = module.region1.lb_zone_id # You'll need this from your load balancer
    evaluate_target_health = true
  }

  weighted_routing_policy {
    weight = 50
  }
}

resource "aws_route53_record" "region2_route53_record" {
  type           = "A"
  zone_id        = aws_route53_zone.main.id
  name           = "dhruvkaushik.xyz"
  set_identifier = "region2"

  alias {
    name                   = module.region2.lb_dns_name
    zone_id                = module.region2.lb_zone_id # You'll need this from your load balancer
    evaluate_target_health = true
  }

  weighted_routing_policy {
    weight = 50
  }
}
