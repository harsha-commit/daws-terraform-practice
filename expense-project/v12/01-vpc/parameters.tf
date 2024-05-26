resource "aws_ssm_parameter" "vpc_id" {
  name  = "/${var.project_name}/${var.environment}/vpc-id"
  type  = "String"
  value = module.vpc-test.vpc_id
}

resource "aws_ssm_parameter" "public_subnet_ids" {
  name  = "/${var.project_name}/${var.environment}/public-subnet-ids"
  type  = "StringList"
  value = join(",", module.vpc-test.public_subnet_ids) # List to StringList
}

resource "aws_ssm_parameter" "private_subnet_ids" {
  name  = "/${var.project_name}/${var.environment}/private-subnet-ids"
  type  = "StringList"
  value = join(",", module.vpc-test.private_subnet_ids) # List to StringList
}

resource "aws_ssm_parameter" "database_subnet_ids" {
  name  = "/${var.project_name}/${var.environment}/database-subnet-ids"
  type  = "StringList"
  value = join(",", module.vpc-test.database_subnet_ids) # List to StringList
}

resource "aws_ssm_parameter" "db_subnet_group_name" {
  name  = "/${var.project_name}/${var.environment}/db-subnet-group-name"
  type  = "String"
  value = module.vpc-test.database_subnet_group_name
}