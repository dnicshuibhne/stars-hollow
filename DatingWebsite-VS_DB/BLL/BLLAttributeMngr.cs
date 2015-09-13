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

        private DALAttributeMngr attributeManager; // Database Access Layer Manager
        private DataTable attributes;
        public DataTable Attributes { get { return attributes; } }

        /* Constructor - Intialise Database Access Layer*/
        public BLLAttributeMngr()
        {
            attributeManager = new DALAttributeMngr();
            attributes = attributeManager.Attributes;
        }

        private DataTable GetAttributeSubTable(String TableName)
        {
            return attributes.Select(Resources.ATTRIBUTE_VIEW_ATTRIBUTE_COLUMN + "=" + TableName)[0].Table; 
        }

        /*Methods to individually retrieve specific attributes*/
        public DataTable BLLGetAgeRange() { return GetAttributeSubTable(Resources.AGE_RANGE_TABLE); }
        public DataTable BLLGetBuild() { return GetAttributeSubTable(Resources.AGE_RANGE_TABLE); }
        public DataTable BLLGetEyeColor() { return GetAttributeSubTable(Resources.EYE_COLOR_TABLE); }
        public DataTable BLLGetGenders() { return GetAttributeSubTable(Resources.GENDER_TABLE); }
        public DataTable BLLGetHairColor() { return GetAttributeSubTable(Resources.HAIR_COLOR_TABLE); }
        public DataTable BLLGetHeight() { return GetAttributeSubTable(Resources.HEIGHT_TABLE); }
        public DataTable BLLGetHobbies() { return GetAttributeSubTable(Resources.HOBBIES_TABLE); }
        public DataTable BLLGetSexualOrientation() { return GetAttributeSubTable(Resources.SEXUAL_ORIENTATION_TABLE); }
        public DataTable BLLGetEthnicity() { return GetAttributeSubTable(Resources.ETHNICITY_TABLE); }
        public DataTable BLLGetRelationshipStatus() { return GetAttributeSubTable(Resources.RELATIONSHIP_STATUS_TABLE); }
        public DataTable BLLGetCounty() { return GetAttributeSubTable(Resources.COUNTY_TABLE); }
        /* 
         * Method to return all attributes and their values
         */
        //public Dictionary<string, List<string>> BLLGetAllAttributes()
        //{
        //    DataTable dt = attributeManager.DALGetAllAttributes();

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
