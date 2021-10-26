resource "digitalocean_database_cluster" "laravel-in-kubernetes-redis" {
  name = "laravel-in-kubernetes-redis"
  engine = "redis"
  version = "6"
  size = "db-s-1vcpu-1gb"
  region = var.do_region
  node_count = 1
}

# We want to allow access to the database from our Kubernetes cluster
# We can also add custom IP addresses
# If you would like to connect from your local machine,
# simply add your public IP
resource "digitalocean_database_firewall" "laravel-in-kubernetes-redis" {
  cluster_id = digitalocean_database_cluster.laravel-in-kubernetes-redis.id

  rule {
    type  = "k8s"
    value = digitalocean_kubernetes_cluster.laravel-in-kubernetes.id
  }

  #   rule {
  #     type  = "ip_addr"
  #     value = "ADD_YOUR_PUBLIC_IP_HERE_IF_NECESSARY"
  #   }
}

output "laravel-in-kubernetes-redis-host" {
  value = digitalocean_database_cluster.laravel-in-kubernetes-redis.host
}

output "laravel-in-kubernetes-redis-port" {
  value = digitalocean_database_cluster.laravel-in-kubernetes-redis.port
}