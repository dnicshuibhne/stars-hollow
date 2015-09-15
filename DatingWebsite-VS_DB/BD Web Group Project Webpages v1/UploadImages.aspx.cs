using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
//
using DataModels;
using ResourceTier;

namespace BD_Web_Group_Project_Webpages_v1
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        UserModel user;
        protected void Page_Load(object sender, EventArgs e)
        {
            /* check if logged in*/
            user = (UserModel)Session[Resources.USER_SESSION_STATE];
            if (user == null || user.ID < 1)
            {
                Response.Redirect("Default.aspx", true);
            }

        }
    }
}