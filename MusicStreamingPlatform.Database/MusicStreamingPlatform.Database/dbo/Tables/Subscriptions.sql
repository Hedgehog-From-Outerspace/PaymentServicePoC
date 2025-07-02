CREATE TABLE [dbo].[Subscriptions](
	[Id] [uniqueidentifier] NOT NULL,
	[Plan] [int] NOT NULL,
	[MonthlyPrice] [decimal](18, 2) NOT NULL,
	[MonthlyTokens] [int] NOT NULL,
	[StartDate] [datetime2](7) NOT NULL,
	[UserId] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_Subscriptions] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]


GO
/****** Object:  Index [IX_Subscriptions_UserId]    Script Date: 02/07/2025 18:46:42 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Subscriptions_UserId] ON [dbo].[Subscriptions]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Subscriptions]  WITH CHECK ADD  CONSTRAINT [FK_Subscriptions_Users_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
ON DELETE CASCADE
GO

ALTER TABLE [dbo].[Subscriptions] CHECK CONSTRAINT [FK_Subscriptions_Users_UserId]