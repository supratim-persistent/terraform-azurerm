resource "azurerm_monitor_diagnostic_setting" "keyvault_diagnostic_setting" {

  name                        = "${var.service_settings.name}-keyvault-logs"
  target_resource_id          = azurerm_key_vault.keyvault.id
  log_analytics_workspace_id  = var.monitor_settings.workspace_id

  log {
    category = "AuditEvent"
    enabled  = true

    retention_policy {
      enabled = true
    }
  }

  metric {
    category = "AllMetrics"

    retention_policy {
      enabled = true
    }
  }
}
resource "azurerm_monitor_diagnostic_setting" "keyvault_log_setting" {

  name                        = "${var.service_settings.name}-keyvault-logs"
  target_resource_id          = azurerm_key_vault.keyvault.id
  storage_account_id          = var.monitor_settings.workspace_id

  log {
    category = "AuditEvent"
    enabled  = true

    retention_policy {
      enabled = true
      days = 0
    }
  }
}