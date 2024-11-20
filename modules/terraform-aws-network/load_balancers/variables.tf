variable "vpc_name" {
  type = string
}

variable "azs" {
  type = list(string)
}

variable "elb_listeners" {
  type = list(object({
    instance_port     = number
    instance_protocol = string
    lb_port           = number
    lb_protocol       = string
  }))
}
