terraform {
    cloud {
    organization = "uzairhub"

    workspaces {
      name = "terra-house-1"
    }
  }
  required_providers {
    random = {
      source = "hashicorp/random"
      version = "3.6.0"
    }
    aws = {
      source = "hashicorp/aws"
      version = "5.31.0"
    }
  }
}


provider "aws" {
  # Configuration options
}

provider "random" {
  # Configuration options
}


resource "random_string" "bucket_name" {
  length     = 16
  lower = true
  upper = false
  special = false

}

# Error 403 Access Denied faced when tried to create bucket with terraform apply.
# Deleted terraform.tfstate file and again init, plan and apply terraform and issue got resolved, state file was using old bucket name
resource "aws_s3_bucket" "example" {
  bucket = random_string.bucket_name.result
}

output "random_bucket_name" {
  value = random_string.bucket_name.result
}
