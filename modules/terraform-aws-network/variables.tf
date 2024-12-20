variable "vpc_id" {
  type        = string
  description = "Defines the vpc id where in the subnets are to be created"
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

variable "sg_ids" {
  type = map(string)
}

variable "route_table_id" {
  type = string
}
