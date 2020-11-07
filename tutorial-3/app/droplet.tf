data "digitalocean_ssh_key" "root" { 
  name = "taccoform-tutorial"
}

# resource "digitalocean_droplet" "web" {
#   count = 2

#   image     = "ubuntu-20-04-x64"
#   name      = "web${count.index}-burrito-prod"
#   region    = "sfo2"
#   size      = "s-1vcpu-1gb"
#   ssh_keys  = [data.digitalocean_ssh_key.root.id]
#   user_data = templatefile("templates/user_data_nginx.yaml", { hostname = "web${count.index}-burrito-prod" })
# }

# output "droplet_public_ips" {
#   value = digitalocean_droplet.web.*.ipv4_address
# }


resource "digitalocean_droplet" "web" {
  for_each = {
        "web0" = "web0-burrito-prod"
        "web1" = "web1-burrito-prod"
    }

  image     = "ubuntu-20-04-x64"
  name      = each.value
  region    = "sfo2"
  size      = "s-1vcpu-1gb"
  ssh_keys  = [data.digitalocean_ssh_key.root.id]
  user_data = templatefile("templates/user_data_nginx.yaml", { hostname = each.value })
}

output "droplet_public_ips" {
  value       = { 
    for droplet in digitalocean_droplet.web:
    droplet.name => droplet.ipv4_address 
  }
}
