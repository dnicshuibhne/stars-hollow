using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
//
using DataModels;
using ResourceTier;
using BLL;

namespace BD_Web_Group_Project_Webpages_v1
{
    public partial class DashboardAccount : System.Web.UI.Page
    {
        BLLUserMngr userManager;
        UserModel user;
        protected void Page_Load(object sender, EventArgs e)
        {
            userManager = new BLLUserMngr();
            user = userManager.BLLGetCurrentUser(Session);
            txtEmail.Text = user.Email;
        }

        protected void btnUpdateEmail_Click(object sender, EventArgs e)
        {
            userManager.BLLUpdateUserEmail(txtEmail.Text);
            user.Email = txtEmail.Text;
        }

        protected void btnUpdatePwd_Click(object sender, EventArgs e)
        {
            userManager.BLLUpdateUserPassword(txtNewPwd.Text);
        }
    }
}