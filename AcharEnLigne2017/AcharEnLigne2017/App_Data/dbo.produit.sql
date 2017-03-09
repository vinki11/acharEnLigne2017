CREATE TABLE [dbo].[produit]
(
	[produit_id] INT NOT NULL PRIMARY KEY, 
    [produit_nom] NVARCHAR(50) NOT NULL, 
    [produit_description] NVARCHAR(MAX) NULL, 
    [produit_prix] FLOAT NOT NULL, 
    [produit_image] NVARCHAR(50) NOT NULL, 
    [produit_idCategorie] INT NOT NULL
)
