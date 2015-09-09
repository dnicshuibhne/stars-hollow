using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
//
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Diagnostics;
using DataModels;

namespace DAL //Data Access Layer
{
    /* User Manager Contains methods for creating and authenticating (log in) users */
    public class DALUserMngr
    {
        private const string CS_NAME = "DatingDB";
        private const string USER_TABLE_NAME = "Users";
        private string conString;

        /* Constructor  - loads connection string from config file */
        public DALUserMngr()
        {
            conString = ConfigurationManager.ConnectionStrings[CS_NAME].ConnectionString;
        }

        /* 
         * Login Method
         * Uses stored proc in DB to verify username & password
         * If successful, the user's ID is returned
         */
        public int Login(string username, string password)
        {
            int UserID = 0;
            String proc = "spUserLogin";

            using (SqlConnection con = new SqlConnection(conString))
            {
                using (SqlDataAdapter adapter = new SqlDataAdapter())
                {
                    adapter.SelectCommand = new SqlCommand(proc, con);
                    adapter.SelectCommand.CommandType = CommandType.StoredProcedure;

                    adapter.SelectCommand.Parameters.AddWithValue("@username", SqlDbType.NVarChar).Value = username;
                    adapter.SelectCommand.Parameters.AddWithValue("@password", SqlDbType.NVarChar).Value = password;

                    con.Open();
                    using (SqlDataReader reader = adapter.SelectCommand.ExecuteReader())
                    {
                        if (reader.Read())
                        {
                            UserID = reader.GetInt32(0);
                        }
                        reader.Close();
                        con.Close();
                    }
                }
            }
            return UserID;
        }


        /* 
         * CreateUser Method
         * Uses stored proc in DB to create new user
         * If successful, the user's ID is returned
         */
        public int CreateUser(UserModel user)
        {
            int userID = 0;
            string proc = "uspAddNewUser";
            DataSet data = new DataSet();

            using (SqlConnection con = new SqlConnection(conString))
            {
                using (SqlDataAdapter adapter = new SqlDataAdapter())
                {
                    
                    adapter.SelectCommand = new SqlCommand(proc, con);
                    adapter.SelectCommand.CommandType = CommandType.StoredProcedure;

                    adapter.SelectCommand.Parameters.AddWithValue("@username", SqlDbType.NVarChar).Value = user.Username;
                    adapter.SelectCommand.Parameters.AddWithValue("@password", SqlDbType.NVarChar).Value = user.Password;
                    adapter.SelectCommand.Parameters.AddWithValue("@email", SqlDbType.NVarChar).Value = user.Email;

                    con.Open();
                    SqlDataReader reader;
                    try
                    {
                        reader = adapter.SelectCommand.ExecuteReader();

                        if (reader.Read())
                        {
                            userID = reader.GetInt32(0);
                        }
                        reader.Close();
                    }
                    catch (SqlException e)
                    {
                        userID = 0;
                    }
                    finally
                    {
                        con.Close();
                    }
                    
                }
                
            }

            return userID;
        }

        public bool userExists(string username)
        {
            string sql = "Select * from " + USER_TABLE_NAME + " where UserName=\'" + username + "\'";
            using (SqlConnection con = new SqlConnection(conString))
            {
                using (SqlDataAdapter adapter = new SqlDataAdapter())
                {
                    adapter.SelectCommand = new SqlCommand(sql, con);
                    adapter.SelectCommand.CommandType = CommandType.Text;

                    return adapter.Fill(new DataSet()) > 0;
                }
            }
        }
    }
}
