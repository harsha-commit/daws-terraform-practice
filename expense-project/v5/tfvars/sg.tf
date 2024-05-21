resource "aws_security_group" "allow_ports" {
  name        = "allow_ports"
  description = "Allow ports - 22, 80, 8080, 3306"

  tags = {
    Name = "allow_ports"
  }

  dynamic "ingress" {
    for_each = var.inbound_rules
    content {
      from_port   = ingress.value.port
      to_port     = ingress.value.port
      cidr_blocks = ingress.value.allowed_cidr
      protocol    = ingress.value.protocol
    }
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
}
