locals {
  r53_zone_id     = data.aws_route53_zone.details.zone_id
  r53_zone_type   = "A"
  r53_ttl         = 1
  r53_domain_name = data.aws_route53_zone.details.name
}