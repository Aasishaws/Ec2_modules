terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

provider "aws" {
  shared_credentials_file = "~/.aws/credentials"
  region = var.region
}
[root@ip-172-31-17-204 terraform]# cat main.tf
module "master_module-1" {
  source = ".//module-1"
  masterec2_instance_type = var.master_ec2instance
}
module "slave_module-1" {
  source = ".//module-2"
  slaveec2_instance_type = var.slave_ec2instance
}

