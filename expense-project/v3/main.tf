resource "aws_instance" "expense" {
  ami           = data.aws_ami.aws_ami_id.id
  instance_type = var.instance_names[count.index] == "db" ? "t2.small" : "t2.micro"
  count         = length(var.instance_names)

  tags = merge(var.common_tags, { Name = var.instance_names[count.index] })

  vpc_security_group_ids = [aws_security_group.allow_ssh_2.id]
}