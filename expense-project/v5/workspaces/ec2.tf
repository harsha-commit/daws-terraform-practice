resource "aws_instance" "expense" {
  ami                    = data.aws_ami.id.id
  for_each               = lookup(var.ec2_instance_names_map, terraform.workspace)
  instance_type          = each.value
  vpc_security_group_ids = ["sg-07e7be74f52a6ea7b"]

  tags = merge(var.common_tags, {
    Name        = "${each.key}"
    Module      = "${each.key}"
    Environment = terraform.workspace
  })
}