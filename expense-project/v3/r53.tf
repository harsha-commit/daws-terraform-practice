resource "aws_route53_record" "expense" {
  zone_id = var.zone_id
  name    = var.instance_names[count.index] == "frontend" ? var.record_name : "${var.instance_names[count.index]}.${var.record_name}"
  count = length(var.instance_names)
  type    = "A"
  ttl     = 1
  records = [var.instance_names[count.index] == "frontend" ? aws_instance.expense[count.index].public_ip : aws_instance.expense[count.index].private_ip]
  allow_overwrite = true
}