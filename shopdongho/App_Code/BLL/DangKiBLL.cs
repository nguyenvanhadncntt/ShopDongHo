using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Collections;
using DONGHOCAOCAP.Entities;
using System.Configuration;


/// <summary>
/// Summary description for DangKiBLL
/// </summary>
public class DangKiBLL
{
    public int sp_nguoidung_them(DangKiInFo tk)
    {
        int i = 0;
        string conn = ConfigurationManager.ConnectionStrings["STR"].ToString();
        SqlConnection objConn = new SqlConnection(conn);
        objConn.Open();
        SqlCommand objComm = new SqlCommand("ThemTK", objConn);
        objComm.CommandType = CommandType.StoredProcedure;
        SqlParameter[] parms = new SqlParameter[]{
                new SqlParameter("@makhachang", SqlDbType.Int),
                new SqlParameter("@maquyen", SqlDbType.Int),
                new SqlParameter("@tendangnhap", SqlDbType.NVarChar),
                new SqlParameter("@matkhau",SqlDbType.NVarChar),                
                new SqlParameter("@hoten", SqlDbType.NVarChar),
                new SqlParameter("@diachi", SqlDbType.NVarChar),
                new SqlParameter("@sdt", SqlDbType.NVarChar),                
                new SqlParameter("@email", SqlDbType.VarChar)
            };
        parms[0].Value = tk.makhachhang;
        parms[1].Value = tk.maquyen;
        parms[2].Value = tk.tendangnhap;
        parms[3].Value = tk.matkhau;
        parms[4].Value = tk.hoten;
        parms[5].Value = tk.diachi;
        parms[6].Value = tk.sdt;
        parms[7].Value = tk.email;
        objComm.Parameters.AddRange(parms);
        i = objComm.ExecuteNonQuery();
        objConn.Close();
        return i;
    }
	public DangKiBLL()
	{
		//
		// TODO: Add constructor logic here
		//
	}
}