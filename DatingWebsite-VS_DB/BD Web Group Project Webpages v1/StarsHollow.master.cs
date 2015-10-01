using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
//
using ResourceTier;
using DataModels;

namespace BD_Web_Group_Project_Webpages_v1
{
    public partial class StarsHollow : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            /* check if logged in*/
            if (!Request.ServerVariables["URL"].Contains("Default.aspx"))
            {
                UserModel user = (UserModel)Session[Resources.USER_SESSION_STATE];
                if (user == null || user.ID < 1)
                {
                    Response.Redirect("Default.aspx", true);
                }
                else
                {
                    TopNavBarControl.Items[0].ChildItems[4].NavigateUrl = "ViewMatchProfile.aspx?username=" + user.Username;
                }
            }
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