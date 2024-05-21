variable "ami" {
  type        = string
  default     = "ami-090252cbe067a9e58"
  description = "AMI ID of Community RHEL"
}

variable "instance_type" {
  type    = string
  default = "t2.micro"
}

variable "common_tags" {
  type = map(any)
  default = {
    Environment = "DEV"
    Project     = "Expense"
  }
}

# variable instance_names{
#     type = list
#     default = ["db", "backend", "frontend"]
# }

variable "instance_names" {
  type = map(string)
  default = {
    db       = "t2.small"
    backend  = "t2.micro"
    frontend = "t2.micro"
  }
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