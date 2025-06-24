CREATE TABLE [dbo].[Wallets] (
    [Id]      UNIQUEIDENTIFIER NOT NULL,
    [Balance] INT              NOT NULL,
    [UserId]  UNIQUEIDENTIFIER NOT NULL,
    CONSTRAINT [PK_Wallets] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_Wallets_Users_UserId] FOREIGN KEY ([UserId]) REFERENCES [dbo].[Users] ([Id]) ON DELETE CASCADE
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_Wallets_UserId]
    ON [dbo].[Wallets]([UserId] ASC);

