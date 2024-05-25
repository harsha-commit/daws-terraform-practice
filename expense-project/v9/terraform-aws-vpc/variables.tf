### Project Variables ###

variable "project_name" {
  type = string
}

variable "environment" {
  type    = string
  default = "dev"
}

variable "common_tags" {
  type = map(any)
}

### VPC Variables ###

variable "vpc_main_cidr_block" {
  type    = string
  default = "10.0.0.0/16"
}

variable "vpc_main_instance_tenancy" {
  type    = string
  default = "default"
}

variable "vpc_main_tags" {
  type    = map(string)
  default = {}
}

variable "vpc_main_enable_dns_support" {
  type    = bool
  default = true
}

variable "vpc_main_enable_dns_hostnames" {
  type    = bool
  default = true
}

### IGW Variables ###

variable "igw_tags" {
  type    = map(any)
  default = {}
}

### Public Subnets Variables ###
variable "public_subnets_cidrs" {
  type = list(string)
  validation {
    condition     = length(var.public_subnets_cidrs) == 2
    error_message = "Please provide only 2 public subnets CIDR"
  }
}

variable "public_subnet_tags" {
  default = {}
}

variable "private_subnets_cidrs" {
  type = list(string)
  validation {
    condition     = length(var.private_subnets_cidrs) == 2
    error_message = "Please provide only 2 private subnets CIDR"
  }
}

variable "private_subnet_tags" {
  default = {}
}

variable "database_subnets_cidrs" {
  type = list(string)
  validation {
    condition     = length(var.database_subnets_cidrs) == 2
    error_message = "Please provide only 2 database subnets CIDR"
  }
}

variable "database_subnet_tags" {
  default = {}
}

### EIP Variables ###
variable "eip_tags" {
  default = {}
}

### NGW Variables ###
variable "ngw_tags" {
  default = {}
}

### Route Table Variables ###
variable "public_route_table_tags" {
  default = {}
}

variable "private_route_table_tags" {
  default = {}
}

variable "database_route_table_tags" {
  default = {}
}