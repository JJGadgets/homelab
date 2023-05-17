terraform {
  required_providers {
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "~> 4.6.0"
    }
    random     = {
      version = "~> 3.5.0"
    }
  }
}

provider "cloudflare" {}
