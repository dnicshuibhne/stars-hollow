using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
//
using BLL;
using DataModels;

namespace WebApplication1
{
    public partial class Register : System.Web.UI.Page
    {

        BLLUserMngr userManager;
        UserModel user;

        /* Generate page data */
        protected void Page_Load(object sender, EventArgs e)
        {
            userManager = new BLLUserMngr();
        }


        /* Add a new user */
        protected void btnRegister_Click(object sender, EventArgs e)
        {
            //validate password
            //user = new UserModel(txtUsername.Text, txtPassword1.Text);
            //user.Email = txtEmail.Text;

            //if (userManager.CreateUser(user))
            //{
            //    //Redirect to Dashboard
            //    Response.Write("User Created");
            //}
            //else
            //{
            //    Response.Write("Failed to create user");
            //}
        }
    }
}
