variable "region" {
  type        = string
  description = "AWS region"
  default     = "ap-south-1"
}

variable "app_name" {
  type        = string
  description = "Application name, used in resource naming"
}

variable "environment" {
  type        = string
  description = "Environment: dev, staging, prod"
}

variable "vpc_cidr" {
  type        = string
  description = "CIDR block for the VPC"
}

variable "public_subnet_cidr" {
  type        = string
  description = "CIDR block for public subnet"
}

variable "private_subnet_cidr" {
  type        = string
  description = "CIDR block for private subnet"
}

variable "instance_type" {
  type        = string
  description = "EC2 instance type for app servers"
}
