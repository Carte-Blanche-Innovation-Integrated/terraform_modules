data "aws_availability_zones" "all" {}

resource "random_shuffle" "az" {
  input        = data.aws_availability_zones.all.names
  result_count = 1
}

locals {
  nat_count = var.enable_nat ? var.single_nat ? 1 : min(length(var.public_subnet_cidrs), length(var.private_subnet_cidrs)) : 0
}

#############################
# VPC
#############################

resource "aws_vpc" "vpc" {
  cidr_block = var.vpc_cidr

  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    "Name" = var.vpc_name
  }
}

#############################
# Internet Gateway
#############################

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc.id

  tags = { "Name" = "${var.vpc_name}-igw" }
}

#############################
# Public subnets
#############################

resource "aws_subnet" "public_subnets" {
  count = length(var.public_subnet_cidrs)

  cidr_block              = var.public_subnet_cidrs[count.index]
  availability_zone       = random_shuffle.az.result[0]
  vpc_id                  = aws_vpc.vpc.id
  map_public_ip_on_launch = true

  tags = { "Name" = "${var.vpc_name}-public-subnet-${count.index}" }
}

resource "aws_route_table" "public_tables" {
  count = length(var.public_subnet_cidrs)

  vpc_id = aws_vpc.vpc.id

  tags = { "Name" = "${var.vpc_name}-public-route-table-${count.index}" }
}

resource "aws_route_table_association" "public_associations" {
  count = length(var.public_subnet_cidrs)

  subnet_id      = aws_subnet.public_subnets[count.index].id
  route_table_id = aws_route_table.public_tables[count.index].id
}

resource "aws_route" "public_internet_access" {
  count = length(var.public_subnet_cidrs)

  route_table_id         = aws_route_table.public_tables[count.index].id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.igw.id
  depends_on             = [aws_route_table.public_tables, aws_internet_gateway.igw]
}

#############################
# NAT Gateway
#############################

resource "aws_eip" "public_nat_eips" {
  count = local.nat_count

  vpc = true

  tags = { "Name" = "${var.vpc_name}-nat-eip-${count.index}" }
}

resource "aws_nat_gateway" "nat_gateways" {
  count = local.nat_count

  allocation_id = aws_eip.public_nat_eips[count.index].id
  subnet_id     = aws_subnet.public_subnets[count.index].id

  tags = { "Name" = "${var.vpc_name}-natgw-${count.index}" }
}

#############################
# Private subnets
#############################

resource "aws_subnet" "private_subnets" {
  count = length(var.private_subnet_cidrs)

  cidr_block        = var.private_subnet_cidrs[count.index]
  availability_zone = data.aws_availability_zones.all.names[count.index]
  vpc_id            = aws_vpc.vpc.id

  tags = { "Name" = "${var.vpc_name}-private-subnet-${count.index}" }
}

resource "aws_route_table" "private_tables" {
  count = length(var.private_subnet_cidrs)

  vpc_id = aws_vpc.vpc.id

  tags = { "Name" = "${var.vpc_name}-private-route-table-${count.index}" }
}

resource "aws_route_table_association" "private_associations" {
  count = length(var.private_subnet_cidrs)

  subnet_id      = aws_subnet.private_subnets[count.index].id
  route_table_id = aws_route_table.private_tables[count.index].id
}

resource "aws_route" "private_internet_access" {
  count = var.enable_nat ? length(var.private_subnet_cidrs) : 0

  route_table_id         = aws_route_table.private_tables[count.index].id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = local.nat_count >= (count.index + 1) ? aws_nat_gateway.nat_gateways[count.index].id : aws_nat_gateway.nat_gateways[local.nat_count - 1].id
}
