resource "aws_route53_record" "expense" {
  zone_id         = var.zone_id
  for_each        = aws_instance.expense
  name            = each.key == "frontend" ? var.record_name : "${each.key}.${var.record_name}"
  type            = "A"
  ttl             = 1
  records         = [each.key == "frontend" ? each.value.public_ip : each.value.private_ip]
  allow_overwrite = true
}