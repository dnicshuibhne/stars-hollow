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
    public class DALLogin
    {
        private const string CS_NAME = "SqlSrvrMgmtCS";
        private const string TABLE_NAME = "tblUsers";


        public static DataSet Login(string username, string password)
        {            
            string conString = ConfigurationManager.ConnectionStrings["SqlSrvrMgmtCS"].ConnectionString;
            using (SqlConnection con = new SqlConnection(conString))
            {
                using (SqlCommand cmd = new SqlCommand("Select * from "+TABLE_NAME+" WHERE Username='" + username + "' AND Password='" + password + "'", con))
                {
                    con.Open();
                    SqlDataReader dr = cmd.ExecuteReader();
                       // DataSet ds = dr.
                }
            }
            return null;
        }
    }
}
