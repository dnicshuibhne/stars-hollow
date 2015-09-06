using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
//
using UserDataModel;
using DAL;
using System.Data;

namespace BLL //Business Logic Layer
{ 
    // User Manager Contains methods for creating and validating (log in) users
    public class BLLUserMngr
    {
        private DALUserMngr DalUserManager;

        /* Constructor - initialises Data Access Layer */
        public BLLUserMngr()
        {
            DalUserManager = new DALUserMngr();
        }

        /*
         * User Login Method
         * Takes the username and password of a potentially valid user and passes to Data Access Layer for validation.
         * Sucessful validation will return a valid user id, and then this method returns a User object.
         * Unsuccessful validation will not return a valid id, and this method will return null.
         */
        public UserModel Login(string username, string password)
        {
            int userID = DalUserManager.Login(username, password);

            UserModel user = null;
            if (userID > 0)
            {
                user = new UserModel(userID, username, password);
            }

            return user;
        }

        /*
         * Create New User Method
         * Takes a UserModel object of a new user and passes to Data Access layer
         * If User creation is succesful, a valid user id will be be retrieved, and this method returns true
         * Otherwise the id will be in valid and this method will return false;
         */
        public bool CreateUser(UserModel user)
        {
            int userID = DalUserManager.CreateUser(user);

            if (userID > 0)
            {
                user.ID = userID;
                return true;
            }
            return false;
        }
    }
}
