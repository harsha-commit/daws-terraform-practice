resource "aws_instance" "db" {
  ami                    = var.ami
  instance_type          = "t2.micro" # dynamic
  vpc_security_group_ids = [aws_security_group.allow_ports.id]

  provisioner "local-exec" {
    command = "echo ${self.private_ip} >> private_ip.txt" # self -> aws_instance.db
  }

  # provisioner "local-exec" {
  #   command = "ansible-playbook -i private_ip.txt web.yaml" # only works if ansible is installed
  # }

  connection {
    type     = "ssh"
    user     = "ec2-user"
    password = "DevOps321"
    host     = self.public_ip
  }

  provisioner "remote-exec" {
    inline = [
      "sudo dnf install ansible -y",
      "sudo dnf install nginx -y",
      "sudo systemctl start nginx"
    ]
  }
}