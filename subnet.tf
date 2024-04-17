resource "aws_subnet" "subnets" {

  for_each = var.subnet

  vpc_id = aws_vpc.main.id

  cidr_block = each.value.cidr_block

  availability_zone = each.value.availability_zone

  tags = {
    Name = each.key
  }

}
