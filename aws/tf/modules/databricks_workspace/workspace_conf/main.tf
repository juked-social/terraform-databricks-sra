# Terraform Documentation: https://registry.terraform.io/providers/databricks/databricks/latest/docs/resources/workspace_conf

locals {
  # maxTokenLifetimeDays is only sent when set, so a null value leaves the workspace default in place.
  token_lifetime_config = var.max_token_lifetime_days == null ? {} : {
    "maxTokenLifetimeDays" = tostring(var.max_token_lifetime_days)
  }
}

resource "databricks_workspace_conf" "this" {
  custom_config = merge({
    "storeInteractiveNotebookResultsInCustomerAccount" = tostring(var.store_notebook_results_in_customer_account), // https://docs.databricks.com/en/administration-guide/workspace-settings/notebooks.html#manage-where-notebook-results-are-stored
    "enableTokensConfig"                               = tostring(var.enable_tokens)                               // https://docs.databricks.com/en/admin/access-control/tokens.html
  }, local.token_lifetime_config)
}
