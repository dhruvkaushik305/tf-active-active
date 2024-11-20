variable "aws_provider" {
  type        = string
  default     = "aws.mumbai"
  description = "Defines the aws provider alias to use"
  validation {
    condition     = var.aws_provider == "aws.mumbai" || var.aws_provider == "aws.hyderabad"
    error_message = "The aws_provider can either be mumbai or hyderabad"
  }
}

variable "vpc_cidr_block" {
  type        = string
  description = "The CIDR range for the VPC"
}

variable "subnets_cidr" {
  type = map(object({
    cidr_block = string
  }))

  description = "Defines a map for the subnet configurations"
}

variable "availability_zones" {
  type    = list(string)
  default = ["ap-south-1", "ap-south-2"]
}

variable "ami_ids" {
  type    = list(string)
  default = ["", ""]
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
