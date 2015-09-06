using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
//
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace DAL
{
    class DALAttributeMngr
    {
        //private const string CS_NAME = "SqlSrvrMgmtCS";
        private const string CS_NAME = "VSProjectCS";
        private const string USER_TABLE_NAME = "UserLogin";
        private string conString;

        public DALAttributeMngr()
        {
            conString = ConfigurationManager.ConnectionStrings[CS_NAME].ConnectionString;
        }

        public DataSet DALGetAttribute(String attributeTable)
        {
            string sql = string.Format("SELECT * FROM {0}", attributeTable);
            DataSet data = new DataSet();

            using (SqlConnection con = new SqlConnection(conString))
            {
                using (SqlDataAdapter adapter = new SqlDataAdapter(sql, con))
                {
                    adapter.SelectCommand.CommandType = CommandType.Text;
                    adapter.SelectCommand.CommandText = sql;

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
    }
}
