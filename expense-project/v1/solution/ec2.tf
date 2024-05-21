resource "aws_instance" "db" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  vpc_security_group_ids = [aws_security_group.allow_ssh.id]

  tags = {
    Name        = "database"
    Environment = "dev"
    Project     = "Expense"
    Module      = "db"
    Terraform   = true
  }
}

resource "aws_instance" "backend" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  vpc_security_group_ids = [aws_security_group.allow_ssh.id]

  tags = {
    Name        = "backend"
    Environment = "dev"
    Project     = "Expense"
    Module      = "backend"
    Terraform   = true
  }
}

resource "aws_instance" "frontend" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  vpc_security_group_ids = [aws_security_group.allow_ssh.id]

  tags = {
    Name        = "frontend"
    Environment = "dev"
    Project     = "Expense"
    Module      = "frontend"
    Terraform   = true
  }
}

