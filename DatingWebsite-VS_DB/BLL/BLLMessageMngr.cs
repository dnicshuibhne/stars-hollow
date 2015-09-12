using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
//
using DAL;
using System.Data;
using DataModels;

namespace BLL
{
    public class BLLMessageMngr
    {
        DALMessageMngr messageManager;

        public BLLMessageMngr()
        {
            messageManager = new DALMessageMngr();
        }
        public DataSet getMessages(int userId)
        {
            return messageManager.getMessages(userId);
        }
        public DataSet getMessages(UserModel user)
        {
            return messageManager.getMessages(user.ID);
        }
    }
}
