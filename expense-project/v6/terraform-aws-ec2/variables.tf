variable "tags" {
  type    = map(string)
  default = {} # This is optional
}

variable "ami_id" {
  type    = string
  default = "ami-090252cbe067a9e58"
}

variable "instance_type" {
  type    = string
  default = "t2.micro"
}

variable "security_group_ids" {
  type    = list(string)
  default = ["sg-07e7be74f52a6ea7b"]
}