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
    public class BLLUserMngr
    {
        public UserModel Login(string username, string password)
        {
            DALUserMngr m = new DALUserMngr();
            int userID = m.Login(username, password);

            UserModel user = null;
            if (userID > 0)
            {
                user = new UserModel(userID, username, password);
            }
            
            return user;
        }
    }
}
