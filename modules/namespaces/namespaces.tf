resource "kubernetes_namespace" "namespace" {
  for_each = { for ns in var.namespaces : ns => ns }
  metadata {
    name = each.value
  }
}