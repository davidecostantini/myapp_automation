variable "aws_region" { default = "eu-west-1" } # Ireland

provider "aws" {
    region = "${var.aws_region}"
}

