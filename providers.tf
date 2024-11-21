provider "aws" {
  region = "ap-south-1"
}

provider "aws" {
  region = "ap-south-2"
  alias  = "hyderabad"
}
