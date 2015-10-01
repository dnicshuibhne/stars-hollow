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
        UserModel user = new UserModel();

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                userManager = new BLLUserMngr();
                user = userManager.BLLGetCurrentUser(Session);
                if (!IsPostBack && user!=null)
                {
                    txtEmail.Text = user.Email;
                }
            }
            catch (Exception)
            {
                //Log error
                Response.Redirect("404.aspx", false);
            }
        }

        protected void btnUpdateEmail_Click(object sender, EventArgs e)
        {
            try
            {
                user.Email = txtNewEmail.Text;
                userManager.BLLUpdateUserEmail(user);

                lblChangeEmailFeedback.Text = "Email changed";
                txtEmail.Text = user.Email;
                txtNewEmail.Text = "";
            }
            catch (Exception)
            {
                //Log error
                Response.Redirect("404.aspx", false);
            }
        }

        protected void btnUpdatePwd_Click(object sender, EventArgs e)
        {
            try
            {
                userManager.BLLUpdateUserPassword(user, txtNewPwd.Text);

                lblChangePwdFeedback.Text = "Password changed";

                txtNewPwd.Text = "";
                txtConfirmPwd.Text = "";
            }
            catch (Exception)
            {
                //Log error
                Response.Redirect("404.aspx", false);
            }
        }
    }
}