using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
//
using UserDataModel;
using DAL;
using System.Data;

namespace BLL
{
    //Business Logic Layer
    public class BLLLogin
    {
        public static UserModel Login(string username, string password)
        {
            DataSet ds = DALLogin.Login(username, password);
            //parse data set and create new user object
            return null;
        }
    }
}
