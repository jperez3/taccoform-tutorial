resource "digitalocean_droplet" "web1" {
  image  = "ubuntu-18-04-x64"
  name   = "web1-import"
  region = "sfo2"
  size   = "s-1vcpu-1gb"
}
