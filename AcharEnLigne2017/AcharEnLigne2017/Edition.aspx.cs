/*
 * Description : Ficher de code de la page d'édition
 * Programmé par : François Légaré
 * Le : 21 février 2014
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

public partial class Edition : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        labelMessage.Visible = false;

        // Si l'usager n'est pas root, l'envoyer vers la page de redirection
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

        // Si la page précédente n'est pas null et que la page est chargée pour la première fois, mettre les données de la page précédente dans les contrôles de celle-ci
        if (Session["url_page_prec"] != null)
        {
            if (!IsPostBack)
            {
                DataView dataViewPage = (DataView)SqlDataSourcePage.Select(DataSourceSelectArguments.Empty);

                if (dataViewPage.Count > 0)
                {
                    DataRowView donnees = dataViewPage[0];

                    textareaTitre.Value = donnees[1].ToString();
                    textareaMots.Value = donnees[3].ToString();
                    textareaDesc.Value = donnees[2].ToString();
                    textareaH1.Value = donnees[4].ToString();
                    textareaTexte.Value = donnees[5].ToString();

                }
            }
            
        }
        else
        { 
        
        }
       
    }

    /// <summary>
    /// Retourne à la page précédente
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void buttonAnnuler_Click(object sender, EventArgs e)
    {
        if (ViewState["PreviousPage"] != null)	//Check if the ViewState contains Previous page URL
        {
            Response.Redirect(ViewState["PreviousPage"].ToString());//Redirect to previous page by retrieving the PreviousPage Url from ViewState.
        }
    }

    /// <summary>
    /// Modifie les données de la page dans la BD grâce aux contrôles de cette page, si il y a une erreur, afficher le message d'erreur
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void buttonEnregistrer_Click(object sender, EventArgs e)
    {
        try
        {
            SqlDataSourcePage.Update();

            if (ViewState["PreviousPage"] != null)	//Check if the ViewState contains Previous page URL
            {
                Response.Redirect(ViewState["PreviousPage"].ToString());//Redirect to previous page by retrieving the PreviousPage Url from ViewState.
            }
        }
        catch
        {
            labelMessage.Visible = true;
        }        

        
    }
}