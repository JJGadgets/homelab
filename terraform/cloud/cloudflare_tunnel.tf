resource "random_id" "secret-1" {
  byte_length = 40
}

resource "cloudflare_tunnel" "tunnel1" {
  name       = "cloudflaredtunnel1"
  account_id = var.cloudflare_account_id
  secret     = random_id.secret-1.b64_std
}

resource "random_id" "secret-2" {
  byte_length = 40
}

resource "cloudflare_tunnel" "tunnel2" {
  name       = "cloudflaredtunnel2"
  account_id = var.cloudflare_account_id
  secret     = random_id.secret-2.b64_std
}
