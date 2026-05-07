#terraform provider, like which provider to use and the version
terraform {
# we can also add the terraform version too
# required_verion= ">=1.0"
  required_providers {
    aws = {
        source = "hashicorp/aws"
        version = "~>6.0"
    }
  }
}

#configure the cloud details
provider "aws" {
    region = "ap-south-1"
  
}

