###
### Route tables and associations
###

# Public
resource "aws_route_table" "rt1" {
    vpc_id = "${aws_vpc.vpc1.id}"

    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = "${aws_internet_gateway.gw1.id}"
    }

    tags {
        Name = "rt1"
        Desc = "Route table Public Subnet"
    }
}

resource "aws_route_table_association" "subnet3_rt1" {
  subnet_id      = "${aws_subnet.subnet3.id}"
  route_table_id = "${aws_route_table.rt1.id}"
}
resource "aws_route_table_association" "subnet4_rt1" {
  subnet_id      = "${aws_subnet.subnet4.id}"
  route_table_id = "${aws_route_table.rt1.id}"
}


# Private
resource "aws_route_table" "rt2" {
    vpc_id = "${aws_vpc.vpc1.id}"

    route {
        cidr_block = "0.0.0.0/0"
        nat_gateway_id = "${aws_nat_gateway.nat1.id}"
    }

    tags {
        Name = "rt2"
        Desc = "Route table Private Subnet"
    }
}

resource "aws_route_table_association" "subnet1_rt2" {
  subnet_id      = "${aws_subnet.subnet1.id}"
  route_table_id = "${aws_route_table.rt2.id}"
}
resource "aws_route_table_association" "subnet2_rt2" {
  subnet_id      = "${aws_subnet.subnet2.id}"
  route_table_id = "${aws_route_table.rt2.id}"
}