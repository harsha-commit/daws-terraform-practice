### Project Level Variables ###

variable "common_tags" {
  type = map(any)
  default = {
    Environment = "dev"
    Project     = "Expense"
    Terraform   = true
  }
  description = "Common Tags for Expense Project"
}

### aws_instance variables ###

variable "ec2_ami_id" {
  type        = string
  default     = "ami-090252cbe067a9e58"
  description = "AMI ID of RHEL-9-DevOps-Practice AMI"
}

variable "ec2_instance_type" {
  type        = string
  default     = "t2.micro"
  description = "Instance Type of AWS EC2 Instance"
}

variable "ec2_instance_names_list" {
  type    = list(string)
  default = ["db", "backend", "frontend"]
}

variable "ec2_instance_names_map" {
  type = map(string)
  default = {
    "db"       = "t2.small"
    "backend"  = "t2.micro"
    "frontend" = "t2.micro"
  }
}

### aws_security_group variables ###

variable "sg_name" {
  type    = string
  default = "allow_ports"
}

variable "sg_description" {
  type    = string
  default = "Allow ports 22, 80, 8080, 3306 inbound traffic and all outbound traffic"
}

variable "sg_module" {
  type    = string
  default = "sg"
}

variable "sg_inbound_rules" {
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