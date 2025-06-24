CREATE TABLE [dbo].[Subscriptions] (
    [Id]            UNIQUEIDENTIFIER NOT NULL,
    [Plan]          INT              NOT NULL,
    [MonthlyPrice]  DECIMAL (18, 2)  NOT NULL,
    [MonthlyTokens] INT              NOT NULL,
    [StartDate]     DATETIME2 (7)    NOT NULL,
    [UserId]        UNIQUEIDENTIFIER NOT NULL,
    CONSTRAINT [PK_Subscriptions] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_Subscriptions_Users_UserId] FOREIGN KEY ([UserId]) REFERENCES [dbo].[Users] ([Id]) ON DELETE CASCADE
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_Subscriptions_UserId]
    ON [dbo].[Subscriptions]([UserId] ASC);

