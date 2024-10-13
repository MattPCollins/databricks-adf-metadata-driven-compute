param location string = resourceGroup().location

param namePrefix string 
param nameSuffix string 
param nameFactory string

var name = '${namePrefix}${nameFactory}${nameSuffix}'

resource dataFactory 'Microsoft.DataFactory/factories@2018-06-01' = {
  name: name
  location: location
  identity: {
    type: 'SystemAssigned'
  }
  properties: {
    globalParameters: {
      envName: {
        type: 'String'
        value: 'Dev'
      }
    }
  }
}

output location string = location
output name string = dataFactory.name
output resourceGroupName string = resourceGroup().name
output resourceId string = dataFactory.id
