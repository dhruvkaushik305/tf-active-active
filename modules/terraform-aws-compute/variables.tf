variable "availability_zone" {
  type = string
}

variable "network_interface_ids" {
  type = map(string)
}

variable "ami_id" {
  type = string
}

variable "key_name" {
  type = string
}

variable "allocation_id" {
  type = string
}
