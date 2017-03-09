/*
 * Description : Ficher de code de la page des coordonnées
 * Programmé par : François Légaré
 * Le : 22 février 2014
 * Historique des modifications
 * Par :
 * Le :
 * Modifications :
 */

using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Coordonnees : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        // Si l'usager est root, afficher le bouton qui mène vers l'édition de la page, sinon, ne rien afficher
        labelMessage.Visible = false;
        if (Session["usager_root"] != null && (bool)Session["usager_root"])
        {
            labelEdition.Visible = true;
            labelEdition.Enabled = true;
        }
        else
        {
            labelEdition.Visible = false;
            labelEdition.Enabled = false;
        }
    }

    /// <summary>
    /// Méthode qui permet à l'usager d'envoyer un message à l'administrateur du site, si il n'y a pas d'erreur, le message est enregistré dans la BD puis envoyé grâce à Gmail
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void buttonEnvoyer_Click(object sender, EventArgs e)
    {
        if (Session["usager_UserID"] != null)
        {
            Session["message_idUsager"] = Session["usager_UserID"];
        }        

        MailMessage courriel = new MailMessage(textBoxCourriel.Text, "legarefrancoispp@gmail.com");  // entrer vrais courriels
        courriel.Subject = textBoxSujet.Text;   // objet du message
        courriel.Body = textBoxTexte.Text;   // corps du message
        courriel.IsBodyHtml = true;

        SmtpClient client = new SmtpClient();
        try
        {
            client.Send(courriel);
            labelMessage.Text = "Message envoyé!";
            labelMessage.Visible = true;
        }
        catch (Exception ex)
        {
            Session["message_erreur"] = ex;
            labelMessage.Text = "<p><span class='textemargin'>Attention : le courriel n'a pas pu être envoyé.</span></p>";
            labelMessage.Visible = true;
        }

        SqlDataSourceMessage.Insert();

        textBoxNom.Text = "";
        textBoxSujet.Text = "";
        textBoxTexte.Text = "";
        textBoxCourriel.Text = "";
    }
}