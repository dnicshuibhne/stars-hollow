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
            int userID = new DALUserMngr().Login(username, password);

            UserModel user = null;
            if (userID > 0)
            {
                user = new UserModel(userID, username, password);
            }

            return user;
        }

        public bool CreateUser(UserModel user)
        {
            int userID = new DALUserMngr().CreateUser(user);

            if (userID > 0)
            {
                user.ID = userID;
                return true;
            }
            return false;
        }
    }
}
