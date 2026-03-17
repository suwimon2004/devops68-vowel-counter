terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
  }
}

provider "azurerm" {
  features {}
}

# 1. สร้าง Resource Group
resource "azurerm_resource_group" "quiz" {
  name     = "rg-vowel-counter-quiz"
  location = "Southeast Asia"
}

# 2. ตัวสุ่มเลขท้ายกันชื่อซ้ำ (สำคัญมากสำหรับ Azure)
resource "random_integer" "ri" {
  min = 11111
  max = 88888
}

# 3. App Service Plan (Free Tier F1)
resource "azurerm_service_plan" "plan" {
  name                = "sp-vowel-${random_integer.ri.result}"
  resource_group_name = azurerm_resource_group.quiz.name
  location            = azurerm_resource_group.quiz.location
  os_type             = "Linux"
  sku_name            = "F1"
}

# 4. Web App สำหรับรัน Node.js
resource "azurerm_linux_web_app" "webapp" {
  name                = "vowel-counter-${random_integer.ri.result}"
  resource_group_name = azurerm_resource_group.quiz.name
  location            = azurerm_resource_group.quiz.location
  service_plan_id     = azurerm_service_plan.plan.id

  site_config {
    always_on = false
    application_stack {
      node_version = "18-lts" 
    }
  }

  app_settings = {
    "WEBSITES_PORT" = "3012"  # ต้องตรงกับ Port ใน index.js ของอาจารย์
    "NODE_ENV"      = "production"
  }
}

# ส่วนแสดงผล URL หลังรันเสร็จ
output "webapp_url" {
  value = azurerm_linux_web_app.webapp.default_hostname
}