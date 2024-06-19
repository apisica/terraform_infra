variable "k8s_specs" {
  type = list(object({
    size = string
    name = string
  }))
}

variable "containers" {
  type = list(object({
    name  = string
    image = string
    mem   = string
  }))
}

resource "aws_eks_cluster" "k8s" {
  for_each = { for idx, k8s in var.k8s_specs : idx => k8s }

  name     = each.value.name
  role_arn = "arn:aws:iam::123456789012:role/eks-service-role"  # Replace with actual role ARN

  vpc_config {
    subnet_ids = ["subnet-0123456789abcdef0", "subnet-0123456789abcdef1"]  # Replace with actual subnet IDs
  }
}

resource "kubernetes_deployment" "container" {
  for_each = { for idx, container in var.containers : idx => container }

  metadata {
    name = each.value.name
  }

  spec {
    replicas = 1

    selector {
      match_labels = {
        app = each.value.name
      }
    }

    template {
      metadata {
        labels = {
          app = each.value.name
        }
      }

      spec {
        container {
          name  = each.value.name
          image = each.value.image

          resources {
            limits = {
              memory = each.value.mem
            }
            requests = {
              memory = each.value.mem
            }
          }
        }
      }
    }
  }
}

resource "kubernetes_service" "container" {
  for_each = { for idx, container in var.containers : idx => container }

  metadata {
    name = each.value.name
  }

  spec {
    selector = {
      app = each.value.name
    }

    port {
      port        = 80
      target_port = 80
    }
  }
}
