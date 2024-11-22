output "aws_vpc_id" {
  value       = aws_vpc.vpc_main.id
  description = "The id of the VPC created in this region"
}

output "lb_dns_name" {
  value = module.lb.lb_dns_name
}
