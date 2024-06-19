provider "aws" {
  region = "us-west-2"
}

provider "kubernetes" {
  config_path = "~/.kube/config"
}

locals {
  db_sizes = {
    xsmall = "db.t2.micro"
    small  = "db.t2.small"
    large  = "db.m4.large"
    xlarge = "db.m4.xlarge"
    xxlarge = "db.m4.2xlarge"
  }
  
  environments = {
    dev = {
      dbs = [
        { size = local.db_sizes.small, name = "rdb", db_type = "mysql" },
        { size = local.db_sizes.small, name = "nsdb", db_type = "nosql" }
      ]
      instances = [
        { size = "t2.small", name = "wks" }
      ]
      k8s_clusters = [
        { size = "small", name = "kcls" }
      ]
    }
    staging = {
      dbs = [
        { size = local.db_sizes.large, name = "rdb", db_type = "mysql" },
        { size = local.db_sizes.large, name = "nsdb", db_type = "nosql" }
      ]
      instances = [
        { size = "t2.large", name = "wks" }
      ]
      k8s_clusters = [
        { size = "large", name = "kcls" }
      ]
    }
    integration = {
      dbs = [
        { size = local.db_sizes.xlarge, name = "rdb", db_type = "mysql" }
      ]
      instances = [
        { size = "t2.large", name = "wks" }
      ]
      k8s_clusters = [
        { size = "large", name = "kcls" }
      ]
    }
    performance = {
      dbs = [
        { size = local.db_sizes.xxlarge, name = "rdb", db_type = "mysql" }
      ]
      instances = [
        { size = "t2.xlarge", name = "wks" }
      ]
      k8s_clusters = [
        { size = "xlarge", name = "kcls" }
      ]
    }
    prod = {
      dbs = [
        { size = local.db_sizes.xlarge, name = "rdb", db_type = "mysql" },
        { size = local.db_sizes.xlarge, name = "nsdb", db_type = "nosql" },
        { size = local.db_sizes.xlarge, name = "rdb-replica", db_type = "mysql" },
        { size = local.db_sizes.xlarge, name = "nsdb-replica", db_type = "nosql" }
      ]
      instances = [
        { size = "t2.xlarge", name = "wks" }
      ]
      k8s_clusters = [
        { size = "xlarge", name = "kcls" }
      ]
    }
    natasha = {
      dbs = [
        { size = local.db_sizes.small, name = "rdb", db_type = "mysql" },
        { size = local.db_sizes.small, name = "nsdb", db_type = "nosql" }
      ]
      instances = [
        { size = "t2.xsmall", name = "wks" }
      ]
      k8s_clusters = [
        { size = "small", name = "kcls" }
      ]
    }
    clint = {
      dbs = [
        { size = local.db_sizes.small, name = "rdb", db_type = "mysql" },
        { size = local.db_sizes.small, name = "nsdb", db_type = "nosql" }
      ]
      instances = [
        { size = "t2.xsmall", name = "wks" }
      ]
      k8s_clusters = [
        { size = "small", name = "kcls" }
      ]
    }
  }
}

module "dbs" {
  for_each = local.environments
  source   = "./modules/db"
  
  db_specs = each.value.dbs
}

module "instances" {
  for_each = local.environments
  source   = "./modules/instance"
  
  instance_specs = each.value.instances
}

module "k8s_clusters" {
  source = "./modules/k8s_cluster"

  for_each    = var.environments
  k8s_specs   = each.value.k8s_clusters
  containers  = each.value.containers
}

