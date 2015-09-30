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
        /* Provides methods for returning users based on given criteria */

        private string conString;
        public DALSearchMngr()
        {
            conString = ConfigurationManager.ConnectionStrings[Resources.CS_NAME].ConnectionString;
        }

        /*Returns users that match the specified criteria exactly*/
        public List<UserModel> DALSearchForUsersExact(string ageRange, string build, string county, string gender, string height, string profession, string relationshipStatus, string sexualOrientation, string town, List<int> hobbies)
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
                || isBuild 
                || isCounty
                || isGender
                || isHeight
                || isProfession
                || isRelationshipStatus
                || isSexualOrientation
                || isTown
                || isHobbies);

            string query;
            if (!selectAll)
            {
                int paramVal = 0;
                query = "SELECT Users.UserID, Users.Username, Age, Build, County, Ethnicity, EyeColor, Gender, HairColor, Height, IdealDate, RelationshipStatus, Profession, SexualOrientation, Town, ProfilePicturePath, Comments "
                    + " FROM " + Resources.USER_INFORMATION_TABLE
                    + " INNER JOIN dbo.Users ON UserInformation.UserID = Users.UserID"
                    + " INNER JOIN UserHobbies ON UserInformation.UserID = UserHobbies.UserID"
                    + " WHERE ";

                if (isAgeRange) query += Resources.AGE_RANGE_COLUMN + "=@"+paramVal++.ToString() + " AND ";
                if (isBuild) query += " " + Resources.BUILD_COLUMN + "=@" + paramVal++.ToString() + " AND ";
                if (isCounty) query += " " + Resources.COUNTY_COLUMN + "=@" + paramVal++.ToString() + " AND ";
                if (isGender) query += Resources.GENDER_COLUMN + "=@" + paramVal++.ToString() + " AND ";
                if (isHeight) query += Resources.HEIGHT_COLUMN + "=@" + paramVal++.ToString() + " AND ";
                if (isProfession) query += Resources.PROFESSION_COLUMN + "=@" + paramVal++.ToString() + " AND ";
                if (isRelationshipStatus) query += Resources.RELATIONSHIP_STATUS_COLUMN + "=@" + paramVal++.ToString() + " AND ";
                if (isSexualOrientation) query += Resources.SEXUAL_ORIENTATION_COLUMN + "=@" + paramVal++.ToString() + " AND ";
                if (isTown) query += Resources.TOWN_COLUMN + "=@" + paramVal++.ToString() + " AND ";

                if (hobbies != null && hobbies.Count > 0)
                {
                    query += "(";
                    
                    foreach(int hobbyID in hobbies)
                    {
                        query += string.Format("UserHobbies.HobbyID = @{0} OR ", paramVal++);
                    }
                    query = query.Substring(0, query.Length - 3);
                    query += ")";
                }

                else
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
                        int paramVal = 0;
                        if (isAgeRange) cmd.Parameters.Add(paramVal++.ToString(), SqlDbType.NVarChar).Value = ageRange;
                        if (isBuild) cmd.Parameters.Add(paramVal++.ToString(), SqlDbType.NVarChar).Value = build;
                        if (isCounty) cmd.Parameters.Add(paramVal++.ToString(), SqlDbType.NVarChar).Value = county;
                        if (isGender) cmd.Parameters.Add(paramVal++.ToString(), SqlDbType.NVarChar).Value = gender;
                        if (isHeight) cmd.Parameters.Add(paramVal++.ToString(), SqlDbType.NVarChar).Value = height;
                        if (isProfession) cmd.Parameters.Add(paramVal++.ToString(), SqlDbType.NVarChar).Value = profession;
                        if (isRelationshipStatus) cmd.Parameters.Add(paramVal++.ToString(), SqlDbType.NVarChar).Value = relationshipStatus;
                        if (isSexualOrientation) cmd.Parameters.Add(paramVal++.ToString(), SqlDbType.NVarChar).Value = sexualOrientation;
                        if (isTown) cmd.Parameters.Add(paramVal++.ToString(), SqlDbType.NVarChar).Value = town;

                        if (hobbies != null && hobbies.Count > 0)
                        {
                            foreach (int hobbyID in hobbies)
                            {
                                cmd.Parameters.Add(paramVal++.ToString(), SqlDbType.Int).Value = hobbyID;
                            }
                        }
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
                                if (!dr.IsDBNull((int)UserProfile.Age)) user.Age = dr.GetInt32((int)UserProfile.Age);
                                if (!dr.IsDBNull((int)UserProfile.Build)) user.Build = dr.GetString((int)UserProfile.Build);
                                if (!dr.IsDBNull((int)UserProfile.County)) user.County = dr.GetString((int)UserProfile.County);
                                if (!dr.IsDBNull((int)UserProfile.Ethnicity)) user.Ethnicity = dr.GetString((int)UserProfile.Ethnicity);
                                if (!dr.IsDBNull((int)UserProfile.EyeColor)) user.EyeColor = dr.GetString((int)UserProfile.EyeColor);
                                if (!dr.IsDBNull((int)UserProfile.Gender)) user.Gender = dr.GetString((int)UserProfile.Gender);
                                if (!dr.IsDBNull((int)UserProfile.HairColor)) user.HairColor = dr.GetString((int)UserProfile.HairColor);
                                if (!dr.IsDBNull((int)UserProfile.Height)) user.Height = dr.GetString((int)UserProfile.Height);
                                if (!dr.IsDBNull((int)UserProfile.IdealDate)) user.IdealDate = dr.GetString((int)UserProfile.IdealDate);
                                if (!dr.IsDBNull((int)UserProfile.RelationshipStatus)) user.RelationshipStatus = dr.GetString((int)UserProfile.RelationshipStatus);
                                if (!dr.IsDBNull((int)UserProfile.Profession)) user.Profession = dr.GetString((int)UserProfile.Profession);
                                if (!dr.IsDBNull((int)UserProfile.SexualOrientation)) user.SexualOrientation = dr.GetString((int)UserProfile.SexualOrientation);
                                if (!dr.IsDBNull((int)UserProfile.Town)) user.Town = dr.GetString((int)UserProfile.Town);
                                //if (!dr.IsDBNull((int)UserProfile.ProfilePicturePath)) user.ProfilePicturePath = dr.GetString((int)UserProfile.ProfilePicturePath);
                                //if (!dr.IsDBNull((int)UserProfile.Comments)) user.Comments = dr.GetString((int)UserProfile.Comments);

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

        /*Returns users that match any of the specified criteria*/
        public List<UserModel> SearchForUsersAny(string ageRange, string build, string county, string gender, string height, string profession, string relationshipStatus, string sexualOrientation, string town, List<string> hobbies)
        {
            List<UserModel> users = null;

            using (SqlConnection con = new SqlConnection(conString))
            {
                using (SqlCommand cmd = new SqlCommand(Resources.SEARCH_FOR_ANY_PROC, con))
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
    }

}
