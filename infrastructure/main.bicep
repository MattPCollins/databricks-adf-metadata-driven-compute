targetScope = 'subscription'

param location string = 'uksouth'
param envName string = 'dev'
param domainName string = 'metadata'
param orgName string = 'demo'
param uniqueIdentifier string = '01'

@secure()
param adminName string
@secure()
param adminSid string

param useFirewall bool
@secure()
param startIP string
@secure()
param endIP string

param deploymentTimestamp string = utcNow('yy-MM-dd-HHmm')

var locationShortCodes = {
  uksouth: 'uks'
  ukwest: 'ukw'
  eastus: 'eus'
}

var locationShortCode = locationShortCodes[location]

var namePrefix = '${domainName}${orgName}${envName}'
var nameSuffix = '${locationShortCode}${uniqueIdentifier}'
var rgName = '${namePrefix}rg${nameSuffix}'

resource rg 'Microsoft.Resources/resourceGroups@2024-03-01' = {
  name: rgName
  location: location
}

module dataFactoryDeploy 'modules/datafactory.template.bicep' = {
  scope: rg
  name: 'datafactory${deploymentTimestamp}'
  params:{
    nameFactory: 'factory'
    namePrefix: namePrefix
    nameSuffix: nameSuffix
  }
}

module databricksWorkspaceDeploy 'modules/databricks.template.bicep' = {
  scope: rg
  name: 'databricks${deploymentTimestamp}'
  params: {
    namePrefix: namePrefix
    nameSuffix: nameSuffix
    skuTier: 'standard'
  }
}

module sqlServerDeploy 'modules/sqlserver.template.bicep' = {
  scope: rg
  name: 'sql-server${deploymentTimestamp}'
  params: {
    adminName: adminName
    adminSid: adminSid
    databaseName: 'metadata'
    namePrefix: namePrefix
    nameSuffix: nameSuffix
    useFirewall: useFirewall
    startIP: startIP
    endIP: endIP
    location: location
    }
}

module dataFactoryRoleAssignmentsDeploy 'modules/roleassignments/datafactory.template.bicep' = {
  scope: rg
  name: 'adf-orchestration-roleassignments${deploymentTimestamp}'
  params:{
    nameFactory: 'factory'
    namePrefix: namePrefix
    nameSuffix: nameSuffix
  }
  dependsOn: [
    dataFactoryDeploy
    sqlServerDeploy
    databricksWorkspaceDeploy
  ]
}
