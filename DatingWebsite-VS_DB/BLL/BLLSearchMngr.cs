using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
//
using DAL;
using DataModels;
using System.Collections.Specialized;
using System.Data;

namespace BLL
{
    public class BLLSearchMngr
    {
        DALSearchMngr searchManager;

        public BLLSearchMngr()
        {
            searchManager = new DALSearchMngr();
        }

        public DataTable SearchForUsers(NameValueCollection searchParams)
        {
            return searchManager.SearchForUsers(searchParams);
        }
    }
}
