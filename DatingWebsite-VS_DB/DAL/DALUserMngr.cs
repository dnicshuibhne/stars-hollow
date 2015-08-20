using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
//
using System.Configuration;
using System.Data.SqlClient;
using System.Data;

namespace DAL //Data Access Layer
{
    public class DALUserMngr
    {
        private const string CS_NAME = "SqlSrvrMgmtCS";
        private const string TABLE_NAME = "tblUsers";


        public int Login(string username, string password)
        {
            string conString = ConfigurationManager.ConnectionStrings["SqlSrvrMgmtCS"].ConnectionString;
            int UserID = 0;

            using (SqlConnection con = new SqlConnection(conString))
            {
                using (SqlDataAdapter adapter = new SqlDataAdapter())
                {
                    adapter.SelectCommand = new SqlCommand("spUserLogin", con);
                    adapter.SelectCommand.CommandType = CommandType.StoredProcedure;
                    
                    adapter.SelectCommand.Parameters.AddWithValue("@username",SqlDbType.NVarChar).Value = username;
                    adapter.SelectCommand.Parameters.AddWithValue("@password",SqlDbType.NVarChar).Value = password;
                    
                    con.Open();
                    SqlDataReader reader = adapter.SelectCommand.ExecuteReader();
                    if (reader.Read())
                    {
                        UserID = reader.GetInt32(0);
                    }
                }
                con.Close();
            }
            return UserID;
        }
    }
}
