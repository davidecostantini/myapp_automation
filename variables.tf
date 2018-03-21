variable "region" {
  default = "eu-west-1"
}

variable "availability_zones" {
  default = "eu-west-1a,eu-west-1b,eu-west-1c"
}

variable "amis" {
  default = {
    eu-west-1 = "ami-bfb5fec6"
  }
}

variable "myapp1_image" {
  default = "mikyrospetto/condenast:latest"
}