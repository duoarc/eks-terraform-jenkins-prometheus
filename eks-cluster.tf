# data "aws_subnets" "subnets" {
#   filter {
#     name   = "vpc-id"
#     values = [aws_vpc.alt3-vpc.id]
#   }
# }

# data "aws_subnet" "subnets_ids" {
#   for_each = toset(data.aws_subnets.subnets.ids)
#   id       = each.value
# }


module "eks" {
    source  = "terraform-aws-modules/eks/aws"
    version = "~> 19.0"
    cluster_name = "alt3-eks-cluster"
    cluster_version = "1.24"

    cluster_endpoint_public_access  = true

    vpc_id = aws_vpc.alt3-vpc.id
    subnet_ids = aws_subnet.subnets[*].id
    tags = {
        environment = "development"
        application = "alt3"
    }

    eks_managed_node_groups = {
        dev = {
            min_size = 1
            max_size = 4
            desired_size = 3

            instance_types = [var.instance_type]
        }
    }
}