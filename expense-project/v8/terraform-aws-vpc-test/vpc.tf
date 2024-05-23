module "vpc-test" {
  source             = "../terraform-aws-vpc"
  project_name       = var.project_name
  common_tags        = var.common_tags
  public_cidr_blocks = ["10.0.1.0/24", "10.0.2.0/24"]
}