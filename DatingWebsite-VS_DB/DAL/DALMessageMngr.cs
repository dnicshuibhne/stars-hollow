using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
//
using System.Configuration;
using System.Data;
using DataModels;
using System.Data.SqlClient;

namespace DAL
{
    public class DALMessageMngr
    {
        private const string CS_NAME = "DatingDB";
        private string conString;

        public DALMessageMngr()
        {
            conString = ConfigurationManager.ConnectionStrings[CS_NAME].ConnectionString;
        }
        
        public DataSet getMessages(int userId)
        {
            DataSet data = null;
            String procname = "";

            using (SqlConnection con = new SqlConnection(conString))
            {
                using (SqlDataAdapter adapter = new SqlDataAdapter())
                {
                    adapter.SelectCommand = new SqlCommand(procname, con);
                    adapter.SelectCommand.CommandType = CommandType.StoredProcedure;

                    con.Open();

                    int rowsAffected = adapter.Fill(data);

                    if (rowsAffected < 1)
                    {
                        throw new Exception("");
                    }

                    con.Close();
                }
            }

            return data;
        }
    }
}
