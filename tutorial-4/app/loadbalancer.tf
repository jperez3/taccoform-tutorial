resource "digitalocean_loadbalancer" "public" {
  name   = "pub-lb-${var.service}-${var.env}"
  region = var.region

  forwarding_rule {
    entry_port     = var.lb_fr_entry_port_http
    entry_protocol = var.lb_fr_entry_protocol_http

    target_port     = var.lb_fr_target_port_http
    target_protocol = var.lb_fr_target_protocol_http
  }

  healthcheck {
    path     = var.lb_hc_path
    port     = var.lb_fr_target_port_http
    protocol = var.lb_fr_target_protocol_http
  }

  droplet_ids = digitalocean_droplet.web.*.id
}


output "lb-pub-ip" {
  value = digitalocean_loadbalancer.public.ip
}
