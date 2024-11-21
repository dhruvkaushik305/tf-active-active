variable "availability_zone" {
  type = string
}

variable "network_interface_ids" {
  type = map(string)
}

variable "ami_id" {
  type = string
}
