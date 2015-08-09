using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
//import User class
using Assignment.Code;

namespace Assignment
{
    public partial class Login : System.Web.UI.Page
    {
        public static List<User> Users;

        protected void Page_Load(object sender, EventArgs e)
        {
            Users = new List<User>();
            Users.Add(new User("Marry", "1234"));
            Users.Add(new User("Tom", "1234"));
            Users.Add(new User("Richard", "1234"));
            Users.Add(new User("Jane", "1234"));
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            User user;

            //get attributes
            string username = txtUsername.Text;
            string password = txtPassword.Text;

            user = new User(username, password);

            bool found = false;

            foreach (User u in Users)
            {
                if (user == u)
                {
                    found = true;
                    break;
                    //add to session
                    //send to dashboard
                }
            }
            // if no match found display error
            if (found)
                Response.Write("WELCOME!!");
            else
                Response.Write(":(");
        }


    }
}