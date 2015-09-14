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

        private List<string> GetAttributeValues(string attName)
        {
            DataRow[] rows = attributes.Select("Attribute" + " = '" + attName + "'");
            List<string> attValues = new List<string>();
            foreach (DataRow row in rows)
                attValues.Add(row[1].ToString());
            return attValues;
        }

        //private DataTable GetAttributeSubTable(string TableName)
        //{
        //    DataRow[] rows = attributes.Select("Attribute" + " = '" + TableName + "'");
        //    DataTable table = new DataTable(TableName);
        //    foreach(DataRow row in rows)
        //        table.Rows.Add(row[1].ToString());
        //    return table;
        //}

        /*Methods to individually retrieve specific attributes*/
        public List<string> BLLGetEyeColor() { return GetAttributeValues(Resources.EYE_COLOR_TABLE); }
        public List<string> BLLGetGenders() { return GetAttributeValues(Resources.GENDER_TABLE); }
        public List<string> BLLGetHairColor() { return GetAttributeValues(Resources.HAIR_COLOR_TABLE); }
        public List<string> BLLGetSexualOrientation() { return GetAttributeValues(Resources.SEXUAL_ORIENTATION_TABLE); }
        public List<string> BLLGetEthnicity() { return GetAttributeValues(Resources.ETHNICITY_TABLE); }
        public List<string> BLLGetRelationshipStatus() { return GetAttributeValues(Resources.RELATIONSHIP_STATUS_TABLE); }
        public List<string> BLLGetCounty() { return GetAttributeValues(Resources.COUNTY_TABLE); }
        public List<string> BLLGetHeight() { return GetAttributeValues(Resources.HEIGHT_TABLE); }
        public List<string> BLLGetBuild() { return GetAttributeValues(Resources.BUILD_TABLE); }
        public List<string> BLLGetAgeRange() { return GetAttributeValues(Resources.AGE_RANGE_TABLE); }

        public DataTable BLLGetHobbies() { return attributeManager.DALGetHobbies(); }

    }
}
