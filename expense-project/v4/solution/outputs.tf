output "aws_instance_expense_public_ip" {
  value = aws_instance.expense["db"].public_ip
}

output "aws_instance_expense_private_ip" {
  value = aws_instance.expense["db"].private_ip
}

output "r53_zone_details" {
  value = data.aws_route53_zone.details
}