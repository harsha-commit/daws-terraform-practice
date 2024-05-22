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

variable "ec2_instance_names" {
  type    = list(string)
  default = ["db", "backend", "frontend"]
}

### aws_security_group variables ###

variable "sg_name" {
  type    = string
  default = "allow_ssh"
}

variable "sg_description" {
  type    = string
  default = "Allow SSH inbound traffic and all outbound traffic"
}

variable "sg_ingress_from_port" {
  type    = number
  default = 22
}

variable "sg_ingress_to_port" {
  type    = number
  default = 22
}

variable "sg_egress_from_port" {
  type    = number
  default = 22
}

variable "sg_egress_to_port" {
  type    = number
  default = 22
}

variable "sg_ingress_protocol" {
  type    = string
  default = "tcp"
}

variable "sg_egress_protocol" {
  type    = string
  default = "tcp"
}

variable "sg_ingress_cidr_blocks" {
  type    = list(string)
  default = ["0.0.0.0/0"]
}

variable "sg_egress_cidr_blocks" {
  type    = list(string)
  default = ["0.0.0.0/0"]
}

variable "sg_module" {
  type    = string
  default = "sg"
}