variable "vpc_cidr_block" {
  type        = string
  description = "The CIDR range for the VPC"
}

variable "subnets_cidr" {
  type = list(map(object({
    cidr_block = string
  })))

  description = "Defines a map for the subnet configurations"
}

variable "availability_zones" {
  type = list(string)
}

variable "ami_id" {
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

variable "sg_names" {
  type = map(string)
}
