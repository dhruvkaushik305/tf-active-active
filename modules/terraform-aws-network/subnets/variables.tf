variable "subnets" {
  type = map(object({
    cidr_block        = string
    availability_zone = string
  }))

  description = "Defines a map for the subnet configurations"
}

variable "vpc_id" {
  type = string
}
