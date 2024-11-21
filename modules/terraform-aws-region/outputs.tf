output "aws_vpc_id" {
  value       = aws_vpc.vpc_main.id
  description = "The id of the VPC created in this region"
}

output "elb_dns_name" {
  value = module.elb.elb_dns_name
}
