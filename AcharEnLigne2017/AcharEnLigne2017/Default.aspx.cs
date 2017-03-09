/*
 * Description : Ficher de code de la page d'accueil du site
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

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

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
    
    
}