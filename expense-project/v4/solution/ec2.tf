resource "aws_instance" "expense" {
  ami = data.aws_ami.id.id
  # instance_type = var.ec2_instance_names[count.index] == "db" ? "t2.small" : "t2.micro"
  # count                  = length(var.ec2_instance_names)
  for_each               = var.ec2_instance_names_map
  instance_type          = each.value
  vpc_security_group_ids = [aws_security_group.allow_ports.id]

  tags = merge(var.common_tags, {
    Name   = each.key
    Module = each.key
  })
}