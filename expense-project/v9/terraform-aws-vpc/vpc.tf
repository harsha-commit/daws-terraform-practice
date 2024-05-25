### VPC ###

resource "aws_vpc" "main" {
  cidr_block       = var.vpc_main_cidr_block
  instance_tenancy = var.vpc_main_instance_tenancy

  enable_dns_support   = var.vpc_main_enable_dns_support
  enable_dns_hostnames = var.vpc_main_enable_dns_hostnames

  tags = merge(var.common_tags, var.vpc_main_tags,
    {
      Name = "${local.resource_name}-vpc"
  })
}

### Internet Gateway ###

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main.id

  tags = merge(var.common_tags, var.igw_tags, {
    Name = "${local.resource_name}-igw"
  })
}

### Public Subnets ###

resource "aws_subnet" "public" {
  vpc_id = aws_vpc.main.id
  count  = length(var.public_subnets_cidrs)

  cidr_block              = var.public_subnets_cidrs[count.index]
  availability_zone       = local.az_names[count.index]
  map_public_ip_on_launch = true

  tags = merge(var.common_tags, var.public_subnet_tags, {
    Name = "${local.resource_name}-subnet-public${count.index + 1}-${local.az_names[count.index]}"
  })
}

### Private Subnets ###

resource "aws_subnet" "private" {
  vpc_id = aws_vpc.main.id
  count  = length(var.private_subnets_cidrs)

  cidr_block        = var.private_subnets_cidrs[count.index]
  availability_zone = local.az_names[count.index]

  tags = merge(var.common_tags, var.private_subnet_tags, {
    Name = "${local.resource_name}-subnet-private${count.index + 1}-${local.az_names[count.index]}"
  })
}

### Database Subnets ###

resource "aws_subnet" "database" {
  vpc_id = aws_vpc.main.id
  count  = length(var.database_subnets_cidrs)

  cidr_block        = var.database_subnets_cidrs[count.index]
  availability_zone = local.az_names[count.index]

  tags = merge(var.common_tags, var.database_subnet_tags, {
    Name = "${local.resource_name}-subnet-database${count.index + 1}-${local.az_names[count.index]}"
  })
}

### Elastic IP

resource "aws_eip" "nat" {
  domain = "vpc"
  tags = merge(var.common_tags, var.eip_tags, {
    Name = "${local.resource_name}-eip"
  })
}

### NAT Gateway ###
resource "aws_nat_gateway" "ngw" {
  allocation_id = aws_eip.nat.id
  subnet_id     = aws_subnet.public[0].id

  tags = merge(var.common_tags, var.ngw_tags, {
    Name = "${local.resource_name}-ngw-public1-${local.az_names[0]}"
  })

  depends_on = [aws_internet_gateway.igw] # Explicit Dependency
}

### Public Route Table ###

resource "aws_route_table" "public" {
  vpc_id = aws_vpc.main.id

  tags = merge(var.common_tags, var.public_route_table_tags, {
    Name = "${local.resource_name}-rtb-public"
  })
}

### Private Route Table ###

resource "aws_route_table" "private" {
  vpc_id = aws_vpc.main.id

  tags = merge(var.common_tags, var.private_route_table_tags, {
    Name = "${local.resource_name}-rtb-private"
  })
}

### Database Route Table ###

resource "aws_route_table" "database" {
  vpc_id = aws_vpc.main.id

  tags = merge(var.common_tags, var.database_route_table_tags, {
    Name = "${local.resource_name}-rtb-database"
  })
}

### Public Routes ###

resource "aws_route" "public" {
  route_table_id         = aws_route_table.public.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.igw.id
}

### Private Routes ###

resource "aws_route" "private" {
  route_table_id         = aws_route_table.private.id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = aws_nat_gateway.ngw.id
}

### Database Routes ###

resource "aws_route" "database" {
  route_table_id         = aws_route_table.database.id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = aws_nat_gateway.ngw.id
}

### Public Route Table Association ###
resource "aws_route_table_association" "public" {
  count          = length(aws_subnet.public)
  subnet_id      = element(aws_subnet.public[*].id, count.index) # same as aws_subnet.public[count.index].id
  route_table_id = aws_route_table.public.id
}

### Private Route Table Association ###

resource "aws_route_table_association" "private" {
  count          = length(var.private_subnets_cidrs)
  subnet_id      = element(aws_subnet.private[*].id, count.index) # aws_subnet.private[count.index].id
  route_table_id = aws_route_table.private.id
}

### Database Route Table Association ###

resource "aws_route_table_association" "database" {
  count          = length(var.database_subnets_cidrs)
  subnet_id      = element(aws_subnet.database[*].id, count.index) # aws_subnet.database[count.index].id
  route_table_id = aws_route_table.database.id
}