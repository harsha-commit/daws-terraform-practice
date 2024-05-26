module "backend" {
  source = "terraform-aws-modules/ec2-instance/aws"

  instance_type          = "t3.micro"
  vpc_security_group_ids = [data.aws_ssm_parameter.backend_sg_id.value]

  # Convert StringList to List and get first element
  subnet_id = local.private_subnet_id
  ami       = data.aws_ami.id.id

  tags = merge(var.common_tags, {
    Name = "${var.project_name}-${var.environment}-backend"
  })
}

module "frontend" {
  source = "terraform-aws-modules/ec2-instance/aws"

  instance_type          = "t3.micro"
  vpc_security_group_ids = [data.aws_ssm_parameter.frontend_sg_id.value]

  # Convert StringList to List and get first element
  subnet_id = local.public_subnet_id
  ami       = data.aws_ami.id.id

  tags = merge(var.common_tags, {
    Name = "${var.project_name}-${var.environment}-frontend"
  })
}