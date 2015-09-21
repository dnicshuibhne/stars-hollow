using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
//
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using ResourceTier;

namespace DAL // Data Access Layer
{
    public class DALAttributeMngr
    {
        private string conString;
        private DataTable attributes;
        public DataTable Attributes { get { return attributes; } }

        /* Constructor - loads connection string from config file*/
        public DALAttributeMngr()
        {
            conString = ConfigurationManager.ConnectionStrings[Resources.CS_NAME].ConnectionString;
            attributes = DALGetAllAttributes();
        }

        /*
         * Gets all the values for a particular attribute
         * The input is the name of the attribute's table in the database
         */
        //public DataTable DALGetAttribute(String attributeTable)
        //{
        //    string sql = string.Format("SELECT * FROM {0}", attributeTable);
        //    DataTable data = new DataTable();

        //    using (SqlConnection con = new SqlConnection(conString))
        //    {
        //        using (SqlDataAdapter adapter = new SqlDataAdapter())
        //        {
        //            adapter.SelectCommand = new SqlCommand(sql, con);
        //            adapter.SelectCommand.CommandType = CommandType.Text;

        //            con.Open();
        //            int rowsAffected = adapter.Fill(data);

        //            if (rowsAffected < 1)
        //            {
        //                throw new Exception("No Results Returned from table: " + attributeTable);
        //            }
        //            con.Close();
        //        }
        //    }
        //    return data;
        //}

        /*
         * Returns all the possible attributes required for registration
         * Data set is in a key - value format, where the first column is the attribute
         * and the second is the value
         */
        private DataTable DALGetAllAttributes()
        {
            string viewName = "ViewAllAttributeValues";
            string sql = "SELECT * FROM " + viewName;
            DataTable table = null;

            using (SqlConnection con = new SqlConnection(conString))
            {
                using (SqlDataAdapter adapter = new SqlDataAdapter())
                {
                    adapter.SelectCommand = new SqlCommand(sql, con);
                    adapter.SelectCommand.CommandType = CommandType.Text;
                    try
                    {
                        con.Open();
                        table = new DataTable();
                        int rowsAffected = adapter.Fill(table);
                        if (rowsAffected < 1 || table == null)
                        {
                            throw new Exception("No Results Returned.");
                        }
                    }
                    catch (SqlException)
                    {
                        throw;
                    }
                    finally
                    {
                        con.Close();
                    }
                }
            }
            return table;
        }
        public DataTable DALGetHobbies()
        {
            string sql = "SELECT * FROM " + Resources.HOBBIES_TABLE;
            DataTable table = null;

            using (SqlConnection con = new SqlConnection(conString))
            {
                using (SqlDataAdapter adapter = new SqlDataAdapter())
                {
                    adapter.SelectCommand = new SqlCommand(sql, con);
                    adapter.SelectCommand.CommandType = CommandType.Text;
                    try
                    {
                        con.Open();
                        table = new DataTable();
                        int rowsAffected = adapter.Fill(table);
                        if (rowsAffected < 1 || table == null)
                        {
                            throw new Exception("No Results Returned.");
                        }
                    }
                    catch (SqlException)
                    {
                        throw;
                    }
                    finally
                    {
                        con.Close();
                    }
                }
            }
            return table;
        }

    }
}
