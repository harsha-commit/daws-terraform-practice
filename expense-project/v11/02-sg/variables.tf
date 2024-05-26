variable "project_name" {
  default = "expense"
}

variable "environment" {
  default = "dev"
}

variable "common_tags" {
  default = {
    Project     = "expense"
    Environment = "dev"
    Terraform   = true
  }
}

# variable "vpc_id" {
#   default = data.aws_ssm_parameter
# }

variable "db_sg_name" {
  default = "db-sg"
}

variable "db_sg_description" {
  default = "Security Group for Database Instances"
}

variable "backend_sg_name" {
  default = "backend-sg"
}

variable "backend_sg_description" {
  default = "Security Group for Backend Instances"
}

variable "frontend_sg_name" {
  default = "frontend-sg"
}

variable "frontend_sg_description" {
  default = "Security Group for Frontend Instances"
}

variable "bastion_sg_name" {
  default = "bastion-sg"
}

variable "bastion_sg_description" {
  default = "Security Group for Bastion Instances"
}

variable "ansible_sg_name" {
  default = "ansible-sg"
}

variable "ansible_sg_description" {
  default = "Security Group for Ansible Instances"
}