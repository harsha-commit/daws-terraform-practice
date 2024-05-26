module "bastion" {
  source = "terraform-aws-modules/ec2-instance/aws"

  instance_type          = "t3.micro"
  vpc_security_group_ids = [data.aws_ssm_parameter.bastion_sg_id.value]

  # Convert StringList to List and get first element
  subnet_id = local.bastion_public_subnet_id
  ami = data.aws_ami.id.id

  tags = merge(var.common_tags, var.bastion_tags, {
    Name = "${var.project_name}-${var.environment}-bastion"
  })
}