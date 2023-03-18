vpc_cidr_block = {cidr_block = "172.20.0.0/16", name = "alt3-vpc"}
subnet_cidr_blocks = {
  subnet_01 = {
    cidr = "172.20.1.0/24"
    az = "eu-west-2a"
  }
  subnet_02 = {
    cidr = "172.20.2.0/24"
    az = "eu-west-2b"
  }
  subnet_03 = {
    cidr = "172.20.3.0/24"
    az = "eu-west-2c"
  }
  subnet_03 = {
    cidr = "172.20.4.0/24"
    az = "eu-west-2a"
  }
}
availability_zone   = "eu-west-2a"
env                 = "dev"
instance_type       = "t2.small"