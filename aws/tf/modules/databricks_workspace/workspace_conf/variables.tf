variable "store_notebook_results_in_customer_account" {
  description = "Store interactive notebook results in the customer account instead of the Databricks control plane."
  type        = bool
}

variable "enable_tokens" {
  description = "Allow users to create personal access tokens."
  type        = bool
}

variable "max_token_lifetime_days" {
  description = "Maximum lifetime in days for new personal access tokens. Null leaves the workspace default."
  type        = number
  nullable    = true
}
