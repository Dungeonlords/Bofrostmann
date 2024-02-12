param location string = 'westeurope'
param storageName string = 'ga-storage'


resource storageaccount 'Microsoft.Storage/storageAccounts@2023-01-01' = {
  name: storageName
  location: location
  kind: 'StorageV2'
  sku: {
    name: 'Premium_LRS'
  }
}
