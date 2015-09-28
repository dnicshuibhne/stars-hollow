using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
//
using DAL;
using DataModels;
using System.Collections.Specialized;
using System.Data;

namespace BLL
{
    public class BLLSearchMngr
    {
        DALSearchMngr searchManager;

        public BLLSearchMngr()
        {
            searchManager = new DALSearchMngr();
        }

        public List<UserModel> BLLSearchForUsersExact(string ageRange, string build, string county, string gender, string height, string profession, string relationshipStatus, string sexualOrientation, string town, List<string> hobbies)
        {
            return searchManager.DALSearchForUsersExact(ageRange, build, county, gender, height, profession, relationshipStatus, sexualOrientation, town, hobbies);
        }
    }
}
