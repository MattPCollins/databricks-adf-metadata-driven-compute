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
('SmallInteractiveCluster','adb-xxxxx.azuredatabricks.net','abc-def-ghi','D','scala12',1,'workspace resource name', 'Demo_LS_Databricks_InteractiveCluster','demo-rg-uks01','sid-123-456-789',1),
('MediumInteractiveCluster','adb-xxxxx.azuredatabricks.net','abc-def-ghi','D','scala12',1,'workspace resource name', 'Demo_LS_Databricks_InteractiveCluster','demo-rg-uks01','sid-123-456-789',1),
('BigInteractiveCluster','adb-xxxxx.azuredatabricks.net','abc-def-ghi','D','scala12',1,'workspace resource name', 'Demo_LS_Databricks_InteractiveCluster','demo-rg-uks01','sid-123-456-789',1),
('SmallJobCluster','adb-xxxxx.azuredatabricks.net','abc-def-ghi','D','scala12',1,'workspace resource name', 'Demo_LS_Databricks_JobCluster','demo-rg-uks01','sid-123-456-789',1),
('MediumJobCluster','adb-xxxxx.azuredatabricks.net','abc-def-ghi','D','scala12',1,'workspace resource name', 'Demo_LS_Databricks_JobCluster','demo-rg-uks01','sid-123-456-789',1),
('BigJobCluster','adb-xxxxx.azuredatabricks.net','abc-def-ghi','D','scala12',1,'workspace resource name', 'Demo_LS_Databricks_JobCluster','demo-rg-uks01','sid-123-456-789',1);
