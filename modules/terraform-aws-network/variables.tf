variable "vpc_id" {
  type        = string
  description = "Defines the vpc id where in the subnets are to be created"
}

variable "igw_id" {
  type = string
}

variable "subnets_cidr" {
  type = map(object({
    cidr_block = string
  }))

  description = "Defines a map for the subnet configurations"
}

variable "availability_zone" {
  type = string
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
