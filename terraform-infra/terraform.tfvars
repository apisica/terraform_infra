environments = {
  dev = {
    dbs = [
      { size = "small", name = "rdb", db_type = "mysql" },
      { size = "small", name = "nsdb", db_type = "nosql" }
    ]
    instances = [
      { size = "t2.small", name = "wks" }
    ]
    k8s_clusters = [
      { size = "small", name = "kcls" }
    ]
    containers = [
      { name = "svc1", image = "nginx", mem = "512Mi" },
      { name = "svc2", image = "redis", mem = "512Mi" }
    ]
  }
  natasha = {
    dbs = [
      { size = "small", name = "rdb", db_type = "mysql" },
      { size = "small", name = "nsdb", db_type = "nosql" }
    ]
    instances = [
      { size = "t2.xsmall", name = "wks" }
    ]
    k8s_clusters = [
      { size = "small", name = "kcls" }
    ]
    containers = [
      { name = "svc1", image = "nginx", mem = "512Mi" },
      { name = "svc2", image = "redis", mem = "512Mi" }
    ]
  }
  clint = {
    dbs = [
      { size = "small", name = "rdb", db_type = "mysql" },
      { size = "small", name = "nsdb", db_type = "nosql" }
    ]
    instances = [
      { size = "t2.xsmall", name = "wks" }
    ]
    k8s_clusters = [
      { size = "small", name = "kcls" }
    ]
    containers = [
      { name = "svc1", image = "nginx", mem = "512Mi" },
      { name = "svc2", image = "redis", mem = "512Mi" }
    ]
  }
  staging = {
    dbs = [
      { size = "large", name = "rdb", db_type = "mysql" },
      { size = "large", name = "nsdb", db_type = "nosql" }
    ]
    instances = [
      { size = "t2.large", name = "wks" }
    ]
    k8s_clusters = [
      { size = "large", name = "kcls" }
    ]
    containers = [
      { name = "svc1", image = "nginx", mem = "512Mi" },
      { name = "svc2", image = "redis", mem = "512Mi" }
    ]
  }
  integration = {
    dbs = [
      { size = "xlarge", name = "rdb", db_type = "mysql" }
    ]
    instances = [
      { size = "t2.large", name = "wks" }
    ]
    k8s_clusters = [
      { size = "large", name = "kcls" }
    ]
    containers = [
      { name = "svc1", image = "nginx", mem = "512Mi" },
      { name = "svc2", image = "redis", mem = "512Mi" }
    ]
  }
  performance = {
    dbs = [
      { size = "xxlarge", name = "rdb", db_type = "mysql" }
    ]
    instances = [
      { size = "t2.xlarge", name = "wks" }
    ]
    k8s_clusters = [
      { size = "xlarge", name = "kcls" }
    ]
    containers = [
      { name = "svc1", image = "nginx", mem = "2048Mi" },
      { name = "svc2", image = "redis", mem = "4096Mi" }
    ]
  }
  prod = {
    dbs = [
      { size = "xlarge", name = "rdb", db_type = "mysql" },
      { size = "xlarge", name = "nsdb", db_type = "nosql" },
      { size = "xlarge", name = "rdb-replica", db_type = "mysql" },
      { size = "xlarge", name = "nsdb-replica", db_type = "nosql" }
    ]
    instances = [
      { size = "t2.xlarge", name = "wks" }
    ]
    k8s_clusters = [
      { size = "xlarge", name = "kcls" }
    ]
    containers = [
      { name = "svc1", image = "nginx", mem = "2048Mi" },
      { name = "svc2", image = "redis", mem = "4096Mi" }
    ]
  }
}
