variable "subnet_sg_ids" {
  type = map(object({
    subnet_id          = string
    security_group_ids = list(string)
  }))
}
