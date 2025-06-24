CREATE TABLE [dbo].[Songs] (
    [Id]            UNIQUEIDENTIFIER NOT NULL,
    [Title]         NVARCHAR (MAX)   NOT NULL,
    [Artist]        NVARCHAR (MAX)   NOT NULL,
    [PriceInTokens] DECIMAL (18, 2)  NOT NULL,
    CONSTRAINT [PK_Songs] PRIMARY KEY CLUSTERED ([Id] ASC)
);

