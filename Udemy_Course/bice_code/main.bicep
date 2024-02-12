param location string = resourceGroup().location
param storageName string = 'space${uniqueString(resourceGroup().id)}'

resource storageaccount 'Microsoft.Storage/storageAccounts@2021-02-01' = {
  name: 'spacelaunchtester'
  location: location
  kind: 'StorageV2'
  sku: {
    name: 'Premium_LRS'
  }
  properties: {
    accessTier: 'Hot'
  }
}
resource appServicePlan 'Microsoft.Web/serverfarms@2023-01-01' = {
  name: 'xyz${storageName}'
  location: location
  sku: {
    name: 'F1'
  }
}

resource webApplication 'Microsoft.Web/sites@2023-01-01' = {
  name: 'zed${storageName}'
  location: location
  tags: {
    'hidden-related:${resourceGroup().id}/providers/Microsoft.Web/serverfarms/appServicePlan': 'Resource'
  }
  properties: {
    serverFarmId: appServicePlan.id
    httpsOnly: true
  }
}


// Data Types
// Arrays, bool, int, object, string

var nameArray = [
  'Andrew'
  'James'
  3
  0
]
var isTime = true

var person = {
  name: 'jay'
  lastname: 'Rite'
  age: 34
  isMarried: false
  educations: {
    college: 'uw'
    year: 1987
  }
}
output result string = nameArray[0]
output result1 string = person.educations.college
