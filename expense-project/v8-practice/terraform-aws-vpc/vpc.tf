### VPC ###

resource "aws_vpc" "main" {
  cidr_block       = var.vpc_cidr_block
  instance_tenancy = var.vpc_instance_tenancy

  enable_dns_hostnames = var.vpc_enable_dns_hostnames
  enable_dns_support   = var.vpc_enable_dns_support

  tags = merge(var.common_tags, var.vpc_tags, {
    Name = "${local.resource_prefix}-vpc"
  })
}

### IGW ###

resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.main.id
  tags = merge(var.common_tags, var.igw_tags, {
    Name = "${local.resource_prefix}-igw"
  })
}

## Public Subnets ##

resource "aws_subnet" "public" {
  vpc_id = aws_vpc.main.id
  count  = length(var.public_cidr_blocks)

  cidr_block        = var.public_cidr_blocks[count.index]
  availability_zone = local.availability_zones.names[count.index]

  map_public_ip_on_launch = true

  tags = merge(var.common_tags, var.public_subnet_tags, {
    Name = "${local.resource_prefix}-subnet-public${count.index + 1}-${local.availability_zones.names[count.index]}"
  })
}

resource "aws_subnet" "private" {
  vpc_id = aws_vpc.main.id
  count  = length(var.private_cidr_blocks)

  cidr_block        = var.private_cidr_blocks[count.index]
  availability_zone = local.availability_zones.names[count.index]

  tags = merge(var.common_tags, var.private_subnet_tags, {
    Name = "${local.resource_prefix}-subnet-private${count.index + 1}-${local.availability_zones.names[count.index]}"
  })
}

resource "aws_subnet" "database" {
  vpc_id = aws_vpc.main.id
  count  = length(var.database_cidr_blocks)

  cidr_block        = var.database_cidr_blocks[count.index]
  availability_zone = local.availability_zones.names[count.index]

  map_public_ip_on_launch = true

  tags = merge(var.common_tags, var.database_subnet_tags, {
    Name = "${local.resource_prefix}-subnet-database${count.index + 1}-${local.availability_zones.names[count.index]}"
  })
}