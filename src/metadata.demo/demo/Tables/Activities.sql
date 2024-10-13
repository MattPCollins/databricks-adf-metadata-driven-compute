CREATE TABLE [demo].[Activities](
	[ActivityId] [int] IDENTITY(1,1) NOT NULL,
	[ComputeConnectionId] [int] NOT NULL,
	[ActivityDisplayName] [nvarchar](50) NOT NULL,
	[NotebookPath] [nvarchar](200) NOT NULL,
	[Enabled] [bit] NOT NULL
	
PRIMARY KEY CLUSTERED 
(
	[ActivityId] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE[demo].[Activities]  WITH CHECK ADD FOREIGN KEY([ComputeConnectionId])
REFERENCES [demo].[ComputeConnections] ([ComputeConnectionId])
GO