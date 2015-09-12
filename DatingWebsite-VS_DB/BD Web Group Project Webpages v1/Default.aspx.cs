﻿using System;
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
            ddlGender.DataTextField = Resources.GENDER_COLUMN;
            ddlGender.DataBind();

            attributes = attManager.BLLGetSexualOrientation();
            ddlOrientation.DataSource = attributes;
            ddlOrientation.DataTextField = Resources.SEXUAL_ORIENTATION_COLUMN;
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

            int id = userManager.CreateUser(user);
            if (id > 0)
            {
                setLogin(id, txtUserName.Text);
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

        private void setLogin(int id, string username)
        {
            HttpCookie cookie = new HttpCookie(Resources.USER_COOKIE, id.ToString());
            //cookie.Values.Add("ID", id.ToString());
            //cookie.Values.Add("username", username);
            cookie.Expires = DateTime.Now.AddMinutes(30);
            Response.Cookies.Add(cookie);
        }

        private void setLogout()
        {
            Response.Cookies.Remove(Resources.USER_COOKIE);
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            int id = userManager.Login(txtLoginUsername.Text, txtLoginPassword.Text);
            if (id > 0)
            {
                setLogin(id, txtLoginUsername.Text);
                Response.Redirect("DashboardPersonal.aspx", true);
            }
            else
            {
                Response.Write("Login failed");
                valLogin.Visible = true;
            }
        }
    }
}