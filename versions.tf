terraform {
  required_version = "~>1.9.8"
  required_providers {
    aws = {
      source                = "hashicorp/aws"
      version               = "5.76.0"
      configuration_aliases = [aws.hyderabad]
    }
  }

  backend "s3" {
    bucket         = "dhruvkaushik305-tf-bucket"
    region         = "ap-south-1"
    key            = "state/terraform.tfstate"
    encrypt        = true
    dynamodb_table = "tf-lock-state"
  }
}
