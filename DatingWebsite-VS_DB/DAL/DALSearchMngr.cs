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

        
        /*Returns users that match any of the specified criteria*/
        public List<UserModel> SearchForUsersAny(string ageRange, string build, string county, string gender, string height, string profession, string relationshipStatus, string sexualOrientation, string town, List<string> hobbies)
        {
            List<UserModel> users = null;

            using (SqlConnection con = new SqlConnection(conString))
            {
                using(SqlCommand cmd = new SqlCommand(Resources.SEARCH_FOR_ANY_PROC,con))
                {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.Add(Resources.AGE_RANGE_PARAM, SqlDbType.NVarChar).Value = ageRange;
                        cmd.Parameters.Add(Resources.BUILD_PARAM, SqlDbType.NVarChar).Value = build;
                        cmd.Parameters.Add(Resources.COUNTY_PARAM, SqlDbType.NVarChar).Value = county;
                        cmd.Parameters.Add(Resources.GENDER_PARAM, SqlDbType.NVarChar).Value = gender;
                        cmd.Parameters.Add(Resources.HEIGHT_PARAM, SqlDbType.NVarChar).Value = height;
                        cmd.Parameters.Add(Resources.PROFESSION_PARAM, SqlDbType.NVarChar).Value = profession;
                        cmd.Parameters.Add(Resources.RELATIONSHIP_STATUS_PARAM, SqlDbType.NVarChar).Value = relationshipStatus;
                        cmd.Parameters.Add(Resources.SEXUAL_ORIENTATION_PARAM, SqlDbType.NVarChar).Value = sexualOrientation;
                        cmd.Parameters.Add(Resources.TOWN_PARAM, SqlDbType.NVarChar).Value = town;

                    try
                    {
                        con.Open();
                        using(SqlDataReader dr = cmd.ExecuteReader())
                        {
                            users = new List<UserModel>();
                            while(dr.Read())
                            {
                                UserModel user = new UserModel(dr.GetInt32((int)UserProfile.User), dr.GetString(1));
                                user.Age = dr.GetInt32((int)UserProfile.Age);
                                user.Build = dr.GetString((int)UserProfile.Build);
                                user.County = dr.GetString((int)UserProfile.County);
                                user.Ethnicity = dr.GetString((int)UserProfile.Ethnicity);
                                user.EyeColor = dr.GetString((int)UserProfile.EyeColor);
                                user.Gender = dr.GetString((int)UserProfile.Gender);
                                user.HairColor = dr.GetString((int)UserProfile.HairColor);
                                user.Height = dr.GetString((int)UserProfile.Height);
                                user.IdealDate = dr.GetString((int)UserProfile.IdealDate);
                                user.RelationshipStatus = dr.GetString((int)UserProfile.RelationshipStatus);
                                user.Profession = dr.GetString((int)UserProfile.Profession);
                                user.SexualOrientation = dr.GetString((int)UserProfile.SexualOrientation);
                                user.Town = dr.GetString((int)UserProfile.Town);
                                user.ProfilePicturePath = dr.GetString((int)UserProfile.ProfilePicturePath);
                                user.Comments = dr.GetString((int)UserProfile.Comments);
	
                                users.Add(user);
                            }
                        }

                    }
                    catch (SqlException)
                    {
                        throw;
                    }
                    finally
                    {
                        con.Close();
                    }
                }
            }
            return users;
        }

        /*Returns users that match the specified criteria exactly*/
        public List<UserModel> DALSearchForUsersExact(string ageRange, string build, string county, string gender, string height, string profession, string relationshipStatus, string sexualOrientation, string town, List<string> hobbies)
        {
            bool isAgeRange = ageRange != null && ageRange.Length > 0;
            bool isBuild = build != null && build.Length > 0;
            bool isCounty = county != null && county.Length > 0;
            bool isGender = gender != null && gender.Length > 0;
            bool isHeight = height != null && height.Length > 0;
            bool isProfession = profession != null && profession.Length > 0;
            bool isRelationshipStatus = relationshipStatus != null && relationshipStatus.Length > 0;
            bool isSexualOrientation = sexualOrientation != null && sexualOrientation.Length > 0;
            bool isTown = town != null && town.Length > 0;
            bool isHobbies = hobbies != null && hobbies.Count > 0;

            bool selectAll = !(
                isAgeRange 
                && isBuild 
                && isCounty
                && isGender
                && isHeight
                && isProfession
                && isRelationshipStatus
                && isSexualOrientation
                && isTown
                && isHobbies);

            string query;
            if (!selectAll)
            {
                query = "SELECT * FROM " + Resources.USER_INFORMATION_TABLE + " WHERE ";
                if (isAgeRange) query += Resources.AGE_RANGE_COLUMN + "=" + Resources.AGE_RANGE_PARAM + " AND ";
                if (isBuild) query += " " + Resources.BUILD_COLUMN + "=" + Resources.BUILD_PARAM + " AND ";
                if (isCounty) query += " " + Resources.COUNTY_COLUMN + "=" + Resources.BUILD_PARAM + " AND ";
                if (isGender) query += Resources.GENDER_COLUMN + "=" + Resources.GENDER_PARAM + " AND ";
                if (isHeight) query += Resources.HEIGHT_COLUMN + "=" + Resources.HEIGHT_PARAM + " AND ";
                if (isProfession) query += Resources.PROFESSION_COLUMN + "=" + Resources.PROFESSION_PARAM + " AND ";
                if (isRelationshipStatus) query += Resources.RELATIONSHIP_STATUS_COLUMN + "=" + Resources.RELATIONSHIP_STATUS_PARAM + " AND ";
                if (isSexualOrientation) query += Resources.SEXUAL_ORIENTATION_COLUMN + "=" + Resources.SEXUAL_ORIENTATION_PARAM + " AND ";
                if (isTown) query += Resources.TOWN_COLUMN + "=" + Resources.TOWN_PARAM + " AND ";

                query = query.Substring(0, query.Length - 5);
            }
            else
            {
                query = Resources.GET_ALL_USERS_PROC;
            }

            List<UserModel> users = null;

            using (SqlConnection con = new SqlConnection(conString))
            {
                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    if (!selectAll)
                    {
                        cmd.CommandType = CommandType.Text;

                        if (isAgeRange) cmd.Parameters.Add(Resources.AGE_RANGE_PARAM, SqlDbType.NVarChar).Value = ageRange;
                        if (isBuild) cmd.Parameters.Add(Resources.BUILD_PARAM, SqlDbType.NVarChar).Value = build;
                        if (isCounty) cmd.Parameters.Add(Resources.COUNTY_PARAM, SqlDbType.NVarChar).Value = county;
                        if (isGender) cmd.Parameters.Add(Resources.GENDER_PARAM, SqlDbType.NVarChar).Value = gender;
                        if (isHeight) cmd.Parameters.Add(Resources.HEIGHT_PARAM, SqlDbType.NVarChar).Value = height;
                        if (isProfession) cmd.Parameters.Add(Resources.PROFESSION_PARAM, SqlDbType.NVarChar).Value = profession;
                        if (isRelationshipStatus)  cmd.Parameters.Add(Resources.RELATIONSHIP_STATUS_PARAM, SqlDbType.NVarChar).Value = relationshipStatus;
                        if (isSexualOrientation) cmd.Parameters.Add(Resources.SEXUAL_ORIENTATION_PARAM, SqlDbType.NVarChar).Value = sexualOrientation;
                        if (isTown) cmd.Parameters.Add(Resources.TOWN_PARAM, SqlDbType.NVarChar).Value = town;
                    }
                    else
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                    }

                    try
                    {
                        con.Open();
                        using (SqlDataReader dr = cmd.ExecuteReader())
                        {
                            users = new List<UserModel>();
                            while (dr.Read())
                            {
                                UserModel user = new UserModel(dr.GetInt32((int)UserProfile.User), dr.GetString(1));
                                user.Age = dr.GetInt32((int)UserProfile.Age);
                                user.Build = dr.GetString((int)UserProfile.Build);
                                user.County = dr.GetString((int)UserProfile.County);
                                user.Ethnicity = dr.GetString((int)UserProfile.Ethnicity);
                                user.EyeColor = dr.GetString((int)UserProfile.EyeColor);
                                user.Gender = dr.GetString((int)UserProfile.Gender);
                                user.HairColor = dr.GetString((int)UserProfile.HairColor);
                                user.Height = dr.GetString((int)UserProfile.Height);
                                user.IdealDate = dr.GetString((int)UserProfile.IdealDate);
                                user.RelationshipStatus = dr.GetString((int)UserProfile.RelationshipStatus);
                                user.Profession = dr.GetString((int)UserProfile.Profession);
                                user.SexualOrientation = dr.GetString((int)UserProfile.SexualOrientation);
                                user.Town = dr.GetString((int)UserProfile.Town);
                                //user.ProfilePicturePath = dr.GetString((int)UserProfile.ProfilePicturePath);
                                //user.Comments = dr.GetString((int)UserProfile.Comments);

                                users.Add(user);
                            }
                        }

                    }
                    catch (SqlException)
                    {
                        throw;
                    }
                    finally
                    {
                        con.Close();
                    }
                }
            }
            return users;
        }

        //public DataTable SearchForUsers(NameValueCollection searchParams)
        //{
        //    List<UserModel> users = new List<UserModel>();

        //    string sql = "SELECT * FROM " + Resources.USER_INFORMATION_TABLE + " WHERE ";

        //    foreach (string key in searchParams.AllKeys)
        //    {
        //        if (key == null)
        //            break;
        //        else if (searchParams[key].Length > 1)
        //            sql += key + "='" + searchParams[key] + "' AND ";
        //        //sql += key + "='" + WebUtility.UrlDecode(searchParams[key]) + "' AND ";
        //    }
        //    sql = sql.Substring(0, sql.Length - 5);

        //    DataTable data = new DataTable();

        //    using (SqlConnection con = new SqlConnection(conString))
        //    {
        //        using (SqlDataAdapter adapter = new SqlDataAdapter())
        //        {
        //            adapter.SelectCommand = new SqlCommand(sql, con);
        //            adapter.SelectCommand.CommandType = CommandType.Text;

        //            con.Open();
        //            int rowsAffected = adapter.Fill(data);

        //            if (rowsAffected < 1)
        //            {
        //                throw new Exception("No Results Returned from table: " + Resources.USER_INFORMATION_TABLE);
        //            }
        //            con.Close();
        //        }
        //    }
        //    return data;
        //}

        //public List<UserModel> SearchForUsers(NameValueCollection searchParams, List<int> hobbies)
        //{
        //    return new List<UserModel>();
        //}

    }

}
