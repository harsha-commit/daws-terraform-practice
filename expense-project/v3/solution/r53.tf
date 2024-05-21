resource "aws_route53_record" "expense" {
  zone_id         = local.r53_zone_id
  name            = var.ec2_instance_names[count.index] == "frontend" ? "${local.r53_domain_name}" : "${var.ec2_instance_names[count.index]}.${local.r53_domain_name}"
  type            = local.r53_zone_type
  ttl             = local.r53_ttl
  count           = length(var.ec2_instance_names)
  records         = [var.ec2_instance_names[count.index] == "frontend" ? aws_instance.expense[count.index].public_ip : aws_instance.expense[count.index].private_ip]
  allow_overwrite = true
}