variable "CIDR_BLOCK" {}
variable "SUBNET_CIDR_BLOCK" {}
variable "COMPONENT" {}
variable "ENV" {}
variable "AZ" {}
variable "PROJECT_NAME" {}
variable "ENGINE" {}
variable "NODE_TYPE" {}
variable "NUM_CACHE_NODES" {}
variable "ENGINE_VERSION" {}
variable "FAMILY" {}
variable "PORT" {}
variable "NODE_COUNT" {}
variable "SPOT_INSTANCE_COUNT" {}
variable "INSTANCE_COUNT" {}
variable "INSTANCE_TYPE" {}
variable "WORKSTATION_IP" {}
variable "IAM_INSTANCE_PROFILE" {}
variable "DOCDB_ENGINE" {}
variable "DOCDB_ENGINE_VERSION" {}
variable "DOCDB_INSTANCE_CLASS" {}
variable "DOCDB_NODE_COUNT" {}
variable "DOCDB_FAMILY" {}
variable "DOCDB_SKIP_FINAL_SNAPSHOT" {}
variable "IS_ALB_INTERNAL" {
  default = true
}
variable "FRONT_END_CIDR" {}
variable "DBTYPE" {
}
variable "PROMETHEUS_IP" {
  default = "172.31.90.202/32"
}