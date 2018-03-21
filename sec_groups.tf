###
### Sec Groups
###
resource "aws_security_group" "sc_all" {
    name = "sc_all"
    vpc_id = "${aws_vpc.vpc1.id}"

    tags {
        Name = "ALL OPEN"
    }

    ingress {
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }

    egress {
        from_port    = 0
        to_port      = 0
        protocol     = "-1"
        cidr_blocks  = ["0.0.0.0/0"]
    }
}

resource "aws_security_group" "sc_tcp_80" {
    name = "sc_tcp_80"
    vpc_id = "${aws_vpc.vpc1.id}"

    tags {
        Name = "TCP PORT 80 to ALL"
    }

    ingress {
        from_port   = 80
        to_port     = 80
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    egress {
        from_port    = 0
        to_port      = 0
        protocol     = "-1"
        cidr_blocks  = ["0.0.0.0/0"]
    }
}

