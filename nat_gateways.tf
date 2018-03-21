###
### NAT
###
resource "aws_nat_gateway" "nat1" {
	allocation_id = "${aws_eip.eip1.id}"
	subnet_id = "${aws_subnet.subnet3.id}"
}