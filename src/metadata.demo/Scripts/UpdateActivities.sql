DECLARE @SmallJobClusterId INT = 4
DECLARE @MediumJobClusterId INT = 5
DECLARE @BigJobClusterId INT = 6

UPDATE [demo].[Activities]
SET 
	[ComputeConnectionId] = @SmallJobClusterId
WHERE
	ActivityDisplayName = 'Small Activity';

UPDATE [demo].[Activities]
SET 
	[ComputeConnectionId] = @MediumSmallJobClusterId
WHERE
	ActivityDisplayName = 'Medium Activity';

UPDATE [demo].[Activities]
SET 
	[ComputeConnectionId] = @BigJobClusterId
WHERE
	ActivityDisplayName = 'Big Activity';