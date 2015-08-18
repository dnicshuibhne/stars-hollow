using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebApplication1.Code
{
    public class User
    {
        public int ID { get; set; }
        public string Username { get; set; }
        public string Password { get; set; }

        public User(string Username, string Password)
        {
            this.Username = Username;
            this.Password = Password;
        }

        public User(int ID, string Username, string Password)
        {
            this.ID = ID;
            this.Username = Username;
            this.Password = Password;
        }
    }
}