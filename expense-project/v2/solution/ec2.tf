resource "aws_instance" "expense" {
  ami                    = var.ec2_ami_id
  instance_type          = var.ec2_instance_names[count.index] == "db" ? "t2.small" : "t2.micro"
  count                  = length(var.ec2_instance_names)
  vpc_security_group_ids = [aws_security_group.allow_ssh.id]

  tags = merge(var.common_tags, {
    Name   = var.ec2_instance_names[count.index]
    Module = var.ec2_instance_names[count.index]
  })
}