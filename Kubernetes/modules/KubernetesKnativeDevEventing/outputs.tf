output "id" {
  description = "The id of the resource."
  value       = data.k8s_operator_knative_dev_knative_eventing_v1beta1_manifest.knative_eventing.id
}