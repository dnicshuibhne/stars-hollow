using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
//
using BLL;
using DataModels;
using System.Data;

namespace BD_Web_Group_Project_Webpages_v1
{
    public partial class Default : System.Web.UI.Page
    {
        private const string GENDER_COLUMN = "Gender";
        private const string SEXUAL_ORIENTATION_COLUMN = "Orientation";

        BLLUserMngr userManager;
        public UserModel user;
        BLLAttributeMngr attManager;
        DataSet attributes;

        protected void Page_Load(object sender, EventArgs e)
        {
            loginScreen.Style.Add(HtmlTextWriterStyle.Display, "none");
            loginPage2.Visible = false;
            userManager = new BLLUserMngr();
            attManager = new BLLAttributeMngr();
            
            attributes = attManager.BLLGetGenders();
            ddlGender.DataSource = attributes;
            ddlGender.DataTextField = GENDER_COLUMN;
            ddlGender.DataBind();

            attributes = attManager.BLLGetSexualOrientation();
            ddlOrientation.DataSource = attributes;
            ddlOrientation.DataTextField = SEXUAL_ORIENTATION_COLUMN;
            ddlOrientation.DataBind();
        }

        protected void btnContinueReg_Click(object sender, EventArgs e)
        {
            //check if username is available
            if (userManager.userExists(txtUserName.Text))
            {
                //prompt to use different username
                valUserAvail.Visible = true;
            }
            else
            {
                loginPage1.Visible = false;
                loginPage2.Visible = true;
            }
        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            user = new UserModel(txtUserName.Text, txtCreatePwd.Text);
            user.SexualOrientation = ddlOrientation.SelectedValue;
            user.Gender = ddlGender.SelectedValue;
            user.Location = txtLocation.Text;
            user.Email = txtEmail.Text; 

            if (userManager.CreateUser(user))
            {
                //Redirect to DashboardPersonal
                Response.Write("User Created");
                Response.Redirect("DashboardPersonal.aspx", true);
            }
            else
            {
                Response.Write("Failed to create user");
            }
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            loginScreen.Visible = true;
            loginScreen.Style.Add(HtmlTextWriterStyle.Display, "inline");
        }

        protected void btnBack_Click(object sender, EventArgs e)
        {
            loginPage2.Visible = false;
            loginPage1.Visible = true;
        }
    }
}