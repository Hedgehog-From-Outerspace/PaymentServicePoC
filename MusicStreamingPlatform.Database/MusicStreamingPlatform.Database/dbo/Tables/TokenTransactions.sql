CREATE TABLE [dbo].[TokenTransactions] (
    [Id]          UNIQUEIDENTIFIER NOT NULL,
    [WalletId]    UNIQUEIDENTIFIER NOT NULL,
    [Amount]      DECIMAL (18, 2)  NOT NULL,
    [Description] NVARCHAR (MAX)   NOT NULL,
    [Date]        DATETIME2 (7)    NOT NULL,
    CONSTRAINT [PK_TokenTransactions] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_TokenTransactions_Wallets_WalletId] FOREIGN KEY ([WalletId]) REFERENCES [dbo].[Wallets] ([Id]) ON DELETE CASCADE
);


GO
CREATE NONCLUSTERED INDEX [IX_TokenTransactions_WalletId]
    ON [dbo].[TokenTransactions]([WalletId] ASC);

