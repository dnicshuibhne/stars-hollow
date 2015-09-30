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
    public partial class Dashboard1 : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                UserModel user = (UserModel)Session[Resources.USER_SESSION_STATE];
                DashboardSideNav.Items[4].NavigateUrl = "ViewMatchProfile.aspx?username=" + user.Username;
            }
            catch (Exception)
            {
                // This is intentionally left blank due to Claire-created threading bugs.
            }
        }
    }
}