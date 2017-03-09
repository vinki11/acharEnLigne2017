/*
 * Description : Ficher de code du contrôle pour le menu
 * Programmé par : François Légaré
 * Le : 12 mars 2014
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

public partial class MenuPrincipal : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        // Si l'usager est connecté, changer l'otion de menu "Inscription" pour "Votre compte"
        // Sinon, "Inscription"
        // En commentaire car Compte.aspx n'a pas été codé
        //if (Session["usager_UserID"] != null)
        //{
        //    labelInscription.Text = "Votre compte";
        //}
        //else
        //{
             //labelInscription.Text = "Inscription";
        //}

        String urlComplete = Request.Url.AbsoluteUri;
        String[] urlSepare = urlComplete.Split('/');
        String pageActuelle = urlSepare[urlSepare.Length - 1];
        pageActuelle = pageActuelle.ToLower();

        Session["page_url"] = pageActuelle;

        DataView dataViewPage = (DataView)SqlDataSourcePage.Select(DataSourceSelectArguments.Empty);

        // Met en évidence l'option de menu sélectionnée
        if (dataViewPage.Count > 0)
        {
            DataRowView donnees = dataViewPage[0];

            if (donnees[0].ToString() == "Accueil")
            {
                accueilLi.Attributes.Add("class", "current_page_item");
            }
            else if (donnees[0].ToString() == "Liste de produits")
            {
                listeLi.Attributes.Add("class", "current_page_item");
            }
            //else if (donnees[0].ToString() == "Inscription")
            //{
            //    inscriptionLi.Attributes.Add("class", "current_page_item");
            //}
            //else if (donnees[0].ToString() == "Coordonn&eacute;es")
            //{
            //    coordonneesLi.Attributes.Add("class", "current_page_item");
            //}
        }
        else
        {

        }
    }
}