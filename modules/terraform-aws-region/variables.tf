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
