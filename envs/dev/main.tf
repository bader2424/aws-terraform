module "vpc" {
  source      = "../../modules/vpc"
  environment = "dev"
}

module "ec2" {
  source             = "../../modules/ec2"
  environment        = "dev"
  private_subnet_ids = module.vpc.private_subnet_ids
  vpc_id             = module.vpc.vpc_id
}

module "alb" {
  source              = "../../modules/alb"
  environment         = "dev"
  public_subnet_ids   = module.vpc.public_subnet_ids
  target_instance_ids = [module.ec2.instance_id]
  vpc_id              = module.vpc.vpc_id
}

module "iam" {
  source      = "../../modules/iam"
  environment = "dev"
}

module "rds" {
  source             = "../../modules/rds"
  private_subnet_ids = module.vpc.private_subnet_ids
  environment        = "dev"
}

module "s3" {
  source      = "../../modules/s3"
  environment = "dev"
}
