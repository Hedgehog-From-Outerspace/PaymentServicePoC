CREATE TABLE [dbo].[UserPurchasedSongs](
	[SongId] [uniqueidentifier] NOT NULL,
	[UserId] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_UserPurchasedSongs] PRIMARY KEY CLUSTERED 
(
	[SongId] ASC,
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]


GO
/****** Object:  Index [IX_UserPurchasedSongs_UserId]    Script Date: 02/07/2025 18:46:42 ******/
CREATE NONCLUSTERED INDEX [IX_UserPurchasedSongs_UserId] ON [dbo].[UserPurchasedSongs]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[UserPurchasedSongs]  WITH CHECK ADD  CONSTRAINT [FK_UserPurchasedSongs_Users_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
ON DELETE CASCADE
GO

ALTER TABLE [dbo].[UserPurchasedSongs] CHECK CONSTRAINT [FK_UserPurchasedSongs_Users_UserId]
GO
ALTER TABLE [dbo].[UserPurchasedSongs]  WITH CHECK ADD  CONSTRAINT [FK_UserPurchasedSongs_Songs_SongId] FOREIGN KEY([SongId])
REFERENCES [dbo].[Songs] ([Id])
ON DELETE CASCADE
GO

ALTER TABLE [dbo].[UserPurchasedSongs] CHECK CONSTRAINT [FK_UserPurchasedSongs_Songs_SongId]