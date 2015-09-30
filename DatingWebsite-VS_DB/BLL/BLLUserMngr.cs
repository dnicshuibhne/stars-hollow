using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
//
using DataModels;
using DAL;
using ResourceTier;
using System.Data;
using System.Web.SessionState;

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
        public int BLLLogin(string username, string password)
        {
            return DalUserManager.DALLogin(username, password);
        }

        /*
         * Create New User Method
         * Takes a UserModel object of a new user and passes to Data Access layer
         * If User creation is succesful, a valid user id will be be retrieved, and this method returns true
         * Otherwise the id will be in valid and this method will return false;
         */
        public int BLLCreateUser(string username, string email, string password)
        {
            return DalUserManager.DALCreateUser(username, email, password);
        }

        /*
         * Check if username is available
         */
        public bool BLLUserExists(string username)
        {
            return DalUserManager.DALUserExists(username);
        }

        //public void BLLAddUserInformation(Dictionary<string, string> userAttributes)
        //{
        //    DalUserManager.addUserInformation(userAttributes);
        //}

        public void BLLUpdateUser(UserModel user)
        {
            DalUserManager.DALUpdateUserDetails(user);
        }

        public void BLLUpdateUserEmail(UserModel selectedUser)
        {
            DalUserManager.DALUpdateUserEmail(selectedUser);
        }

        public void BLLUpdateUserPassword(String password)
        {
            DalUserManager.DALUpdateUserPassword(password);
        }

        public UserModel BLLGetUser(int id)
        {
            return DalUserManager.DALGetUser(id);
        }

        public UserModel BLLGetUser(string username)
        {
            return DalUserManager.DALGetUser(username);
        }

        public void BLLSetHobbies(UserModel user)
        {
            DalUserManager.DALSetHobbies(user);
        }

        public Dictionary<int, string> BLLGetHobbies(int id)
        {
            return DalUserManager.DALGetUserHobbies(id);
        }

        public DataTable BLLGetHobbiesTable(int id)
        {
            return DalUserManager.DALGetUserHobbiesTable(id);
        }


        /*
         * Obtains User from Session
         */
        public UserModel BLLGetCurrentUser(HttpSessionState Session)
        {
            return (UserModel)Session.Contents[Resources.USER_SESSION_STATE];
        }

    }
}
