module "vpc" {
    #source = "../Terraform-aws-vpc"

    # referring git terraform module - we have to reconfigure after updating this
    # >terraform init -reconfigure
    # After doing this entire module code will come and sit inside the project folder
    # here, i have kept both module and project in same folder
    source = "git::https://github.com/DAWS-82S/terraform-aws-vpc.git?ref=main"
    project_name = var.project_name
    environment = var.environment
    vpc_cidr = var.vpc_cidr
    common_tags = var.common_tags
    vpc_tags = var.vpc_tags
    public_subnet_cidrs = var.public_subnet_cidrs
    private_subnet_cidrs = var.private_subnet_cidrs
    database_subnet_cidrs = var.database_subnet_cidrs
    is_peering_required = true

    # if some updates happened in the module, if you want that updates to your project
    # > terrafrom get-update - this will be download latest module code to your project
}