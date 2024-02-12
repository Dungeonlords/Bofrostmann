param namePrefix string
param location string = resourceGroup().location
param sku string = 'B1'
resource appServicePlan 'Microsoft.Web/serverfarms@2023-01-01' = {
  name: '${namePrefix}-website'
  location: location
  kind: 'linux'
  sku: {
    name: sku
  }

  properties: {
    reserved: true
  }
}
output planId string = appServicePlan.id
