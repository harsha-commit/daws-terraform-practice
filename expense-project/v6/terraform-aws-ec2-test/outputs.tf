output "public_ip" {
  value = module.ec2-test.public_ip
}

output "private_ip" {
  value = module.ec2-test.private_ip
}

output "instance_id" {
  value = module.ec2-test.instance_id
}