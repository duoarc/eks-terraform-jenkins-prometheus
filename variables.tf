variable "vpc_cidr_block" {}
variable "subnet_cidr_blocks" {
  description = "cidr, availability zone and name tag for the subnets"
  type = map(object({
    cidr = string
    az = string
  }))
}
variable "availability_zone" {}
variable "env" {}
variable "instance_type" {}

domain_names = {domain_name = "mabdulrahman.cloud", subdomain_name = "terraform-test.mabdulrahman.cloud"}