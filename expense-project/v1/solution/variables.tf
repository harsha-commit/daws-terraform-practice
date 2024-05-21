### EC2 Variables ###
variable "ami_id" {
  type        = string
  default     = "ami-090252cbe067a9e58"
  description = "AMI ID of RHEL-9-DevOps-Practice AMI"
}

variable "instance_type" {
  type        = string
  default     = "t2.micro"
  description = "Instance Type of AWS EC2 Instance"
}

variable "common_tags" {
  type = map(any)
  default = {
    Environment = "Dev"
    Project     = "Expense"
    Terraform   = true
  }
}
