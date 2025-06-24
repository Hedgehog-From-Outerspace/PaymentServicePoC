CREATE TABLE [dbo].[UserPurchasedSongs] (
    [SongId] UNIQUEIDENTIFIER NOT NULL,
    [UserId] UNIQUEIDENTIFIER NOT NULL,
    CONSTRAINT [PK_UserPurchasedSongs] PRIMARY KEY CLUSTERED ([SongId] ASC, [UserId] ASC),
    CONSTRAINT [FK_UserPurchasedSongs_Songs_SongId] FOREIGN KEY ([SongId]) REFERENCES [dbo].[Songs] ([Id]) ON DELETE CASCADE,
    CONSTRAINT [FK_UserPurchasedSongs_Users_UserId] FOREIGN KEY ([UserId]) REFERENCES [dbo].[Users] ([Id]) ON DELETE CASCADE
);


GO
CREATE NONCLUSTERED INDEX [IX_UserPurchasedSongs_UserId]
    ON [dbo].[UserPurchasedSongs]([UserId] ASC);

