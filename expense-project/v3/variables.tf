variable ami {
  type        = string
  default     = "ami-090252cbe067a9e58"
  description = "AMI ID of Community RHEL"
}

variable instance_type{
    type = string
    default = "t2.micro"
}

variable common_tags{
    type = map
    default = {
        Environment = "DEV"
        Project = "Expense"
    }
}

variable instance_names{
    type = list
    default = ["db", "backend", "frontend"]
}

variable zone_id{
    default = "Z0156911VRCQKSCGEIKO"
}

variable record_name{
    default = "harshadevops.site"
}