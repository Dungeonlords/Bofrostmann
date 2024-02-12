param location string = 'westeurope'
param storageName string = 'spacetestapp'
param namePrefix string = 'jonas'
param dockerImage string  ='nginx'
param dockerImageTag string = 'latest'

targetScope = 'resourceGroup'

module storage 'storage.bicep' = {
  name: storageName
  params: {
    storageName: storageName
    location: location
  }
}

module appPlanDeploy 'servicePlan.bicep' = {
  name: '${namePrefix}-appPlanDeploy'
  params: {
    namePrefix: namePrefix
    location: location
  }
}

module deployWebsite 'webApp.bicep' = {
  name: '${namePrefix}-deploy-website'
  params: {
    appPlanId:appPlanDeploy.outputs.planId
    location: location
    namePrefix: namePrefix
    dockerImage: dockerImage
    dockerImageTag: dockerImageTag
  }
}
