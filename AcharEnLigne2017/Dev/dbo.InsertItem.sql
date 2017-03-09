CREATE PROCEDURE InsertItem
(
	-- Add the parameters for the stored procedure here
    @produit_idCategorie int,
    @produit_nom nvarchar(50) OUTPUT,
    @produit_prix float,
    @produit_image nvarchar(50),
    @produit_description nvarchar(max),
	@operation nvarchar(10) OUTPUT
)
AS
DECLARE @produitExistant int

SET @produitExistant = (SELECT produit_id FROM produit WHERE produit_nom = 'testAjout')

   IF (@produitExistant IS NOT NULL)
	BEGIN
	   SET @operation = @produitExistant;
       UPDATE produit SET produit_idCategorie = @produit_idCategorie, produit_prix = @produit_prix, produit_image = @produit_image, produit_description = @produit_description WHERE produit_nom = @produit_nom;
	END
   ELSE
	BEGIN
       INSERT INTO produit (produit_idCategorie, produit_nom, produit_prix, produit_image, produit_description) VALUES (@produit_idCategorie, @produit_nom, @produit_prix, @produit_image, @produit_description);
	END

   
RETURN 0