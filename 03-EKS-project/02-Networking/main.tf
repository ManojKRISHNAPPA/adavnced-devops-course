data "aws_availability_zones" "available" {
  state = "available"
}


locals {
  azs = var.azs
  tags = {
    "Project" = var.project_name
  }
}

## VPC creation
resource "aws_vpc" "main" {
  cidr_block           = var.vpc_cidr
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = merge(local.tags, {
    Name = "${var.project_name}-vpc"
  })
}

## Subnet creation for ALB NAT
resource "aws_subnet" "public" {
  count                   = length(local.azs)
  vpc_id                  = aws_vpc.main.id
  cidr_block              = cidrsubnet(var.vpc_cidr, 8, count.index)
  availability_zone       = local.azs[count.index]
  map_public_ip_on_launch = true    

    tags = merge(local.tags, {
        Name = "${var.project_name}-public-subnet-${count.index + 1}"
    })
}

## Private Subnet creation will use for eks nodes
resource "aws_subnet" "private" {
  count                   = length(local.azs)
  vpc_id                  = aws_vpc.main.id
  cidr_block              = cidrsubnet(var.vpc_cidr, 8, count.index + length(local.azs))
  availability_zone       = local.azs[count.index]
  map_public_ip_on_launch = false       
  
    tags = merge(local.tags, {
        Name = "${var.project_name}-private-subnet-${count.index + 1}"
    })
}

## internet gateway creation
resource "aws_internet_gateway" "main" {
    vpc_id = aws_vpc.main.id

    tags = merge(local.tags, {
        Name = "${var.project_name}-igw"
    })
}


# public route table creation
resource "aws_route_table" "public" {
    vpc_id = aws_vpc.main.id
    tags = merge(local.tags, {
        Name = "${var.project_name}-public-rt"
    })
}

#
resource "aws_route" "public" {
    route_table_id         = aws_route_table.public.id
    destination_cidr_block = "0.0.0.0/0"
    gateway_id             = aws_internet_gateway.main.id
}

## route table association for public subnets
resource "aws_route_table_association" "public" {
    count          = length(local.azs)
    subnet_id      = aws_subnet.public[count.index].id
    route_table_id = aws_route_table.public.id
}

#NAT Gateway creation
resource "aws_eip" "nat" {
    domain = "vpc"
    tags = merge(local.tags, {
        Name = "${var.project_name}-nat-eip"
    })
}

# Nat Gateway creation
resource "aws_nat_gateway" "main" {
    allocation_id = aws_eip.nat.id
    subnet_id     = aws_subnet.public[0].id
    tags = merge(local.tags, {
        Name = "${var.project_name}-nat-gateway"
    })

    depends_on = [aws_internet_gateway.main]
}

# private route table creation
resource "aws_route" "private" {
    route_table_id         = aws_route_table.private.id
    destination_cidr_block = "0.0.0.0/0"
    nat_gateway_id         = aws_nat_gateway.main.id
}

# private route 

resource "aws_route_table_association" "private" {
    count          = length(local.azs)
    subnet_id      = aws_subnet.private[count.index].id
    route_table_id = aws_route_table.private.id
}