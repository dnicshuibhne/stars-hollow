using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Assignment.Code
{
    public class User
    {
        public string Username { get; set; }
        public string Password { get; set; }

        public User() { }
        public User(string username, string password)
        {
            Username = username;
            Password = password;
        }

        public static bool operator ==(User u1, User u2)
        {
            return (u1.Username == u2.Username) && (u1.Password == u2.Password);
        }

        public static bool operator !=(User u1, User u2)
        {
            return !(u1 == u2);
        }
    }
}