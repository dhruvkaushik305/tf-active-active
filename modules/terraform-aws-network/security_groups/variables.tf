variable "vpc_id" {
  type = string
}

variable "subnet_ids" {
  type = map(string)
}

variable "sg_rules_ingress" {
  type = map(list(object({
    from_port = number
    to_port   = number
    cidr_ipv4 = string
  })))
}

variable "sg_rules_egress" {
  type = map(list(object({
    from_port = number
    to_port   = number
    cidr_ipv4 = string
  })))
}
