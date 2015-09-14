using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
//
using DataModels;
using DAL;
using System.Data;
using System.Web;

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
        public int Login(string username, string password)
        {
            return DalUserManager.Login(username, password);
        }

        /*
         * Create New User Method
         * Takes a UserModel object of a new user and passes to Data Access layer
         * If User creation is succesful, a valid user id will be be retrieved, and this method returns true
         * Otherwise the id will be in valid and this method will return false;
         */
        public int CreateUser(UserModel user)
        {
            return DalUserManager.CreateUser(user);
        }

        /*
         * Check if username is available
         */
        public bool userExists(string username)
        {
            return DalUserManager.userExists(username);
        }

        public void addUserInformation(Dictionary<string,string> userAttributes)
        {
            //DalUserManager.addUserInformation(userAttributes);
        }

        public void updateUser(UserModel user)
        {
            DalUserManager.updateUser(user);
        }

        public UserModel getUser(int id)
        {
            return DalUserManager.getUser(id);
        }

        public UserModel getUser(string username)
        {
            return DalUserManager.getUser(username);
        }

    }
}
