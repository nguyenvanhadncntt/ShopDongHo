using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using DONGHOCAOCAP.Entities;
using System.Configuration;

/// <summary>
/// Summary description for TaiKhoanBLL
/// </summary>
namespace DONGHOCAOCAP.BLL
{
public class TaiKhoanBLL
{
    public bool dangNhap(TaiKhoanInfo tk)
    {
        bool ketqua = false;
        string conn = ConfigurationManager.ConnectionStrings["STR_CONN"].ToString();
        SqlConnection objConn = null;
        SqlDataReader dr = null;
        try
        {
            objConn = new SqlConnection(conn);
            objConn.Open();
            SqlCommand objComm = new SqlCommand("dangnhap", objConn);
            objComm.CommandType = CommandType.StoredProcedure;
            SqlParameter[] parms = new SqlParameter[]{
                    new SqlParameter("@username",SqlDbType.NVarChar),
                    new SqlParameter("@password", SqlDbType.NVarChar)};
            parms[0].Value = tk.tendangnhap;
            parms[1].Value = tk.matkhau;
            objComm.Parameters.AddRange(parms);
            dr = objComm.ExecuteReader();
            if (dr.Read()) ketqua = true;
        }
        finally
        {
            objConn.Close();
        }

        return ketqua;
    }
	public TaiKhoanBLL()
	{
		//
		// TODO: Add constructor logic here
		//
	}
}
}