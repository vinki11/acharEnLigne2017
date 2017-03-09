/*
 * Description : Ficher de code du contrôle utilisateur de l'authentification
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
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Authentification : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        // Si il y a un id dans la variable de session, connecter l'usager, sinon, afficher et effacer les bons contrôles pour la connexion
        if (Session["usager_UserID"] != null)
        {
            connexion();
        }
        else
        {
            buttonDeco.Visible = false;
            this.Page.Form.DefaultFocus = this.textBoxUsager.ClientID;
        }
    }

    /// <summary>
    /// Méthode qui vérifie si les identifiants que l'usager utilise sont bien dans la BD, sinon, afficher le message d'erreur
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void buttonSoumettre_Click(object sender, EventArgs e)
    {
        if (Membership.ValidateUser(textBoxUsager.Text, textBoxMdp.Text))
        {
            Session["UserName"] = textBoxUsager.Text;
            DataView dataViewUserID = (DataView)SqlDataSourceUserID.Select(DataSourceSelectArguments.Empty);
            DataRowView donnees = dataViewUserID[0];
            Session["usager_UserID"] = donnees["UserId"].ToString();
            connexion();
            ViewState["Actualisation"] = Request.Url;
            Response.Redirect(ViewState["Actualisation"].ToString());
        }
        else
        {
            labelProbleme.Visible = true;
            labelProbleme.Text = "Usager ou mot de passe incorrect.";
        }

    }

    /// <summary>
    /// Méthode qui rend null les variables de session et affiche les bons contrôles pour la connexion et qui actualise la page
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void buttonDeco_Click(object sender, EventArgs e)
    {
        labelUsager.Visible = true;
        labelMdp.Visible = true;
        textBoxUsager.Visible = true;
        textBoxMdp.Visible = true;
        buttonSoumettre.Visible = true;
        labelConnexion.Visible = false;
        labelConnexion.Text = "";
        buttonDeco.Visible = false;
        Session["usager_UserID"] = null;
        ViewState["Actualisation"] = Request.Url;
        Session["usager_root"] = null;
        Response.Redirect(ViewState["Actualisation"].ToString());

    }

    /// <summary>
    /// Méthode qui efface/affiche les bons contrôles pour la déconnexion et qui affiche le message de bienvenue
    /// </summary>
    protected void connexion()
    {
        labelUsager.Visible = false;
        labelMdp.Visible = false;
        textBoxUsager.Visible = false;
        textBoxMdp.Visible = false;
        buttonSoumettre.Visible = false;
        labelProbleme.Visible = false;
        labelConnexion.Visible = true;
        DataView dataViewUsager = (DataView)SqlDataSourceUsager.Select(DataSourceSelectArguments.Empty);
        DataRowView donnees = dataViewUsager[0];
        string nomcomplet = donnees[0].ToString();
        labelConnexion.Text = "Bienvenue, Monsieur " + nomcomplet + " !";
        buttonDeco.Visible = true;
        Session["usager_root"] = donnees[2];
    }
}