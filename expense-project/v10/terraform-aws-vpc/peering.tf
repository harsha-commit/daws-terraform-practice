resource "aws_vpc_peering_connection" "main" {
  count         = var.is_peering_required ? 1 : 0
  peer_owner_id = aws_vpc.main.owner_id
  peer_vpc_id   = var.target_vpc_id == "" ? data.aws_vpc.default.id : var.target_vpc_id # Acceptor
  vpc_id        = aws_vpc.main.id                                                       # Requestor
  auto_accept   = var.target_vpc_id == ""
  tags = merge(var.common_tags, var.vpc_peering_connection_tags, {
    Name = "${local.resource_name}-peering"
  })
}

### Peering Routes ###
resource "aws_route" "public_peering" {
  count                     = var.is_peering_required && var.target_vpc_id == "" ? 1 : 0 # Peering + Default
  route_table_id            = aws_route_table.public.id
  destination_cidr_block    = data.aws_vpc.default.cidr_block
  vpc_peering_connection_id = aws_vpc_peering_connection.main[count.index].id
}

resource "aws_route" "private_peering" {
  count                     = var.is_peering_required && var.target_vpc_id == "" ? 1 : 0 # Peering + Default
  route_table_id            = aws_route_table.private.id
  destination_cidr_block    = data.aws_vpc.default.cidr_block
  vpc_peering_connection_id = aws_vpc_peering_connection.main[count.index].id
}

resource "aws_route" "database_peering" {
  count                     = var.is_peering_required && var.target_vpc_id == "" ? 1 : 0 # Peering + Default
  route_table_id            = aws_route_table.database.id
  destination_cidr_block    = data.aws_vpc.default.cidr_block
  vpc_peering_connection_id = aws_vpc_peering_connection.main[count.index].id
}

resource "aws_route" "default_peering" {
  count                     = var.is_peering_required && var.target_vpc_id == "" ? 1 : 0
  route_table_id            = data.aws_vpc.default.main_route_table_id
  destination_cidr_block    = aws_vpc.main.cidr_block
  vpc_peering_connection_id = aws_vpc_peering_connection.main[count.index].id
}