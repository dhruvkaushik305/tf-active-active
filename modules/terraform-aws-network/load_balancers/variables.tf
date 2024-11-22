variable "security_groups_ids" {
  type = list(string)
}

variable "subnet_ids" {
  type = list(string)
}
variable "vpc_id" {
  type = string
}

variable "instances_id" {
  type = list(string)
}
