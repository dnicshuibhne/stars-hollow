using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
//
using System.Data;
using DAL;
using ResourceTier;

namespace BLL
{
    public class BLLAttributeMngr
    {
        /* Attribute Table Names */

        private DALAttributeMngr DalAttributeMngr; // Database Access Layer Manager

        /* Constructor - Intialise Database Access Layer*/
        public BLLAttributeMngr()
        {
            DalAttributeMngr = new DALAttributeMngr();
        }

        /*Methods to individually retrieve specific attributes*/
        public DataSet BLLGetAgeRange() { return DalAttributeMngr.DALGetAttribute(Resources.AGE_RANGE_TABLE); }
        public DataSet BLLGetBuild() { return DalAttributeMngr.DALGetAttribute(Resources.BUILD_TABLE); }
        public DataSet BLLGetEyeColor() { return DalAttributeMngr.DALGetAttribute(Resources.EYE_COLOR_TABLE); }
        public DataSet BLLGetGenders() { return DalAttributeMngr.DALGetAttribute(Resources.GENDER_TABLE); }
        public DataSet BLLGetHairColor() { return DalAttributeMngr.DALGetAttribute(Resources.HAIR_COLOR_TABLE); }
        public DataSet BLLGetHeight() { return DalAttributeMngr.DALGetAttribute(Resources.HEIGHT_TABLE); }
        public DataSet BLLGetHobbies() { return DalAttributeMngr.DALGetAttribute(Resources.HOBBIES_TABLE); }
        public DataSet BLLGetSexualOrientation() { return DalAttributeMngr.DALGetAttribute(Resources.SEXUAL_ORIENTATION_TABLE); }
        public DataSet BLLGetRelationshipStatus() { return DalAttributeMngr.DALGetAttribute(Resources.RELATIONSHIP_STATUS_TABLE);}
        public DataSet BLLGetEthnicity() { return DalAttributeMngr.DALGetAttribute(Resources.ETHNICITY_TABLE); }
        public DataSet BLLGetCounty() { return DalAttributeMngr.DALGetAttribute(Resources.COUNTY_TABLE); }
        /* 
         * Method to return all attributes and their values
         */
        //public Dictionary<string, List<string>> BLLGetAllAttributes()
        //{
        //    DataTable dt = DalAttributeMngr.DALGetAllAttributes();

        //    Dictionary<string,List<string>> attributes;
        //    attributes = new Dictionary<string, List<string>>();

        //    for (int i = 0; i < dt.Rows.Count; i++)
        //    {
        //        Object[] objArray = dt.Rows[i].ItemArray;
        //        string key = objArray[0].ToString();
        //        string value = objArray[1].ToString();

        //        if (attributes.ContainsKey(key))
        //        {
        //            attributes[key].Add(value);
        //        }
        //        else
        //        {
        //            List<string> vals = new List<string>();
        //            vals.Add(value);
        //            attributes.Add(key, vals);
        //        }
        //    }

        //    return attributes;
        //}
    }
}
