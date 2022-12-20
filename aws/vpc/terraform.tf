terraform {
  required_version = ">= 1.3"

  required_providers {
    random = {
      source  = "hashicorp/random"
      version = "3.4.3"
    }
    aws = {
      source  = "hashicorp/aws"
      version = "4.46.0"
    }
  }
}