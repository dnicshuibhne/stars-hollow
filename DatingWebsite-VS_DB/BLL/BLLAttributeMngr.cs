using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
//
using System.Data;
using DAL;

namespace BLL
{
    public class BLLAttributeMngr
    {
        /* Attribute Table Names */
        private const string AGE_RANGE_TABLE = "AgeRange";
        private const string BUILD_TABLE = "Build";
        private const string EYE_COLOR_TABLE = "EyeColour";
        private const string GENDER_TABLE = "Gender";
        private const string HAIR_COLOR_TABLE = "HairColour";
        private const string HEIGHT_TABLE = "Height";
        private const string HOBBIES_TABLE = "Hobbies";
        private const string SEXUAL_ORIENTATION_TABLE = "SexualOrientation";

        private DALAttributeMngr DalAttributeMngr; // Database Access Layer Manager

        /* Constructor - Intialise Database Access Layer*/
        public BLLAttributeMngr()
        {
            DalAttributeMngr = new DALAttributeMngr();
        }

        /*Methods to individually retrieve specific attributes*/
        public DataSet BLLGetAgeRange() { return DalAttributeMngr.DALGetAttribute(AGE_RANGE_TABLE); }
        public DataSet BLLGetBuild() { return DalAttributeMngr.DALGetAttribute(BUILD_TABLE); }
        public DataSet BLLGetEyeColor() { return DalAttributeMngr.DALGetAttribute(EYE_COLOR_TABLE); }
        public DataSet BLLGetGenders() { return DalAttributeMngr.DALGetAttribute(GENDER_TABLE); }
        public DataSet BLLGetHairColor() { return DalAttributeMngr.DALGetAttribute(HAIR_COLOR_TABLE); }
        public DataSet BLLGetHeight() { return DalAttributeMngr.DALGetAttribute(HEIGHT_TABLE); }
        public DataSet BLLGetHobbies() { return DalAttributeMngr.DALGetAttribute(HOBBIES_TABLE); }
        public DataSet BLLGetSexualOrientation() { return DalAttributeMngr.DALGetAttribute(SEXUAL_ORIENTATION_TABLE); }
        
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
