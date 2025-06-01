output "barnone_service_url" {
  description = "API backend URL"
  value       = azurerm_linux_web_app.barnone_web_app.default_hostname
}