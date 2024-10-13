CREATE TABLE [demo].[ComputeConnections](
	[ComputeConnectionId] [int] IDENTITY(1,1) NOT NULL,
	[ConnectionDisplayName] [nvarchar](50) NOT NULL,
	[ComputeWorkspaceURL] [nvarchar](200) NULL,
	[ComputeClusterId] [nvarchar](200) NULL,
	[ComputeSize] [nvarchar](200) NOT NULL,
	[ComputeVersion] [nvarchar](100) NOT NULL,
	[CountNodes] int NOT NULL,
	[ResourceName] [nvarchar](100) NULL,
	[ComputeLinkedServiceName] [nvarchar](200) NOT NULL,
	[ResourceGroupName] [nvarchar](50) NOT NULL, 
	[SubscriptionId] [nvarchar](50) NOT NULL, 
	[Enabled] [bit] NOT NULL
PRIMARY KEY CLUSTERED 
(
	[ComputeConnectionId] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
