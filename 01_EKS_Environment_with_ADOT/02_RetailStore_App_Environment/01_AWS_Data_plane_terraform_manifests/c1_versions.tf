terraform {
  # Minimum Terraform CLI version required
  required_version = ">= 1.12.0"

  # Required providers and version constraints
  required_providers {
    aws = {
        source = "hashicorp/aws"
        version = ">= 6.20"
    }
  }

  # Remote backend configuration using s3
  backend "s3" {
    bucket = "terraform-state-bucket-suraj"
    key = "retail-endpoints/dev/terraform.tfstate"
    region = "ap-northeast-1"
    encrypt = true
    use_lockfile = true
  }
}

provider "aws" {
  region = var.aws_region
}

# Secondary provider specifically for Cart's DynamoDB table
provider "aws" {
  alias = "south1"
  region = "ap-southeast-1"
}