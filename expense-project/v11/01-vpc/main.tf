module "vpc-test" {
  source                 = "../modules/terraform-aws-vpc"
  project_name           = var.project_name
  environment            = var.environment
  common_tags            = var.common_tags
  public_subnets_cidrs   = var.public_subnets_cidrs
  private_subnets_cidrs  = var.private_subnets_cidrs
  database_subnets_cidrs = var.database_subnets_cidrs
  is_peering_required    = var.is_peering_required
}