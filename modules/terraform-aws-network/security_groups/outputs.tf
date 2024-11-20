output "subnet_sg_ids" {
  value = { for key, value in aws_security_group.sg : key => {
    subnet_id          = var.subnet_ids[key]
    security_group_ids = [value.id]
  } }
}
