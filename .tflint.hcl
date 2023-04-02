plugin "azurerm" {
    enabled = true
    version = "0.21.0"
    source  = "github.com/terraform-linters/tflint-ruleset-azurerm"
}

rule "terraform_documented_variables" {
    enabled = true
}

rule "terraform_naming_convention" {
    enabled = true
}

rule "terraform_required_providers" {
    enabled = true
}

rule "terraform_typed_variables" {
    enabled = true
}

rule "terraform_unused_declarations" {
    enabled = false
}

rule "terraform_unused_required_providers" {
    enabled = true
}
 