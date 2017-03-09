/*
 * Description : Ficher de code de la page maîtresse du site
 * Programmé par : François Légaré
 * Le : 3 février 2014
 * Historique des modifications
 * Par :
 * Le :
 * Modifications :
 */

using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.UI.HtmlControls;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class MasterPage : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        
    }

    /// <summary>
    /// Méthode qui affiche la bonne page selon l'url, si aucune page ne correspond à l'url, afficher la page 404.
    /// Initialise aussi la variable de session des commentaires qui servira dans PiedPage.ascx
    /// </summary>
    protected void Page_Init()
    {
        this.Page.MaintainScrollPositionOnPostBack = true;

        String urlComplete = Request.Url.AbsoluteUri;
        String[] urlSepare = urlComplete.Split('/');
        String pageActuelle = urlSepare[urlSepare.Length - 1];
        pageActuelle = pageActuelle.ToLower();

        bool existe = false;
        DataView dataViewUrl = (DataView)SqlDataSourceUrl.Select(DataSourceSelectArguments.Empty);

        if (dataViewUrl.Count > 0)
        {
            foreach (DataRowView url in dataViewUrl)
            {
                String strurl = url.Row.ItemArray[0].ToString().ToLower();
                if (pageActuelle == strurl)
                {
                    existe = true;
                    break;
                }
                else if (pageActuelle == "")
                {
                    existe = true;
                    break;
                }
            }
        }

        if (existe == true)
        {
            Session["page_url"] = pageActuelle;
        }
        else
        {
            urlSepare[urlSepare.Length - 1] = "404.aspx";
            String urlRedirect = urlSepare[0];

            for (int i = 1; i < urlSepare.Length; i++)
            {
                urlRedirect += "/";
                urlRedirect += urlSepare[i];
            }

            Response.Redirect(urlRedirect.ToString());
        }
        
        DataView dataViewPage = (DataView)SqlDataSourcePage.Select(DataSourceSelectArguments.Empty);

        if (dataViewPage.Count > 0)
        {
            DataRowView donnees = dataViewPage[0];

            Session["commentaire_pageid"] = donnees[0];
            titrePage.Text = donnees[1].ToString();
            h1Accueil.InnerHtml = donnees[4].ToString();
            //labelTextePage.Text = donnees[5].ToString();
        }
        else
        {

        }

        

       
    }


    
}
