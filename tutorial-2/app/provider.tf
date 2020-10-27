
# This tells terraform which cloud provider (or other hosted service) to expect to interaface with and
# which version of terraform is required
terraform {
  required_providers {
    digitalocean = {
      source  = "digitalocean/digitalocean"
      version = "~> 1.22.2"
    }
  }
  required_version = ">= 0.13"
}

# This is how authentication to digital ocean is called
provider "digitalocean" {
  token = var.do_token
}