param location string = resourceGroup().location

param namePrefix string 
param nameSuffix string 
param nameFactory string

var name = '${namePrefix}${nameFactory}${nameSuffix}'

resource dataFactory 'Microsoft.DataFactory/factories@2018-06-01' existing = {
  name: name
}

resource dataFactoryRoleAssignment 'Microsoft.Authorization/roleAssignments@2022-04-01' = if (nameFactory == 'factory') {
  name: guid(dataFactory.id, dataFactory.id, 'Contributor')
  scope: dataFactory
  properties: {
    roleDefinitionId: subscriptionResourceId('Microsoft.Authorization/roleDefinitions', '673868aa-7521-48a0-acc6-0f60742d39f5') // Data Factory Contributor role
    principalId: dataFactory.identity.principalId
  }
}

resource sqlServer 'Microsoft.Sql/servers@2023-05-01-preview' existing = {
  name: '${namePrefix}sqldb${nameSuffix}'
}

resource sqlRoleAssignment 'Microsoft.Authorization/roleAssignments@2022-04-01' = {
  name: guid(dataFactory.id, sqlServer.id, 'Reader')
  scope: sqlServer
  properties: {
    roleDefinitionId: subscriptionResourceId('Microsoft.Authorization/roleDefinitions', 'acdd72a7-3385-48ef-bd42-f606fba81ae7') // Reader role
    principalId: dataFactory.identity.principalId
  }
}

resource databricks 'Microsoft.Databricks/workspaces@2024-05-01' existing = {
  name: '${namePrefix}dbw${nameSuffix}'
}

resource databricksRoleAssignment 'Microsoft.Authorization/roleAssignments@2022-04-01' = {
  name: guid(dataFactory.id, databricks.id, 'Contributor')
  scope: databricks
  properties: {
    roleDefinitionId: subscriptionResourceId('Microsoft.Authorization/roleDefinitions', 'b24988ac-6180-42a0-ab88-20f7382dd24c') // Reader role
    principalId: dataFactory.identity.principalId
  }
}

output location string = location
output name string = dataFactory.name
output resourceGroupName string = resourceGroup().name
output resourceId string = dataFactory.id
