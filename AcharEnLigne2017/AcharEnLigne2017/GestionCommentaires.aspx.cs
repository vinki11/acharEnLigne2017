/*
 * Description : Ficher de code de la page de gestion des commentaires
 * Programmé par : François Légaré
 * Le : 22 mars 2014
 * Historique des modifications
 * Par :
 * Le :
 * Modifications :
 */

using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class GestionCommentaires : System.Web.UI.Page
{
    // Variable servant à garder l'id de la prochaine page à être ajoutée dans le dataview pour chaque exécution de RowDataBound
    int i = 0;

    protected void Page_Load(object sender, EventArgs e)
    {
        i = 0;

        // Si l'usager n'est pas root, l'envoyer sur la page de redirection
        if (Session["usager_root"] == null || (bool)Session["usager_root"] != true)
        {
            String urlComplete = Request.Url.AbsoluteUri;
            String[] urlSepare = urlComplete.Split('/');
            urlSepare[urlSepare.Length - 1] = "Redirection.aspx";
            String urlRedirect = urlSepare[0];

            for (int j = 1; j < urlSepare.Length; j++)
            {
                urlRedirect += "/";
                urlRedirect += urlSepare[j];
            }

            Response.Redirect(urlRedirect.ToString());

        }
    }

    /// <summary>
    /// Méthode qui ajoute les commentaires de chaque page dans le gridView, se sert de la variable i pour savoir à quelle page il est rendu
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void GridViewPage_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        DataView dataViewPage = (DataView)SqlDataSourcePage.Select(DataSourceSelectArguments.Empty);

        if (dataViewPage.Count > i)
        {
            DataRowView donnees = dataViewPage[i];

            Session["pagecommentaire_id"] = donnees[0];

            i++;
        }
        else
        {

        }
    }

    /// <summary>
    /// Actualise la page après un delete
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void GridViewCommentaires_RowDeleted(object sender, GridViewDeletedEventArgs e)
    {
        ViewState["Actualisation"] = Request.Url;
        Response.Redirect(ViewState["Actualisation"].ToString());
    }
}