variable "ami" {
  type        = string
  default     = "ami-090252cbe067a9e58"
  description = "AMI ID of Community RHEL"
}

variable "tags" {
  default = {
    Name = "V6"
  }
}

variable "instance_type" {
  default = "t2.micro"
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