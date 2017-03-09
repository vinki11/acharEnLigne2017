/*
 * Description : Ficher de code du contrôle utilisateur du pied de page
 * Programmé par : François Légaré
 * Le : 29 janvier 2014
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

public partial class PiedPage : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        // Si l'usager est connecté, lui permettre de laisser un message, sinon, lui indiquer de se connecter.
        // Si il est root, afficher le bouton qui mène à la gestion des commentaires
        if (Session["usager_UserID"] != null)
        {
            textBoxCommentaire.Enabled = true;
            buttonEnvoyerComm.Enabled = true;
            labelCommentaire.Text = "Laissez votre commentaire.";

            if (Session["usager_root"] == null || (bool)Session["usager_root"] != true)
            {
                labelGestion.Visible = false;
            }
            else
            {
                labelGestion.Visible = true;
            }
        }
        else
        {
            labelGestion.Visible = false;
            textBoxCommentaire.Enabled = false;
            buttonEnvoyerComm.Enabled = false;
            labelCommentaire.Text = "Veuillez vous connecter pour laisser un commentaire.";
        }

        GridViewCommentaires.DataBind();
    }

    /// <summary>
    /// Méthode qui prend le commentaire dans la textbox si elle n'est pas vide et l'ajoute dans la BD.  Vide ensuite la textbox.
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void buttonEnvoyerComm_Click(object sender, EventArgs e)
    {
        if (textBoxCommentaire.Text != "")
        {
            Session["commentaire_texte"] = textBoxCommentaire.Text;
            DataView dataViewUsager = (DataView)SqlDataSourceUsager.Select(DataSourceSelectArguments.Empty);
            DataRowView donnees = dataViewUsager[0];
            Session["commentaire_usagerid"] = donnees[1];

            SqlDataSourceCommentaire.Insert();

            textBoxCommentaire.Text = "";
        }
        else
        {
        }
    }
}