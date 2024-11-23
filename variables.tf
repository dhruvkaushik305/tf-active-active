variable "region1_cidr" {
  type = string
}

variable "region2_cidr" {
  type = string
}

variable "sg_names" {
  type = map(string)
}

variable "region1_subnets_cidr" {
  type = list(map(object({
    cidr_block = string
  })))
}

variable "region2_subnets_cidr" {
  type = list(map(object({
    cidr_block = string
  })))
}

variable "region1_availability_zones" {
  type = list(string)
}

variable "region2_availability_zones" {
  type = list(string)
}

variable "region1_ami_id" {
  type = string
}

variable "region2_ami_id" {
  type = string
}
variable "region1_sg_rules_ingress" {
  type = map(list(object({
    from_port = number
    to_port   = number
    cidr_ipv4 = string
  })))
}

variable "region1_sg_rules_egress" {
  type = map(list(object({
    from_port = number
    to_port   = number
    cidr_ipv4 = string
  })))
}

variable "region2_sg_rules_ingress" {
  type = map(list(object({
    from_port = number
    to_port   = number
    cidr_ipv4 = string
  })))
}


variable "region2_sg_rules_egress" {
  type = map(list(object({
    from_port = number
    to_port   = number
    cidr_ipv4 = string
  })))
}

variable "key_names" {
  type = list(string)
}
