variable "availability_zone" {
  type = string
}

variable "security_group_ids" {
  type = map(string)
}

variable "ami_id" {
  type = string
}

variable "key_name" {
  type = string
}

variable "subnet_ids" {
  type = map(string)
}
