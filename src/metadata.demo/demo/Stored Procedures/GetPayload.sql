CREATE PROCEDURE [demo].[GetPayload]
(
@ActivityId INT
)
AS
BEGIN
    SELECT 
        [a].[ActivityId] AS 'ActivityId',
        [a].[ActivityDisplayName] AS 'ActivityDisplayName',
        [a].[NotebookPath] AS 'NotebookPath',
        [cc].[ComputeWorkspaceURL] AS 'ComputeWorkspaceURL',
        [cc].[ComputeClusterId] AS 'ComputeClusterId',
        [cc].[ComputeSize] AS 'ComputeSize',
        [cc].[ComputeVersion] AS 'ComputeVersion',
        [cc].[CountNodes] AS 'CountNodes',
        [cc].[ComputeLinkedServiceName] AS 'ComputeLinkedServiceName',
        [cc].[ResourceName] AS 'ComputeResourceName',
        [cc].[ResourceGroupName] AS 'ResourceGroupName',
        [cc].[SubscriptionId] AS 'SubscriptionId'
    FROM 
        [demo].[Activities] AS a
    INNER JOIN 
        [demo].[ComputeConnections] AS cc
    ON 
        a.ComputeConnectionId = cc.ComputeConnectionId
    WHERE
        a.ActivityId = @ActivityId
    AND
        a.Enabled = 1
    AND 
        cc.Enabled = 1
END
GO

