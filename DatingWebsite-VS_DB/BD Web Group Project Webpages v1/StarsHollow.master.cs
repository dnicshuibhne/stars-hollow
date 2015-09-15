using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
//
using ResourceTier;

namespace BD_Web_Group_Project_Webpages_v1
{
    public partial class StarsHollow : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //if(Request.Url
            /*
             * if not default page and if user not logged in - redirect to default
             */
        }


        protected void StarsHollow_MenuItemClick(object sender, MenuEventArgs e)
        {
            /*
             * Remove User from Session
             */
            if (e.Item.Value == "Logout")
            {
                Session.Remove(Resources.USER_SESSION_STATE);
                Response.Redirect("Default.aspx");
            }
        }
    }
}