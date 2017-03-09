/*
 * Description : Ficher de code de la page d'ajout de produit
 * Programmé par : François Légaré
 * Le : 28 février 2014
 * Historique des modifications
 * Par :
 * Le :
 * Modifications :
 */

using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AjoutProduit : System.Web.UI.Page
{

    protected void Page_Load(object sender, EventArgs e)
    {
        // Si l'usager n'est pas connecté ou qu'il n'est pas root, envoyer l'usager sur une page de redirection
        if (Session["usager_root"] == null || (bool)Session["usager_root"] != true)
        {
            String urlComplete = Request.Url.AbsoluteUri;
            String[] urlSepare = urlComplete.Split('/');
            urlSepare[urlSepare.Length - 1] = "Redirection.aspx";
            String urlRedirect = urlSepare[0];

            for (int i = 1; i < urlSepare.Length; i++)
            {
                urlRedirect += "/";
                urlRedirect += urlSepare[i];
            }

            Response.Redirect(urlRedirect.ToString());

        }
        // Si c'est la première fois que la page est chargée, aller chercher l'url de la page précédente, si null, dire que page prec. est la page d'accueil
        if (!IsPostBack) //check if the webpage is loaded for the first time.
        {
            ViewState["PreviousPage"] = Request.UrlReferrer;//Saves the Previous page url in ViewState

            if (ViewState["PreviousPage"] != null)
            {
                String urlComplete = Request.UrlReferrer.AbsoluteUri;
                String[] urlSepare = urlComplete.Split('/');
                String pageActuelle = urlSepare[urlSepare.Length - 1];

                Session["url_page_prec"] = pageActuelle;
            }
            else
            {
                Session["url_page_prec"] = "Default.aspx";
            }

        }
    }
    /// <summary>
    /// Méthode qui gère le téléversement d'image lorsque les données d'ajout de produit sont ajoutées dans la BD
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void detailsViewAjout_ItemInserted(object sender, DetailsViewInsertedEventArgs e)
    {

        if (e.Exception == null)
        {
            // Code permettant de trouver l'url vers lequel l'usager sera envoyé une fois la méthode terminée
            String urlComplete = Request.Url.AbsoluteUri;
            String[] urlSepare = urlComplete.Split('/');
            urlSepare[urlSepare.Length - 1] = "ListeProduit.aspx";
            String urlRedirect = urlSepare[0];

            for (int i = 1; i < urlSepare.Length; i++)
            {
                urlRedirect += "/";
                urlRedirect += urlSepare[i];
            }

            FileUpload fileUploadPhoto = (FileUpload)detailsViewAjout.FindControl("fileUploadPhoto");

            // Si il y a un fichier dans le FileUpload et qu'il s'agit d'un type de fichier supporté, l'ajouté dans le dossier prévu à cet effet ou afficher le message d'erreur en cas de problème
            if (fileUploadPhoto.HasFile)
            {
                if (fileUploadPhoto.PostedFile.ContentType == "image/jpeg" || fileUploadPhoto.PostedFile.ContentType == "image/png")
                {
                    try
                    {
                        string fichier = Path.GetFileName(fileUploadPhoto.FileName);
                        fileUploadPhoto.SaveAs(Server.MapPath("~/medias/commun/produits/") + fichier);
                        //Response.Redirect(urlRedirect.ToString());
                    }
                    catch (Exception ex)
                    {
                        labelMessage.Text = "Une erreur est survenue. Le fichier n'a pas pu être téléversé.";
                    }
                }
                else
                {

                }
            }
            
            
        }
        else
        {
            // cette instruction est essentielle pour ne pas que le programme plante
            e.ExceptionHandled = true;

            labelMessage.Text = "Un problème a empêché l'ajout de données.";
            labelMessage.Visible = true;
        }
        
        
    }
    /// <summary>
    /// Méthode qui retourne à la page précédente si l'usager clique sur le bouton cancel
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void detailsViewAjout_ItemCommand(object sender, DetailsViewCommandEventArgs e)
    {
        if (e.CommandName.Equals("cancel", StringComparison.CurrentCultureIgnoreCase))
        {
            if (ViewState["PreviousPage"] != null)	//Check if the ViewState contains Previous page URL
            {
                Response.Redirect(ViewState["PreviousPage"].ToString());//Redirect to previous page by retrieving the PreviousPage Url from ViewState.
            }
        }
    }
    /// <summary>
    /// Méthode qui regarde le output renvoyé par la procédure stockée, si il n'est pas null c'est qu'un produit du même nom était déjà dans la BD,
    /// plutôt que d'avoir deux produits ayant le même nom, le produit est tout simplement modifié et l'usager en est informé
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void SqlDataSourceProduit_Inserted(object sender, SqlDataSourceStatusEventArgs e)
    {
        // retrouver le nom du nouveau produit retourné par la procédure stockée
        System.Data.Common.DbCommand command = e.Command;
        string produit_nom = command.Parameters["@produit_nom"].Value.ToString();

        // retrouver l'opération effectuée lors de la procédure
        string operation = command.Parameters["@operation"].Value.ToString();

        if (operation != "" && operation != null)
        {
            labelMessage.Text = "Le produit était déjà sur le site, il a été modifier avec ces nouvelles données.";
            labelMessage.Visible = true;
        }
        else
        {
            labelMessage.Visible = false;
        }
        
    }
    /// <summary>
    /// Méthode qui sert tout simplement à aller chercher le nom de l'image téléversée pour l'insérer dans la BD
    /// Change également la chaîne du prix en décimal.
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void detailsViewAjout_ItemInserting(object sender, DetailsViewInsertEventArgs e)
    {
        FileUpload fileUploadPhoto = (FileUpload)detailsViewAjout.FindControl("fileUploadPhoto");

        if (fileUploadPhoto.HasFile)
        {
            if (fileUploadPhoto.PostedFile.ContentType == "image/jpeg" || fileUploadPhoto.PostedFile.ContentType == "image/png")
            {
                string fichier = Path.GetFileName(fileUploadPhoto.FileName);
                Session["produit_image"] = fichier.ToString();
            }
        }

        if (e.Values["produit_prix"] != null)
        {
            // Transforme la chaîne en une valeur décimale.
            // Enlève le signe monétaire s'il était présent.
            // Transforme le séparateur de décimales, selon la culture utilisée, en point.
            e.Values["produit_prix"] = decimal.Parse(e.Values["produit_prix"].ToString(), System.Globalization.NumberStyles.Currency);
        }
    }
}
