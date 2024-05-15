output "status" {
  description = "Status is the current state of the Ingress."
  value       = kubernetes_ingress_v1.ingress_v1.status
}

output "load_balancer" {
  description = "LoadBalancer contains the current status of the load-balancer, if one is present."
  value       = kubernetes_ingress_v1.ingress_v1.load_balancer
}

output "ingress" {
  description = "Ingress is a list containing ingress points for the load-balancer."
  value       = kubernetes_ingress_v1.ingress_v1.ingress
}

output "load_balancer_ip" {
  description = "IP is set for load-balancer ingress points that are IP based (typically GCE or OpenStack load-balancers)."
  value       = kubernetes_ingress_v1.ingress_v1.status.0.load_balancer.0.ingress.0.ip
}

output "load_balancer_hostname" {
  description = "Hostname is set for load-balancer ingress points that are DNS based (typically AWS load-balancers)."
  value       = kubernetes_ingress_v1.ingress_v1.status.0.load_balancer.0.ingress.0.hostname
}