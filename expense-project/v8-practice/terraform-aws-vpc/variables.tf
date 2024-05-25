### Project Variables ###

variable "project_name" {
  type = string
}

variable "environment" {
  type    = string
  default = "dev"
}

variable "common_tags" {
  type    = map(string)
  default = {}
}

### VPC Variables ###

variable "vpc_cidr_block" {
  type    = string
  default = "10.0.0.0/16"
}

variable "vpc_instance_tenancy" {
  type    = string
  default = "default"
}

variable "vpc_enable_dns_hostnames" {
  type    = bool
  default = true
}

variable "vpc_enable_dns_support" {
  type    = bool
  default = true
}

variable "vpc_tags" {
  type    = map(string)
  default = {}
}

### IGW Variables ###

variable "igw_tags" {
  type    = map(string)
  default = {}
}

### Public Subnets Variables ###

variable "public_cidr_blocks" {
  type = list(string)
  validation {
    condition     = length(var.public_cidr_blocks) == 2
    error_message = "Please provide ONLY 2 Public CIDR Blocks"
  }
}

variable "public_subnet_tags" {
  type    = map(string)
  default = {}
}

### Private Subnets Variables ###

variable "private_cidr_blocks" {
  type = list(string)
  validation {
    condition     = length(var.private_cidr_blocks) == 2
    error_message = "Please provide ONLY 2 Private CIDR Blocks"
  }
}

variable "private_subnet_tags" {
  type    = map(string)
  default = {}
}

### Database Subnets Variables ###

variable "database_cidr_blocks" {
  type = list(string)
  validation {
    condition     = length(var.database_cidr_blocks) == 2
    error_message = "Please provide ONLY 2 Database CIDR Blocks"
  }
}

variable "database_subnet_tags" {
  type    = map(string)
  default = {}
}