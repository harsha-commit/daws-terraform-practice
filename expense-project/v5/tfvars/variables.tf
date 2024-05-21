variable "ami" {
  type        = string
  default     = "ami-090252cbe067a9e58"
  description = "AMI ID of Community RHEL"
}

variable "environment" {
  # default = "dev"
}

variable "common_tags" {
  type = map(any)
  default = {
    Project   = "Expense"
    Terraform = true
  }
}

variable "instance_names" {
  # type = map(string)
  # default = {
  #   db-dev       = "t2.small"
  #   backend-dev  = "t2.micro"
  #   frontend-dev = "t2.micro"
  # }
}

variable "zone_id" {
  default = "Z0156911VRCQKSCGEIKO"
}

variable "record_name" {
  default = "harshadevops.site"
}

variable "inbound_rules" {
  type = list(any)
  default = [
    {
      port         = 22
      allowed_cidr = ["0.0.0.0/0"]
      protocol     = "tcp"
    },
    {
      port         = 80
      allowed_cidr = ["0.0.0.0/0"]
      protocol     = "tcp"
    },
    {
      port         = 8080
      allowed_cidr = ["0.0.0.0/0"]
      protocol     = "tcp"
    },
    {
      port         = 3306
      allowed_cidr = ["0.0.0.0/0"]
      protocol     = "tcp"
    },
  ]
}