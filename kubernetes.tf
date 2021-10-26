data "digitalocean_kubernetes_versions" "kubernetes-version" {
  version_prefix = "1.21."
}

data "digitalocean_sizes" "small" {
  filter {
    key    = "slug"
    values = ["s-2vcpu-2gb"]
  }
}

