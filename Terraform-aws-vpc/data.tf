data "aws_availability_zones" "available" {
  state = "available"
  # in provider file, we are already set the region
}

data "aws_vpc" "default" {
  default = true
}

data "aws_route_table" "main" {
  vpc_id = local.default_vpc_id
  filter {
    name = "association.main"
    values = ["true"]
  }
}