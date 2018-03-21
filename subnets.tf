###
### Subnets
###

# Private
resource "aws_subnet" "subnet1" {
    vpc_id = "${aws_vpc.vpc1.id}"
    cidr_block = "10.0.0.0/26"
    availability_zone = "eu-west-1a"
}

resource "aws_subnet" "subnet2" {
    vpc_id = "${aws_vpc.vpc1.id}"
    cidr_block = "10.0.0.64/26"
    availability_zone = "eu-west-1b"
}

# Public
resource "aws_subnet" "subnet3" {
    vpc_id = "${aws_vpc.vpc1.id}"
    cidr_block = "10.0.0.128/26"
    availability_zone = "eu-west-1a"
}

resource "aws_subnet" "subnet4" {
    vpc_id = "${aws_vpc.vpc1.id}"
    cidr_block = "10.0.0.192/26"
    availability_zone = "eu-west-1b"
}
