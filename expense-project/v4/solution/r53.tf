resource "aws_route53_record" "expense" {
  zone_id = local.r53_zone_id
  name    = each.key == "frontend" ? local.r53_domain : "${each.key}.${local.r53_domain}"
  type    = local.r53_zone_type
  ttl     = local.r53_ttl
  # count           = length(var.ec2_instance_names)
  for_each        = aws_instance.expense
  records         = [each.key == "frontend" ? each.value.public_ip : each.value.private_ip]
  allow_overwrite = true
}