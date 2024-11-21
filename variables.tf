variable "region1_cidr" {
  type = string
}

variable "region2_cidr" {
  type = string
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

variable "region1_ami_ids" {
  type = list(string)
}

variable "region2_ami_ids" {
  type = list(string)
}
variable "sg_rules_ingress" {
  type = map(object({
    ingress = list(object({
      from_port = number
      to_port   = number
      cidr_ipv4 = string
    }))
    egress = list(object({
      from_port = number
      to_port   = number
      cidr_ipv4 = string
    }))
  }))
}

variable "sg_rules_egress" {
  type = map(object({
    ingress = list(object({
      from_port = number
      to_port   = number
      cidr_ipv4 = string
    }))
    egress = list(object({
      from_port = number
      to_port   = number
      cidr_ipv4 = string
    }))
  }))
}

variable "elb_listeners" {
  type = list(object({
    instance_port     = number
    instance_protocol = string
    lb_port           = number
    lb_protocol       = string
  }))
}
