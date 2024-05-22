# resource "aws_security_group" "allow_ports" {
#   name        = var.sg_name
#   description = var.sg_description

#   dynamic "ingress" {

#     for_each = var.sg_inbound_rules

#     content {
#       from_port   = ingress.value["port"]
#       to_port     = ingress.value["port"]
#       protocol    = ingress.value["protocol"]
#       cidr_blocks = ingress.value["allowed_cidr"]
#     }
#   }

#   egress {
#     from_port   = "0"
#     to_port     = "0"
#     protocol    = "tcp"
#     cidr_blocks = ["0.0.0.0/0"]
#   }

#   tags = merge(var.common_tags, {
#     Name   = var.sg_name
#     Module = var.sg_module
#   })
# }
