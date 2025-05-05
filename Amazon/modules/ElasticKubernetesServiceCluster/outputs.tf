output "arn" {
  description = "ARN of the cluster"
  value       = aws_eks_cluster.eks_cluster.arn
}

output "certificate_authority" {
  description = "Attribute block containing certificate-authority-data for your cluster."
  value       = aws_eks_cluster.eks_cluster.certificate_authority
}

output "cluster_id" {
  description = "The ID of your local Amazon EKS cluster on the AWS Outpost."
  value       = aws_eks_cluster.eks_cluster.cluster_id
}

output "created_at" {
  description = "Unix epoch timestamp in seconds for when the cluster was created."
  value       = aws_eks_cluster.eks_cluster.created_at
}

output "endpoint" {
  description = "Endpoint for your Kubernetes API server."
  value       = aws_eks_cluster.eks_cluster.endpoint
}

output "id" {
  description = "Name of the cluster."
  value       = aws_eks_cluster.eks_cluster.id
}

output "identity" {
  description = "Attribute block containing identity provider information for your cluster."
  value       = aws_eks_cluster.eks_cluster.identity
}

output "platform_version" {
  description = "Platform version for the cluster."
  value       = aws_eks_cluster.eks_cluster.platform_version
}

output "status" {
  description = "Status of the EKS cluster."
  value       = aws_eks_cluster.eks_cluster.status
}

output "tags_all" {
  description = "Map of tags assigned to the resource, including those inherited from the provider default_tags configuration block."
  value       = aws_eks_cluster.eks_cluster.tags_all
}
