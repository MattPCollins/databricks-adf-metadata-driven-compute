DECLARE @SmallInteractiveClusterId INT = 1
DECLARE @MediumInteractiveClusterId INT = 2
DECLARE @BigInteractiveClusterId INT = 3

INSERT INTO [demo].[Activities](
	[ComputeConnectionId],
	[ActivityDisplayName],
	[NotebookPath],
	[Enabled]
)
VALUES 
(@SmallInteractiveClusterId,'Small Activity','/Workspace/Users/matthew.collins@cloudformations.org/databricks-adf-metadata-driven-compute/src/azure.databricks/python/notebooks/demos/smallactivity',1),
(@MediumInteractiveClusterId,'Medium Activity','/Workspace/Users/matthew.collins@cloudformations.org/databricks-adf-metadata-driven-compute/src/azure.databricks/python/notebooks/demos/mediumactivity',1),
(@BigInteractiveClusterId,'Big Activity','/Workspace/Users/matthew.collins@cloudformations.org/databricks-adf-metadata-driven-compute/src/azure.databricks/python/notebooks/demos/bigactivity',1);
