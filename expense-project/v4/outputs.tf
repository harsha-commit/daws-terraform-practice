output "instance_details" {
  value = aws_instance.expense
}

output "route53_details" {
  value = aws_route53_record.expense
}

output "aws_ami_details" {
  value = data.aws_ami.aws_ami_id
}