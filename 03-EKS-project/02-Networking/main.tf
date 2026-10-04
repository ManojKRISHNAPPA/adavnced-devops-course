```hcl
# ============================================================
# Availability Zones
# ============================================================

data "aws_availability_zones" "available" {
  state = "available"
}


# ============================================================
# Locals
# ============================================================

locals {
  azs = var.azs

  tags = {
    Project = var.project_name
  }
}


# ============================================================
# VPC
# ============================================================

resource "aws_vpc" "main" {
  cidr_block           = var.vpc_cidr
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = merge(local.tags, {
    Name = "${var.project_name}-vpc"
  })
}


# ============================================================
# Public Subnets
# Used for ALB and NAT Gateway
# ============================================================

resource "aws_subnet" "public" {
  count = length(local.azs)

  vpc_id                  = aws_vpc.main.id
  cidr_block              = cidrsubnet(var.vpc_cidr, 8, count.index)
  availability_zone       = local.azs[count.index]
  map_public_ip_on_launch = true

  tags = merge(local.tags, {
    Name = "${var.project_name}-public-subnet-${count.index + 1}"
  })
}


# ============================================================
# Private Subnets
# Used for EKS Worker Nodes
# ============================================================

resource "aws_subnet" "private" {
  count = length(local.azs)

  vpc_id                  = aws_vpc.main.id
  cidr_block              = cidrsubnet(
    var.vpc_cidr,
    8,
    count.index + length(local.azs)
  )
  availability_zone       = local.azs[count.index]
  map_public_ip_on_launch = false

  tags = merge(local.tags, {
    Name = "${var.project_name}-private-subnet-${count.index + 1}"
  })
}


# ============================================================
# Internet Gateway
# ============================================================

resource "aws_internet_gateway" "main" {
  vpc_id = aws_vpc.main.id

  tags = merge(local.tags, {
    Name = "${var.project_name}-igw"
  })
}


# ============================================================
# Public Route Table
# ============================================================

resource "aws_route_table" "public" {
  vpc_id = aws_vpc.main.id

  tags = merge(local.tags, {
    Name = "${var.project_name}-public-rt"
  })
}


# ============================================================
# Public Route
# Internet Gateway -> Internet
# ============================================================

resource "aws_route" "public" {
  route_table_id         = aws_route_table.public.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.main.id
}


# ============================================================
# Public Route Table Associations
# ============================================================

resource "aws_route_table_association" "public" {
  count = length(local.azs)

  subnet_id      = aws_subnet.public[count.index].id
  route_table_id = aws_route_table.public.id
}


# ============================================================
# Elastic IP for NAT Gateway
# ============================================================

resource "aws_eip" "nat" {
  domain = "vpc"

  tags = merge(local.tags, {
    Name = "${var.project_name}-nat-eip"
  })
}


# ============================================================
# NAT Gateway
# Single NAT Gateway for all private subnets
# ============================================================

resource "aws_nat_gateway" "main" {
  allocation_id = aws_eip.nat.id
  subnet_id     = aws_subnet.public[0].id

  tags = merge(local.tags, {
    Name = "${var.project_name}-nat-gateway"
  })

  depends_on = [
    aws_internet_gateway.main
  ]
}


# ============================================================
# Private Route Table
# ============================================================

resource "aws_route_table" "private" {
  vpc_id = aws_vpc.main.id

  tags = merge(local.tags, {
    Name = "${var.project_name}-private-rt"
  })
}


# ============================================================
# Private Route
# Private Subnets -> NAT Gateway -> Internet
# ============================================================

resource "aws_route" "private" {
  route_table_id         = aws_route_table.private.id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = aws_nat_gateway.main.id
}


# ============================================================
# Private Route Table Associations
# ============================================================

resource "aws_route_table_association" "private" {
  count = length(local.azs)

  subnet_id      = aws_subnet.private[count.index].id
  route_table_id = aws_route_table.private.id
}
