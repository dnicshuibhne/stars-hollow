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
        private const string AGE_RANGE_TABLE = "AgeRange";
        private const string BUILD_TABLE = "Build";
        private const string EYE_COLOR_TABLE = "EyeColour";
        private const string GENDER_TABLE = "Gender";
        private const string HAIR_COLOR_TABLE = "HairColour";
        private const string HEIGHT_TABLE = "Height";
        private const string HOBBIES_TABLE = "Hobbies";
        private const string SEXUAL_ORIENTATION_TABLE = "SexualOrientation";

        public DataSet BLLGetAgeRange() { return new DALUserMngr().DALGetAttribute(AGE_RANGE_TABLE); }
        public DataSet BLLGetBuild() { return new DALUserMngr().DALGetAttribute(BUILD_TABLE); }
        public DataSet BLLGetEyeColor() { return new DALUserMngr().DALGetAttribute(EYE_COLOR_TABLE); }
        public DataSet BLLGetGenders() { return new DALUserMngr().DALGetAttribute(GENDER_TABLE); }
        public DataSet BLLGetHairColor() { return new DALUserMngr().DALGetAttribute(HAIR_COLOR_TABLE); }
        public DataSet BLLGetHeight() { return new DALUserMngr().DALGetAttribute(HEIGHT_TABLE); }
        public DataSet BLLGetHobbies() { return new DALUserMngr().DALGetAttribute(HOBBIES_TABLE); }
        public DataSet BLLGetSexualOrientation() { return new DALUserMngr().DALGetAttribute(SEXUAL_ORIENTATION_TABLE); }

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
