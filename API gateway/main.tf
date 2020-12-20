# Passing Creds. 
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}


# Configure the AWS Provider
provider "aws" {
  region = "us-east-1"
  access_key = var.accesskeys
  secret_key = var.secretkeys
}


# Terraform module to create Api Gateway resource on AWS for creatng api.
resource "aws_api_gateway_rest_api" "default" {
  count = var.enabled ? 1 : 0

  name                     = var.name
  description              = var.description
  binary_media_types       = var.binary_media_types
  minimum_compression_size = var.minimum_compression_size
  api_key_source           = var.api_key_source

  endpoint_configuration {
    types = var.types
  }
}

# Terraform module to create Api Gateway resource on AWS.
resource "aws_api_gateway_resource" "default" {
  count = length(var.path_parts) > 0 ? length(var.path_parts) : 0

  rest_api_id = aws_api_gateway_rest_api.default.*.id[0]
  parent_id   = aws_api_gateway_rest_api.default.*.root_resource_id[0]
  path_part   = element(var.path_parts, count.index)
}
