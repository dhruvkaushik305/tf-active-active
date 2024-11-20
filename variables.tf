variable "regions" {
  type    = list(string)
  default = ["aws.mumbai", "aws.hyderabad"]
}

variable "vpc_cidr_blocks" {
  type = list(string)
}

variable "subnets_cidr" {
  type = list(list(map(object({
    cidr_block = string
  }))))
}

variable "availability_zones" {
  type = list(list(string))
}

variable "ami_ids" {
  type = list(list(string))
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
