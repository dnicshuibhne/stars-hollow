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
using UserDataModel;

namespace DAL //Data Access Layer
{
    public class DALUserMngr
    {
        //private const string CS_NAME = "SqlSrvrMgmtCS";
        private const string CS_NAME = "VSProjectCS";
        private const string USER_TABLE_NAME = "UserLogin";
        private string conString;

        public DALUserMngr()
        {
            conString = ConfigurationManager.ConnectionStrings[CS_NAME].ConnectionString;
        }

        public int Login(string username, string password)
        {
            int UserID = 0;

            using (SqlConnection con = new SqlConnection(conString))
            {
                using (SqlDataAdapter adapter = new SqlDataAdapter())
                {
                    adapter.SelectCommand = new SqlCommand("spUserLogin", con);
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

        public int CreateUser(UserModel user)
        {
            int userID = 0;
            string sql = "";
            DataSet data = new DataSet();

            using (SqlConnection con = new SqlConnection(conString))
            {
                using (SqlDataAdapter adapter = new SqlDataAdapter(sql, con))
                {
                    adapter.Fill(data);
                }
            }

            return userID;
        }
    }
}
