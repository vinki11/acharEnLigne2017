CREATE TABLE [dbo].[page]
(
	[page_id] INT NOT NULL PRIMARY KEY, 
    [page_url] NVARCHAR(500) NOT NULL, 
    [page_titre] NVARCHAR(255) NOT NULL, 
    [page_description] NVARCHAR(255) NULL, 
    [page_keywords] NVARCHAR(255) NULL, 
    [page_h1] NVARCHAR(255) NOT NULL, 
    [page_texte] NVARCHAR(MAX) NOT NULL, 
    [page_public] BIT NOT NULL
)
