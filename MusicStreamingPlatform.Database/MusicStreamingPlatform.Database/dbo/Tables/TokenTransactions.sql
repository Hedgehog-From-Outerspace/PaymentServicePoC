CREATE TABLE [dbo].[TokenTransactions](
	[Id] [uniqueidentifier] NOT NULL,
	[WalletId] [uniqueidentifier] NOT NULL,
	[Amount] [decimal](18, 2) NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
	[Date] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_TokenTransactions] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]


GO
/****** Object:  Index [IX_TokenTransactions_WalletId]    Script Date: 02/07/2025 18:46:42 ******/
CREATE NONCLUSTERED INDEX [IX_TokenTransactions_WalletId] ON [dbo].[TokenTransactions]
(
	[WalletId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[TokenTransactions]  WITH CHECK ADD  CONSTRAINT [FK_TokenTransactions_Wallets_WalletId] FOREIGN KEY([WalletId])
REFERENCES [dbo].[Wallets] ([Id])
ON DELETE CASCADE
GO

ALTER TABLE [dbo].[TokenTransactions] CHECK CONSTRAINT [FK_TokenTransactions_Wallets_WalletId]