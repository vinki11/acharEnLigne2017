CREATE TABLE [dbo].[usager] (
    [usager_id]          INT            NOT NULL IDENTITY,
    [usager_nomfamille]  NVARCHAR (50)  NOT NULL,
    [usager_prenom]      NVARCHAR (50)  NOT NULL,
    [usager_photo]       NVARCHAR (50)  NULL,
    [usager_description] NVARCHAR (MAX) NULL,
    [usager_root]        BIT            NOT NULL,
    [usager_UserID]      NVARCHAR (50)  NOT NULL,
    PRIMARY KEY CLUSTERED ([usager_id] ASC),
    UNIQUE NONCLUSTERED ([usager_UserID] ASC)
);

