resource "azuread_application" "aad_app" {
  name                        = var.name
  homepage                    = var.homepage
  identifier_uris             = var.identifier_uris
  reply_urls                  = var.reply_urls
  available_to_other_tenants  = var.available_to_other_tenants
  oauth2_allow_implicit_flow  = var.allow_implicit_flow
  group_membership_claims     = "SecurityGroup"

  dynamic "required_resource_access" {
    for_each = var.required_resources 
    content {
        # This need to be a Variable, this var is for dev
        resource_app_id = required_resource_access.app_id
        #"a896716e-5acd-4475-a643-abc724df0c92"
        
        resource_access {
          id   = required_resource_access.resource_id  #"./api://erx-dev-webapi/user_impersonation"
          type = required_resource_access.resource_type # "Scope"
        }
    }
  }

}

resource "random_password" "aad_app" {
  length                = 16
  special               = true
  override_special      = "_%@"
}

resource "azuread_application_password" "aad_app" {
  application_object_id = azuread_application.aad_app.object_id
  value                 = random_password.aad_app.result
  end_date              = "2021-01-01T01:02:03Z"
}