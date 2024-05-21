resource "aws_instance" "db" {
  ami                    = var.ami
  instance_type          = var.instance_type
  vpc_security_group_ids = [aws_security_group.allow_ports.id]
  tags                   = var.tags
}