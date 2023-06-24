module "vpc"{
  source              ="git::https://github.com/chandralekhasingasani/tf-module-vpc.git"
  CIDR_BLOCK          = var.CIDR_BLOCK
  AZ                  = var.AZ
  ENV                 = var.ENV
  SUBNET_CIDR_BLOCK   = var.SUBNET_CIDR_BLOCK
  COMPONENT           = var.COMPONENT
}

module "elasticcache"{
  depends_on             = [module.vpc]
  source                 ="git::https://github.com/chandralekhasingasani/tf-module-redis.git"
  ENV                    = var.ENV
  COMPONENT              = var.COMPONENT
  VPC_ID                 = module.vpc.VPC_ID
  SUBNET_IDS             = module.vpc.SUBNET_IDS
  CIDR_BLOCK             = module.vpc.VPC_CIDR
  ENGINE                 = var.ENGINE
  NODE_TYPE              = var.NODE_TYPE
  NUM_CACHE_NODES        = var.NUM_CACHE_NODES
  ENGINE_VERSION         = var.ENGINE_VERSION
  FAMILY                 = var.FAMILY
  PORT                   = var.PORT
}


