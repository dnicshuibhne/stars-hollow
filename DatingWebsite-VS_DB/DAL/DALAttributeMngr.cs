using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
// ADDED IMPORTS
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using ResourceTier;

namespace DAL // Data Access Layer
{
    public class DALAttributeMngr
    {
        /* The purpose of this class is to retrieve the attributes that users can select and search.*/
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
                    catch (SqlException e)
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

        /* Returns the ids and names of all hoby values in a dictionary*/
        public Dictionary<int, string> DALGetHobbies()
        {
            Dictionary<int, string> hobbies;

            using (SqlConnection con = new SqlConnection(conString))
            {
                using (SqlCommand cmd = new SqlCommand(Resources.GET_HOBBIES_PROC, con))
                {
                    cmd.CommandType = CommandType.StoredProcedure;

                    try
                    {
                        con.Open();
                        SqlDataReader reader = cmd.ExecuteReader();
                        hobbies = new Dictionary<int, string>();
                        while (reader.Read())
                        {
                            hobbies.Add(reader.GetInt32(0), reader.GetString(1));
                        }
                    }
                    catch (SqlException e)
                    {
                        throw;
                    }
                    finally
                    {
                        con.Close();
                    }
                }
            }
            return hobbies;
        }

        /* Returns the ids and names of all hobby values in a table*/
        public DataTable DALGetHobbiesTable()
        {
            DataTable table = null;

            using (SqlConnection con = new SqlConnection(conString))
            {
                using (SqlDataAdapter adapter = new SqlDataAdapter())
                {
                    adapter.SelectCommand = new SqlCommand(Resources.GET_HOBBIES_PROC, con);
                    adapter.SelectCommand.CommandType = CommandType.StoredProcedure;
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
                    catch (SqlException e)
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
