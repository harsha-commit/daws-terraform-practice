### VPC ###

resource "aws_vpc" "main" {
  cidr_block       = var.vpc_cidr_block
  instance_tenancy = var.vpc_instance_tenancy

  enable_dns_hostnames = var.vpc_enable_dns_hostnames
  enable_dns_support   = var.vpc_enable_dns_support

  tags = merge(var.common_tags, var.vpc_tags, {
    Name = "${var.project_name}-${var.environment}-vpc"
  })
}

### IGW ###

resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.main.id
  tags = merge(var.common_tags, var.igw_tags, {
    Name = "${var.project_name}-${var.environment}-igw"
  })
}

## Public Subnets ##

resource "aws_subnet" "public" {
  vpc_id = aws_vpc.main.id
  count  = length(var.public_cidr_blocks)

  cidr_block = var.public_cidr_blocks[count.index]

  tags = {
    Name = "${var.project_name}-${var.environment}-subnet-public-${count.index + 1}}-${data.aws_availability_zones.available_zones.names[count.index]}"
  }
}