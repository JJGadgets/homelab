terraform {
  required_providers {
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "~> 3.9.0"
    }
    random     = {
      version = "~> 3.1.0"
    }
  }
}

provider "cloudflare" {
  email   = var.cloudflare_email
}
