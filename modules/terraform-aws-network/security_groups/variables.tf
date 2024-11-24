variable "vpc_id" {
  type = string
}

variable "sg_names" {
  type = map(string)
}
variable "sg_rules_ingress" {
  type = map(list(object({
    from_port = number
    to_port   = number
    cidr_ipv4 = string
  })))
}
