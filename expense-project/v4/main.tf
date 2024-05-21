resource "aws_instance" "expense" {
  ami      = data.aws_ami.aws_ami_id.id
  for_each = var.instance_names

  # instance_type = var.instance_names[count.index] == "db" ? "t2.small" : "t2.micro"
  # count = length(var.instance_names)

  instance_type = each.value
  tags          = merge(var.common_tags, { Name = each.key })

  vpc_security_group_ids = [aws_security_group.allow_ports.id]
}