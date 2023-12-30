output "aks_cluster_name" {
  description = "Name of the AKS cluster."
  value       = azurerm_kubernetes_cluster.aks_cluster.name
}

output "aks_cluster_id" {
  description = "ID of the AKS cluster."
  value       = azurerm_kubernetes_cluster.aks_cluster.id
}

output "aks_kubeconfig" {
  description = "Kubeconfig file for accessing the AKS cluster. Used to interact with the cluster via kubectl."
  value       = azurerm_kubernetes_cluster.aks_cluster.kube_config_raw
}