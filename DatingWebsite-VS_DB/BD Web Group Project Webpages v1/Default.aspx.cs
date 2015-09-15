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
using ResourceTier;

namespace BD_Web_Group_Project_Webpages_v1
{
    public partial class Default : System.Web.UI.Page
    {
        BLLUserMngr userManager;
        BLLAttributeMngr attManager;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                loginPage2.Visible = false;
            }

            UserModel user = getCurrentUser();
            if (user != null)
            {
                //user.Hobbies = userManager.BLLGetHobbies(user.ID); // write stroed proc to 
                setCurrentUser(user);
                Response.Redirect("DashboardPersonal.aspx");
            }
            else
            {
                userManager = new BLLUserMngr();
                //if registration
                fillRegistrationData();
            }
        }

        #region Page Load Methods
        /*
         * Add User to Session
         */
        public void setCurrentUser(UserModel user)
        {
            if (user == null)
                throw new ArgumentNullException("The user object is invalid");
            else
            {
                Session.Add(Resources.USER_SESSION_STATE, user);
            }
        }


        /*
         * Obtains User from Session
         */
        public UserModel getCurrentUser()
        {
            return (UserModel)Session.Contents[Resources.USER_SESSION_STATE];
        }

        /*
         * Remove User from Session
         */
        private void setLogout()
        {
            Session.Remove(Resources.USER_SESSION_STATE);
        }

        /*
         * Populate Dropdown Lists
         */
        private void fillRegistrationData()
        {
            attManager = new BLLAttributeMngr();

            List<string> attributes;

            attributes = attManager.BLLGetGenders();
            ddlGender.DataSource = attributes;
            ddlGender.DataBind();

            attributes = attManager.BLLGetSexualOrientation();
            ddlOrientation.DataSource = attributes;
            ddlOrientation.DataBind();

            attributes = attManager.BLLGetCounty();
            ddlCounty.DataSource = attributes;
            ddlCounty.DataBind();
        }
        #endregion

        #region Login Methods
        /*
         * Display Login div
         */
        protected void btnOpenLogin_Click(object sender, EventArgs e)
        {
            loginScreen.Visible = true;
            loginPage1.Visible = false;
        }

        /*
         * Hide Login Div
         */
        protected void btnCancelLogin_Click(object sender, EventArgs e)
        {
            loginPage1.Visible = true;
            loginScreen.Visible = false;
            valLogin.Visible = false;
        }

        /*
         * Perform Login
         */
        protected void btnSubmitLogin_Click(object sender, EventArgs e)
        {
            string username = txtLoginUsername.Text;
            string password = txtLoginPassword.Text;

            int id = userManager.BLLLogin(username, password);
            if (id > 0)
            {
                UserModel user = new UserModel(id, username);
                user.Hobbies = userManager.BLLGetHobbies(user.ID);
                setCurrentUser(user);
                Response.Redirect("DashboardPersonal.aspx", true);
            }
            else
            {
                Response.Write("Login failed");
                valLogin.Visible = true;
                loginPage1.Visible = true;
            }
        }
        #endregion

        #region Registration Methods
        /*
         * Go from first half of registration form to second
         */
        protected void btnContinueReg_Click(object sender, EventArgs e)
        {
            //check if username is available
            if (userManager.BLLUserExists(txtUserName.Text))
            {
                //prompt to use different username
                valUserAvail.IsValid = false;
            }
            else
            {
                loginPage1.Visible = false;
                loginPage2.Visible = true;
            }
        }

        /*
         * Return from second half of registration form to first
         */
        protected void btnBack_Click(object sender, EventArgs e)
        {
            loginPage2.Visible = false;
            loginPage1.Visible = true;
        }

        /*
         * Perform Registration
         */
        protected void btnRegister_Click(object sender, EventArgs e)
        {
            int id = userManager.BLLCreateUser(txtUserName.Text, txtEmail.Text, txtCreatePwd.Text);
            if (id > 0)
            {
                UserModel user = new UserModel(id,txtUserName.Text);
                user.SexualOrientation = ddlOrientation.SelectedValue;
                user.Gender = ddlGender.SelectedValue;
                user.County = ddlCounty.SelectedValue;

                setCurrentUser(user);
                Response.Write("User Created");
                Response.Redirect("DashboardPersonal.aspx");
            }
            else
            {
                Response.Write("Failed to create user");
            }
        }
        #endregion
    }
}