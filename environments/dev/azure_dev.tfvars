
subscription_id = "98473d5b-c639-404e-9bf2-91559fe65ff8"


rg = {
  dev_rg = {
    location = "eastus"
    tags = {
      "env"  = "dev"
      "app"  = "Auto_exit"
      "Tier" = "P3"
    }
  }
}

sa = {
  commonsafortf = {
    key                      = "dev_rg"
    account_tier             = "Standard"
    account_replication_type = "GRS"
  }
}

nets = {
  vnet = {
    dev-vnet = {
      rgkey         = "dev_rg"
      address_space = ["10.0.0.0/16"]
    }
  }
  subnet = {
    dev-agw-subnet = {
      rgkey            = "dev_rg"
      key              = "dev-vnet"
      address_prefixes = ["10.0.1.0/24"]
    }
    dev-app-subnet = {
      rgkey            = "dev_rg"
      key              = "dev-vnet"
      address_prefixes = ["10.0.2.0/24"]
    }
    dev-aks-subnet = {
      rgkey            = "dev_rg"
      key              = "dev-vnet"
      address_prefixes = ["10.0.3.0/24"]
    }
    dev-db-subnet = {
      rgkey            = "dev_rg"
      key              = "dev-vnet"
      address_prefixes = ["10.0.4.0/24"]
    }
  }
}

web = {
  appserviceplan = {
    dev-appservice = {
      rgkey    = "dev_rg"
      os_type  = "Linux"
      sku_name = "P1v2"
    }
  }
  app = {
    dev-web-app = {
      rgkey = "dev_rg"
      key   = "dev-appservice"
    }
  }
}

aks = {
  dev-aks = {
    rgkey      = "dev_rg"
    dns_prefix = "aks1"
    default_node_pool = {
      name       = "default"
      node_count = 1
      vm_size    = "Standard_D2_v2"
    }
    identity = "SystemAssigned"
  }
}

db = {
  server = {
    dev-db-server = {
      rgkey                        = "dev_rg"
      version                      = "12.0"
      administrator_login          = "db-server"
      administrator_login_password = "4-4dm1n157r470r-p455w0rd"
    }
  }
  sql = {
    dev-sql-db = {
      key          = "dev-db-server"
      collation    = "SQL_Latin1_General_CP1_CI_AS"
      license_type = "LicenseIncluded"
      max_size_gb  = 2
      sku_name     = "S0"
      rgkey        = "dev_rg"
    }
  }
}

pip = {
  dev-agw-pip = {
    rgkey             = "dev_rg"
    allocation_method = "Static"
  }
}

agw = {
  dev-app_gateway = {
    rgkey        = "dev_rg"
    sku_name  = "Standard_v2"
    sku_tier  = "Standard_v2"
    sku_capacity  = 2
    netkey  = "dev-agw-subnet"
    ipkey = "dev-agw-pip"
  }
}