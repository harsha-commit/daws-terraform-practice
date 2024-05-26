module "db" {
  source         = "../modules/terraform-aws-sg"
  project_name   = var.project_name
  environment    = var.environment
  common_tags    = var.common_tags
  sg_description = var.db_sg_description
  sg_name        = var.db_sg_name
  vpc_id         = data.aws_ssm_parameter.vpc_id.value
}

module "backend" {
  source         = "../modules/terraform-aws-sg"
  project_name   = var.project_name
  environment    = var.environment
  common_tags    = var.common_tags
  sg_description = var.backend_sg_description
  sg_name        = var.backend_sg_name
  vpc_id         = data.aws_ssm_parameter.vpc_id.value
}

module "frontend" {
  source         = "../modules/terraform-aws-sg"
  project_name   = var.project_name
  environment    = var.environment
  common_tags    = var.common_tags
  sg_description = var.frontend_sg_description
  sg_name        = var.frontend_sg_name
  vpc_id         = data.aws_ssm_parameter.vpc_id.value
}

module "bastion" {
  source         = "../modules/terraform-aws-sg"
  project_name   = var.project_name
  environment    = var.environment
  common_tags    = var.common_tags
  sg_description = var.bastion_sg_description
  sg_name        = var.bastion_sg_name
  vpc_id         = data.aws_ssm_parameter.vpc_id.value
}

module "ansible" {
  source         = "../modules/terraform-aws-sg"
  project_name   = var.project_name
  environment    = var.environment
  common_tags    = var.common_tags
  sg_description = var.ansible_sg_description
  sg_name        = var.ansible_sg_name
  vpc_id         = data.aws_ssm_parameter.vpc_id.value
}

# DB is accepting connections from backend
resource "aws_security_group_rule" "db_backend" {
  type                     = "ingress"
  from_port                = 3306
  to_port                  = 3306
  protocol                 = "tcp"
  source_security_group_id = module.backend.sg_id
  security_group_id        = module.db.sg_id
}

# DB is accepting connections from bastion
resource "aws_security_group_rule" "db_bastion" {
  type                     = "ingress"
  from_port                = 3306
  to_port                  = 3306
  protocol                 = "tcp"
  source_security_group_id = module.bastion.sg_id
  security_group_id        = module.db.sg_id
}

# backend is accepting connections from frontend
resource "aws_security_group_rule" "backend_frontend" {
  type                     = "ingress"
  from_port                = 8080
  to_port                  = 8080
  protocol                 = "tcp"
  source_security_group_id = module.frontend.sg_id
  security_group_id        = module.backend.sg_id
}

# backend is accepting connections from bastion
resource "aws_security_group_rule" "backend_bastion" {
  type                     = "ingress"
  from_port                = 22
  to_port                  = 22
  protocol                 = "tcp"
  source_security_group_id = module.bastion.sg_id
  security_group_id        = module.backend.sg_id
}

# backend is accepting connections from ansible
resource "aws_security_group_rule" "backend_ansible" {
  type                     = "ingress"
  from_port                = 22
  to_port                  = 22
  protocol                 = "tcp"
  source_security_group_id = module.ansible.sg_id
  security_group_id        = module.backend.sg_id
}

# frontend is accepting connections from public
resource "aws_security_group_rule" "frontend_public" {
  type              = "ingress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = module.frontend.sg_id
}

# frontend is accepting connections from bastion
resource "aws_security_group_rule" "frontend_bastion" {
  type                     = "ingress"
  from_port                = 22
  to_port                  = 22
  protocol                 = "tcp"
  source_security_group_id = module.bastion.sg_id
  security_group_id        = module.frontend.sg_id
}

# frontend is accepting connections from ansible
resource "aws_security_group_rule" "frontend_ansible" {
  type                     = "ingress"
  from_port                = 22
  to_port                  = 22
  protocol                 = "tcp"
  source_security_group_id = module.ansible.sg_id
  security_group_id        = module.frontend.sg_id
}

# bastion is accepting connections from public
resource "aws_security_group_rule" "bastion_public" {
  type              = "ingress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = module.bastion.sg_id
}

# ansible is accepting connections from public
resource "aws_security_group_rule" "ansible_public" {
  type              = "ingress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = module.ansible.sg_id
}