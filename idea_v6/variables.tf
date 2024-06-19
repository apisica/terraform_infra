variable "environments" {
  type = map(object({
    dbs = list(object({
      size    = string
      name    = string
      db_type = string
    }))
    instances = list(object({
      size = string
      name = string
    }))
    k8s_clusters = list(object({
      size = string
      name = string
    }))
    containers = list(object({
      name  = string
      image = string
      mem   = string
    }))
  }))
}
