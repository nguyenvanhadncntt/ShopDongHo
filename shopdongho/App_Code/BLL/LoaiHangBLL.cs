using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using DONGHOCAOCAP.Entities;
using System.Collections;

/// <summary>
/// Summary description for LoaiHangBLL
/// </summary>
namespace DONGHOCAOCAP.BLL
{
    public class LoaiHangBLL
    {

        public IList select_allhoa()
        {
            ArrayList list = new ArrayList();
            string conn = ConfigurationManager.ConnectionStrings["Ketnoi"].ToString();
            SqlConnection objConn = new SqlConnection(conn);
            objConn.Open();
            SqlCommand objComm = new SqlCommand("Xem_loaihang", objConn);
            objComm.CommandType = CommandType.StoredProcedure;
            SqlDataReader dr = objComm.ExecuteReader();
            LoaiHangInfo hoa = null;
            while (dr.Read())
            {
                hoa = new LoaiHangInfo();
                if (!dr.IsDBNull(0)) hoa.maloai = dr.GetString(0);
                if (!dr.IsDBNull(1)) hoa.tenloai = dr.GetString(1);
                list.Add(hoa);
            }
            dr.Close();
            objConn.Close();
            return list;
        }

        public LoaiHangBLL()
        {
            //
            // TODO: Add constructor logic here
            //
        }
    }
}