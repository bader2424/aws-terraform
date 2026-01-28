output "architecture_summary" {
  value = {
    vpc              = module.vpc.vpc_id
    public_subnets   = module.vpc.public_subnet_ids
    private_subnets  = module.vpc.private_subnet_ids
    ec2_instance     = module.ec2.instance_id
    alb_dns          = module.alb.alb_dns_name
    s3_bucket        = module.s3.bucket_name
    rds_instance     = module.rds.db_instance_id
    iam_user         = module.iam.user_name
  }
}
