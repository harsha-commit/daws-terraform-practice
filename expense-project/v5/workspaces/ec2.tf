resource "aws_instance" "db" {
  ami                    = var.ami
  instance_type          = lookup(var.instance_type, terraform.workspace) # dynamic
  vpc_security_group_ids = [aws_security_group.allow_ports.id]
}