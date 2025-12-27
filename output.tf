output "Resource_Group_ID" {
  value = {
    for k, v in module.RG.Resource_Group : k => v.id
  }
}

output "Storage_Account_ID" {
  value = {
    for k, v in module.SA.Storage_Account : k => v.id
  }
}

output "Virtual_Network_ID" {
  value = {
    for k, v in module.VNET.Virtual_Network : k => v.id
  }
}

output "Sub_Network_ID" {
  value = {
    for k, v in module.VNET.Sub_Network : k => v.id
  }
}

output "Web_App_ID" {
  value = {
    for k, v in module.WEB.Web_App : k => v.id
  }
}

output "APP_Service_ID" {
  value = {
    for k, v in module.WEB.APP_Service : k => v.id
  }
}

output "AKS_Cluster_ID" {
  value = {
    for k, v in module.AKS.AKS_Cluster : k => v.id
  }
}

output "DB_Server_ID" {
  value = {
    for k, v in module.DB.DB_Server : k => v.id
  }
}

output "Data_Base_ID" {
  value = {
    for k, v in module.DB.Data_Base : k => v.id
  }
}

output "Public_IP_ID" {
  value = {
    for k, v in module.PIP.Public_IP : k => v.id
  }
}

# output "Application_Gatewau_ID" {
#   value = {
#     for k, v in module.AGW.Application_Gateway : k => v.id
#   }
# }