DECLARE @StorageOptimisedBigJobClusterId INT = 7

INSERT INTO [demo].[ComputeConnections](
	[ConnectionDisplayName],
	[ComputeWorkspaceURL],
	[ComputeClusterId],
	[ComputeSize],
	[ComputeVersion],
	[CountNodes],
	[ResourceName],
	[ComputeLinkedServiceName],
	[ResourceGroupName], 
	[SubscriptionId], 
	[Enabled]
)
VALUES 
('StorageOptimisedBigJobCluster','adb-xxxxx.azuredatabricks.net','NA','Standard_L8s_v3','15.4.x-scala2.12',2,'workspace resource name', 'LS_Databricks_JobCluster_Python3','demo-rg-uks01','sid-123-456-789',1);


UPDATE [demo].[Activities]
SET 
	[ComputeConnectionId] = @StorageOptimisedBigJobClusterId
WHERE
	ActivityDisplayName = 'Big Activity';