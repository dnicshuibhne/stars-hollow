using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
//
using DataModels;
using System.Collections.Specialized;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using ResourceTier;
using System.Net;

namespace DAL
{
    public class DALSearchMngr
    {
        private string conString;
        public DALSearchMngr()
        {
            conString = ConfigurationManager.ConnectionStrings[Resources.CS_NAME].ConnectionString;
        }

        public DataTable SearchForUsers(NameValueCollection searchParams)
        {
            List < UserModel > users = new List<UserModel>();

            string sql = "SELECT * FROM "+Resources.USER_INFORMATION_TABLE+ " WHERE ";

            foreach (string key in searchParams.AllKeys)
            {
                if (key == null)
                    break;
                else if (searchParams[key].Length > 1)
                    sql += key + "='" + searchParams[key] + "' AND ";
                    //sql += key + "='" + WebUtility.UrlDecode(searchParams[key]) + "' AND ";
            }
            sql = sql.Substring(0, sql.Length - 5);

            DataTable data = new DataTable();

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
                        throw new Exception("No Results Returned from table: " + Resources.USER_INFORMATION_TABLE);
                    }
                    con.Close();
                }
            }
            return data;
        }
        public List<UserModel> SearchForUsers(NameValueCollection searchParams, List<int> hobbies)
        {
            return new List<UserModel>();
        }
    }

}
