variable "vpc_id" {
  type        = string
  description = "The vpc id in which the internet gateway is supposed to be"
}

variable "subnets" {
  type = map(object({
    cidr_block        = string
    availability_zone = string
    tier              = string
    tags              = map(string)
  }))

  description = "Defines a map for the subnet configurations"
}

variable "public_sg_rule_ingress" {
  type = list(object({
    from_port = number
    to_port   = number
    cidr_ipv4 = string
  }))
}

variable "public_sg_rule_egress" {
  type = list(object({
    from_port = number
    to_port   = number
    cidr_ipv4 = string
  }))
}

variable "private_web_sg_rule_ingress" {
  type = list(object({
    from_port = number
    to_port   = number
    cidr_ipv4 = string
  }))
}

variable "private_web_sg_rule_egress" {
  type = list(object({
    from_port = number
    to_port   = number
    cidr_ipv4 = string
  }))
}

variable "private_app_sg_rule_ingress" {
  type = list(object({
    from_port = number
    to_port   = number
    cidr_ipv4 = string
  }))
}

variable "private_app_sg_rule_egress" {
  type = list(object({
    from_port = number
    to_port   = number
    cidr_ipv4 = string
  }))
}

variable "public_instance_id" {
  type = string
}
