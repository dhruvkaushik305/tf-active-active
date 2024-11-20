variable "subnets_cidr" {
  type = map(object({
    cidr_block = string
  }))

  description = "Defines a map for the subnet configurations"
}

variable "vpc_id" {
  type = string
}

variable "availability_zone" {
  type = string
}
