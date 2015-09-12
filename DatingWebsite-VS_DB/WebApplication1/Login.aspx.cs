using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
//
using System.Data.SqlClient;
using System.Configuration;
using BLL;
using DataModels;

namespace WebApplication1
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            //string conString = ConfigurationManager.ConnectionStrings["VSProjectCS"].ConnectionString;
            //using (SqlConnection con = new SqlConnection(conString))
            //{
            //    using (SqlCommand cmd = new SqlCommand("Select * from UserLogin", con))
            //    {
            //        con.Open();
            //        gvResults.DataSource = cmd.ExecuteReader();
            //        gvResults.DataBind();
            //    }
            //}

            //conString = ConfigurationManager.ConnectionStrings["SqlSrvrMgmtCS"].ConnectionString;
            //using (SqlConnection con = new SqlConnection(conString))
            //{
            //    using (SqlCommand cmd = new SqlCommand("Select * from tblUsers", con))
            //    {
            //        con.Open();
            //        gvResults.DataSource = cmd.ExecuteReader();
            //        gvResults.DataBind();
            //    }
            //}
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            string username = txtUsername.Text;
            string password = txtPassword.Text;

            BLLUserMngr m = new BLLUserMngr();
            UserModel user = m.Login(username, password);

            if (user == null)
            {
                Response.Write("Login Failed.");
            }
            else
            {
                Response.Write("Login Success.");
            }

            //gvResults.DataBind();
        }
    }
}