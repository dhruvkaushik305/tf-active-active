output "tg_instance_id" {
  value = aws_instance.instances["web"].id
}
