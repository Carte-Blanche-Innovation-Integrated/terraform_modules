terraform {
  required_version = ">= 1.3"

  required_providers {
    random = {
      source  = "hashicorp/random"
      version = "3.4.3"
    }
    local = {
      source  = "hashicorp/local"
      version = "2.2.3"
    }
    tls = {
      source  = "hashicorp/tls"
      version = "4.0.4"
    }
    aws = {
      source  = "hashicorp/aws"
      version = "4.46.0"
    }
  }
}