
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Inscription : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        // Si c'est la première fois que la page est chargée, aller chercher l'url de la page prec.
        if (!IsPostBack) //check if the webpage is loaded for the first time.
        {
            ViewState["PreviousPage"] = Request.UrlReferrer;//Saves the Previous page url in ViewState
            labelMessage.Visible = false;
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
    /// Si les données sont valides et que le captcha est valide, ajoute les données dans la BD, connecte l'usager et le renvoie à la page prec.
    /// Sinon, affiche un message d'erreur.
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void buttonEnregistrer_Click(object sender, EventArgs e)
    {
        if (Page.IsValid && recaptcha.IsValid)
        {
            try
            {
                MembershipUser membershipUser = Membership.CreateUser(textBoxCodeUsager.Text, textBoxMotDePasse.Text, textBoxCourriel.Text);
                Session["usager_nomfamille"] = textBoxNomFamille.Text;
                Session["usager_prenom"] = textBoxPrenom.Text;
                Session["usager_photo"] = null;
                Session["usager_description"] = textBoxDescription.Text;
                Session["usager_root"] = false;

                SqlDataSourceUsager.InsertParameters["usager_UserID"].DefaultValue = membershipUser.ProviderUserKey.ToString();
                SqlDataSourceUsager.Insert();

                Session["usager_UserID"] = membershipUser.ProviderUserKey.ToString();

                DataView dv = (DataView)SqlDataSourceUsager.Select(DataSourceSelectArguments.Empty);
                Session["usagerconnecte"] = dv[0];

                if (ViewState["PreviousPage"] != null)	//Check if the ViewState contains Previous page URL
                {
                    Response.Redirect(ViewState["PreviousPage"].ToString());//Redirect to previous page by retrieving the PreviousPage Url from ViewState.
                }
                else
                {
                    Session["url_page_prec"] = "Default.aspx";
                    Response.Redirect(Session["url_page_prec"].ToString());
                }
            }
            catch (MembershipCreateUserException ex)
            {
                labelMessage.Visible = true;
                labelMessage.Text = GetErrorMessage(ex.StatusCode);
            }
            catch (HttpException ex)
            {
                labelMessage.Visible = true;
                labelMessage.Text = ex.Message;
            }
        }
        else
        {

        }
        
    }

    /// <summary>
    /// Monte un message d'erreur en fonction de l'exception levée par Membership.CreateUser()
    /// Inspiré de http://msdn.microsoft.com/fr-fr/library/d8t4h2es(v=vs.110).aspx
    /// </summary>
    /// <param name="statusCode">Code de statut levé par l'exception MembershipCreateUserException</param>
    /// <returns>Message en français décrivant le problème rencontré lors de la création de l'usager</returns>
    public string GetErrorMessage(MembershipCreateStatus statusCode)
    {
        switch (statusCode)
        {
            case MembershipCreateStatus.DuplicateUserName:
                return "Ce code d'usager existe déjà. Veuillez entrer un code différent.";

            case MembershipCreateStatus.DuplicateEmail:
                return "Cette adresse de courriel est déjà utilisée. Veuillez entrer une adresse de courriel différente.";

            case MembershipCreateStatus.InvalidPassword:
                // ajuster ce message selon les règles configurées dans Web.config
                return "Le mot de passe n'est pas valide. Le mot de passe doit avoir au moins xxx caractères dont au moins un caractère alphanumérique.";

            default:
                return "Une erreur inconnue a été rencontrée. Veuillez vérifier les informations entrées puis réessayer. Si le problème persiste, veuillez contacter l'adminsitrateur du système.";
        }
    }


    /// <summary>
    /// Méthode qui sert à valider si le captcha a bien été entré
    /// </summary>
    /// <param name="source"></param>
    /// <param name="args"></param>
    protected void recaptchaValidator_ServerValidate(object source, ServerValidateEventArgs args)
    {
        this.recaptcha.Validate();
        args.IsValid = this.recaptcha.IsValid;
    }
}