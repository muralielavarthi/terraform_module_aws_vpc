# VPC Module

**Inputs:**

- vpc_cidr(Mandatory): User must supply
- subnet_cidr(Mandatory): User must supply
- ami_id(Mandatory): User must supply
- instance_type(Mandatory): User must supply

**Outputs:**

- vpc_id: vpc_id will be displayed

**Resources Created:**

- 1 private subnet
- 1 public subnet
- 1 IGW
- 1 Elastic IP
- 1 NAT Gateway
- 1 EC2 in public and private subnet
- 1 Security group
