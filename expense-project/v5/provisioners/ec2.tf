resource "aws_instance" "db" {
  ami                    = "ami-090252cbe067a9e58"
  instance_type          = "t2.micro"
  vpc_security_group_ids = ["sg-07e7be74f52a6ea7b"]

  provisioner "local-exec" {
    command = "echo ${self.private_ip} >> private_ips.txt" # self is aws_instance.db
  }
}