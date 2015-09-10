using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
//
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace DAL // Data Access Layer
{
    public class DALAttributeMngr
    {
        private const string CS_NAME = "DatingDB";
        private string conString;

        /* Constructor - loads connection string from config file*/
        public DALAttributeMngr()
        {
            conString = ConfigurationManager.ConnectionStrings[CS_NAME].ConnectionString;
        }

        /*
         * Gets all the values for a particular attribute
         * The input is the name of the attribute's table in the database
         */
        public DataSet DALGetAttribute(String attributeTable)
        {
            string sql = string.Format("SELECT * FROM {0}", attributeTable);
            DataSet data = new DataSet();

            using (SqlConnection con = new SqlConnection(conString))
            {
                using (SqlDataAdapter adapter = new SqlDataAdapter())
                {
                    adapter.SelectCommand = new SqlCommand(sql, con);
                    adapter.SelectCommand.CommandType = CommandType.Text;

                    con.Open();
                    int rowsAffected = adapter.Fill(data);

                    if (rowsAffected < 1)
                    {
                        throw new Exception("No Results Returned.");
                    }
                    con.Close();
                }
            }
            return data;
        }

        /*
         * Returns all the possible attributes required for registration
         * Data set is in a key - value format, where the first column is the attribute
         * and the second is the value
         */
        //public DataTable DALGetAllAttributes()
        //{
        //    string viewName = "ViewAllAttributeValues";
        //    string sql = "SELECT * FROM " + viewName;
        //    DataSet data = null;
        //    DataTable table = null;

        //    using (SqlConnection con = new SqlConnection(conString))
        //    {
        //        using(SqlDataAdapter adapter = new SqlDataAdapter())
        //        {
        //            adapter.SelectCommand = new SqlCommand(sql, con);
        //            adapter.SelectCommand.CommandType = CommandType.Text;

        //            con.Open();
        //            data = new DataSet();
        //            int rowsAffected = adapter.Fill(data);
        //            table = data.Tables[viewName];
        //            if (rowsAffected < 1 || table == null)
        //            {
        //                throw new Exception("No Results Returned.");
        //            }
        //            con.Close();
        //        }
        //    }
        //    return table;
        //}
    }
}
