terraform {
  required_providers {
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "~> 3.35.0"
    }
    random     = {
      version = "~> 3.4.0"
    }
  }
}

provider "cloudflare" {}
