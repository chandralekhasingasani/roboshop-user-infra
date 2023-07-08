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

module "documentdb" {
  depends_on             = [module.vpc]
  source = "git::https://github.com/chandralekhasingasani/tf-module-redis.git"
  COMPONENT = var.COMPONENT
  ENV = var.ENV
  SKIP_FINAL_SNAPSHOT = var.SKIP_FINAL_SNAPSHOT
  ENGINE = var.ENGINE
  SUBNET_IDS = module.vpc.SUBNET_IDS
  VPC_ID = module.vpc.VPC_ID
  CIDR_BLOCK = module.vpc.VPC_CIDR
  AZ = var.AZ
  ENGINE              = var.DOCDB_ENGINE
  ENGINE_VERSION      = var.DOCDB_ENGINE_VERSION
  NODE_TYPE           = var.DOCDB_INSTANCE_CLASS
  NODE_COUNT          = var.DOCDB_NODE_COUNT
  FAMILY              = var.DOCDB_FAMILY
  SKIP_FINAL_SNAPSHOT = var.DOCDB_SKIP_FINAL_SNAPSHOT
  WORKSTATION_IP      = var.WORKSTATION_IP
}

module "app"{
  source                 = "git::https://github.com/chandralekhasingasani/tf-module-mutable.git"
  ENV                    = var.ENV
  COMPONENT              = var.COMPONENT
  VPC_ID                 = module.vpc.VPC_ID
  SUBNET_IDS             = module.vpc.SUBNET_IDS
  CIDR_BLOCK             = module.vpc.VPC_CIDR
  INSTANCE_TYPE          = var.INSTANCE_TYPE
  SPOT_INSTANCE_COUNT    = var.SPOT_INSTANCE_COUNT
  INSTANCE_COUNT         = var.INSTANCE_COUNT
  WORKSTATION_IP         = var.WORKSTATION_IP
  PORT                   = var.PORT
  IAM_INSTANCE_PROFILE   = var.IAM_INSTANCE_PROFILE
}



