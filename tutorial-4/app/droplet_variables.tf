variable "droplet_count" {
  description = "the number of droplets to provision"
  default     = 2
}

variable "droplet_image" {
  description = "the base image/OS to use for provisioning the droplet"
  default     = "ubuntu-20-04-x64"
}

variable "droplet_node_type" {
  description = "the node/droplet/vm type"
  default     = "web"
}

variable "droplet_size" {
  description = "digital ocean provided droplet size"
  default     = "s-1vcpu-1gb"
}
