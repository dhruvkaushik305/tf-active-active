output "aws_vpc_id" {
  value       = aws_vpc.vpc_main.id
  description = "The id of the VPC created in this region"
}
