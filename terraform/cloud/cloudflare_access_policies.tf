resource "cloudflare_access_policy" "token" {
  for_each = {for app in local.apps_casa : app.subdomain => app}

  zone_id        = var.zone_id
  application_id = cloudflare_access_application.app_casa[each.value.subdomain].id

  name       = "allow any service token"
  precedence = "90"
  decision   = "non_identity"

  include {
    service_token = [cloudflare_access_service_token.token[each.value.subdomain].id]
  }
}

resource "cloudflare_access_policy" "gsuite_casa" {
  for_each = {for app in local.apps_casa : app.subdomain => app}

  zone_id        = var.zone_id_casa
  application_id = cloudflare_access_application.app_casa[each.value.subdomain].id

  name       = "allow ${var.email_domain}"
  precedence = "100"
  decision   = "allow"

  dynamic "include" {
    for_each = each.value.gsuite == true ? [1] : []
    content {
      group = ["7f34af6d-a6d2-4f8e-bbde-044d8e0bedaa"] # admins group
    }
  }
}

resource "cloudflare_access_policy" "everyone_calibre-web" {
  zone_id        = var.zone_id_casa
  application_id = cloudflare_access_application.app_casa["calibre-web"].id

  name       = "allow group with pin"
  precedence = "20"
  decision   = "allow"

  include {
    group = ["bbe2db0c-ab33-459b-b6e5-adaa2dc4f7be"] # fam
  }
}
#
#resource "cloudflare_access_policy" "everyone_requests" {
#  zone_id        = var.zone_id_casa
#  application_id = cloudflare_access_application.app_casa["requests"].id
#
#  name       = "allow group with pin"
#  precedence = "20"
#  decision   = "allow"
#
#  include {
#    group = ["546e1fbc-2441-4852-83a0-a664c45cff3d"] # everyone
#  }
#}

resource "cloudflare_access_policy" "everyone_calibre-web_secondary" {
  zone_id        = var.zone_id
  application_id = cloudflare_access_application.app_secondary["calibre-web"].id

  name       = "allow group with pin"
  precedence = "20"
  decision   = "allow"

  include {
    group = ["546e1fbc-2441-4852-83a0-a664c45cff3d"] # everyone
  }
}

#resource "cloudflare_access_policy" "everyone_requests_secondary" {
#  zone_id        = var.zone_id
#  application_id = cloudflare_access_application.app_secondary["requests"].id
#
#  name       = "allow group with pin"
#  precedence = "20"
#  decision   = "allow"
#
#  include {
#    group = ["546e1fbc-2441-4852-83a0-a664c45cff3d"] # everyone
#  }
#}

resource "cloudflare_access_policy" "public_kobo" {
  zone_id        = var.zone_id_casa
  application_id = cloudflare_access_application.kobo.id

  name       = "make public"
  precedence = "10"
  decision   = "bypass"

  include {
    everyone = true
  }
}

resource "cloudflare_access_policy" "public_plex" {
  zone_id        = var.zone_id_casa
  application_id = cloudflare_access_application.plex.id

  name       = "make plex public"
  precedence = "11"
  decision   = "bypass"

  include {
    everyone = true
  }
}
