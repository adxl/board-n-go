terraform {
  required_providers {
    digitalocean = {
      source  = "digitalocean/digitalocean"
      version = "~> 2.0"
    }
  }
}

variable "do_token" {}
variable "region" {}
variable "image" {}
variable "size" {}

provider "digitalocean" {
  token = var.do_token
}

resource "digitalocean_ssh_key" "default" {
  name       = "adxl@femto"
  public_key = file("~/.ssh/digital-ocean/id_rsa.pub")
}

resource "digitalocean_droplet" "bng-node" {
  count         = 3
  name          = count.index == 0 ? "bng-node-master" : "bng-node-${count.index}"
  image         = var.image
  region        = var.region
  size          = var.size
  monitoring    = true
  droplet_agent = true
  user_data     = file("./setup/docker.sh")

  ssh_keys      = [digitalocean_ssh_key.default.fingerprint]

  /* connection { */
  /*  type        = "ssh" */
  /*  user        = "root" */
  /*  private_key = file("~/.ssh/digital-ocean/id_rsa") */
  /*  host        = self.ipv4_address */
  /*  } */

  /* provisioner "remote-exec" { */
  /*   script = "./setup/docker.sh" */
  /* } */
}

resource "digitalocean_domain" "bng-domain" {
  name       = "drivequeen.eu"
}

resource "digitalocean_record" "api-record" {
  domain      = digitalocean_domain.bng-domain.id
  type        = "A"
  name        = "api"
  value       = digitalocean_droplet.bng-node[0].ipv4_address
}
