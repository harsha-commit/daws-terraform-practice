resource "aws_instance" "expense" {
  ami           = var.ec2_ami_id
  instance_type = var.ec2_instance_type
  count         = length(var.ec2_instance_names)

  tags = merge(var.common_tags, {
    Name   = var.ec2_instance_names[count.index]
    Module = var.ec2_instance_names[count.index]
  })
}