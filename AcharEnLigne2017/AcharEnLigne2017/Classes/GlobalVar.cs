using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Description résumée de GlobalVar
/// </summary>
public class GlobalVar
{
    public GlobalVar()
    {
        System.Web.HttpContext.Current.Session["panier"] = "allo";
    }
}