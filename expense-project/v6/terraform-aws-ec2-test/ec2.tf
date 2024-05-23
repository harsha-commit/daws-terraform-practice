module "ec2-test" {
  source        = "../terraform-aws-ec2"
  instance_type = "t3.micro"
  tags = {
    Name      = "Module Test"
    Terraform = true
  }
}