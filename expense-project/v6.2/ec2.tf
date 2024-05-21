module "ec2-test" {
  # receives code
  source        = "../v6"
  instance_type = "t3.small" # override
}