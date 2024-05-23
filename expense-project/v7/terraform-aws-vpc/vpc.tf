### VPC ###

resource "aws_vpc" "main" {
  cidr_block           = var.vpc_main_cidr_block
  instance_tenancy     = var.vpc_main_instance_tenancy
  enable_dns_support   = var.vpc_main_enable_dns_support
  enable_dns_hostnames = var.vpc_main_enable_dns_hostnames
  tags = merge(var.common_tags, var.vpc_main_tags,
    {
      Name = "${local.resource_name}-vpc"
  })
}

### Internet Gateway ###

resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.main.id

  tags = merge(var.common_tags, var.igw_tags, {
    Name = "${local.resource_name}-igw"
  })
}

### Public Subnets ###

resource "aws_subnet" "public" {
  vpc_id                  = aws_vpc.main.id
  count                   = length(var.public_subnets_cidrs)
  cidr_block              = var.public_subnets_cidrs[count.index]
  availability_zone       = local.az_names[count.index]
  map_public_ip_on_launch = true

  tags = merge(var.common_tags, var.public_subnet_tags, {
    Name = "${local.resource_name}-subnet-public${count.index + 1}-${local.az_names[count.index]}"
  })
}

### Private Subnets ###

resource "aws_subnet" "private" {
  vpc_id            = aws_vpc.main.id
  count             = length(var.private_subnets_cidrs)
  cidr_block        = var.private_subnets_cidrs[count.index]
  availability_zone = local.az_names[count.index]

  tags = merge(var.common_tags, var.private_subnet_tags, {
    Name = "${local.resource_name}-subnet-private${count.index + 1}-${local.az_names[count.index]}"
  })
}

### Database Subnets ###

resource "aws_subnet" "database" {
  vpc_id            = aws_vpc.main.id
  count             = length(var.database_subnets_cidrs)
  cidr_block        = var.database_subnets_cidrs[count.index]
  availability_zone = local.az_names[count.index]

  tags = merge(var.common_tags, var.database_subnet_tags, {
    Name = "${local.resource_name}-subnet-database${count.index + 1}-${local.az_names[count.index]}"
  })
}