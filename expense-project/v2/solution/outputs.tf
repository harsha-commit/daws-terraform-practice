output "aws_instance_expense_public_ip" {
  value = aws_instance.expense[0].public_ip
}

output "aws_instance_expense_private_ip" {
  value = aws_instance.expense[0].private_ip
}