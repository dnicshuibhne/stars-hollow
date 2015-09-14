using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BD_Web_Group_Project_Webpages_v1
{
    public partial class SearchResults : System.Web.UI.Page
    {
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