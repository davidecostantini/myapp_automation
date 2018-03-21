###
### VPC
###
resource "aws_vpc" "vpc1" {
    cidr_block = "10.0.0.0/24"
    enable_dns_hostnames = true
    enable_dns_support = true

    tags {
        Description = "Main VPC"
    }
}