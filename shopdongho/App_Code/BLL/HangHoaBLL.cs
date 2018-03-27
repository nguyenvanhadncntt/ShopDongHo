using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using DONGHOCAOCAP.Entities;
using System.Collections;
using System.Configuration;

/// <summary>
/// Summary description for HangHoaBLL
/// </summary>
namespace DONGHOCAOCAP.BLL
{
    public class HangHoaBLL
    {
        public IList select_allhanghoa()
        {
            ArrayList list = new ArrayList();

            string conn = ConfigurationManager.ConnectionStrings["STR"].ToString();
            SqlConnection objConn = new SqlConnection(conn);
            objConn.Open();

            SqlCommand objComm = new SqlCommand("sp_Xemhanghoa", objConn);
            objComm.CommandType = CommandType.StoredProcedure;

            SqlDataReader dr = objComm.ExecuteReader();
            HangHoaInFo hoa = null;
            while (dr.Read())
            {
                hoa = new HangHoaInFo();
                if (!dr.IsDBNull(0)) hoa.masp = dr.GetInt32(1);
                if (!dr.IsDBNull(1)) hoa.tensp = dr.GetString(1);
                if (!dr.IsDBNull(2)) hoa.manh = dr.GetInt32(2);
                if (!dr.IsDBNull(3)) hoa.anhsp = dr.GetString(3);
                if (!dr.IsDBNull(4)) hoa.anhsp = dr.GetString(4);
                if (!dr.IsDBNull(5)) hoa.soluong = dr.GetInt32(6);
                if (!dr.IsDBNull(6)) hoa.chitiet = dr.GetString(6);
                if (!dr.IsDBNull(6)) hoa.dongia = dr.GetFloat(6);

                list.Add(hoa);
            }
            dr.Close();
            objConn.Close();


            return list;
        }
        public IList select_HangHoa()
        {
            ArrayList list = new ArrayList();

            string conn = ConfigurationManager.ConnectionStrings["STR"].ToString();
            SqlConnection objConn = new SqlConnection(conn);
            objConn.Open();

            SqlCommand objComm = new SqlCommand("sp_hanghoa_xemhanghoa", objConn);
            objComm.CommandType = CommandType.StoredProcedure;

            SqlDataReader dr = objComm.ExecuteReader();
            HangHoaInFo hoa = null;
            while (dr.Read())
            {
                hoa = new HangHoaInFo();
                if (!dr.IsDBNull(0)) hoa.masp = dr.GetInt32(1);
                if (!dr.IsDBNull(1)) hoa.tensp = dr.GetString(1);
                if (!dr.IsDBNull(2)) hoa.manh = dr.GetInt32(2);
                if (!dr.IsDBNull(3)) hoa.anhsp = dr.GetString(3);
                if (!dr.IsDBNull(4)) hoa.anhsp = dr.GetString(4);
                if (!dr.IsDBNull(5)) hoa.soluong = dr.GetInt32(6);
                if (!dr.IsDBNull(6)) hoa.chitiet = dr.GetString(6);
                if (!dr.IsDBNull(6)) hoa.dongia = dr.GetFloat(6);

                list.Add(hoa);
            }
            dr.Close();
            objConn.Close();


            return list;
        }
        public HangHoaInFo select_hanghoa(int masp)
        {
            HangHoaInFo hoa = null;
            string conn = ConfigurationManager.ConnectionStrings["STR"].ToString();
            SqlConnection objConn = new SqlConnection(conn);
            objConn.Open();

            SqlCommand objComm = new SqlCommand("select_hanghoa", objConn);
            objComm.CommandType = CommandType.StoredProcedure;

            SqlParameter[] parms = new SqlParameter[]{
                new SqlParameter("@masp", SqlDbType.Int)};

            parms[0].Value = masp;
            objComm.Parameters.AddRange(parms);
            SqlDataReader dr = objComm.ExecuteReader();
            hoa = new HangHoaInFo();
            while (dr.Read())
            {
                hoa = new HangHoaInFo();
                if (!dr.IsDBNull(0)) hoa.masp = dr.GetInt32(1);
                if (!dr.IsDBNull(1)) hoa.tensp = dr.GetString(1);
                if (!dr.IsDBNull(2)) hoa.manh = dr.GetInt32(2);
                if (!dr.IsDBNull(3)) hoa.anhsp = dr.GetString(3);
                if (!dr.IsDBNull(4)) hoa.anhsp = dr.GetString(4);
                if (!dr.IsDBNull(5)) hoa.soluong = dr.GetInt32(6);
                if (!dr.IsDBNull(6)) hoa.chitiet = dr.GetString(6);
                if (!dr.IsDBNull(6)) hoa.dongia = dr.GetFloat(6);
            }

            return hoa;
        }
        public int insertLoai(LoaiHangInfo loaihang)
        {
            int i = 0;
            string conn = ConfigurationManager.ConnectionStrings["STR"].ToString();
            SqlConnection objConn = new SqlConnection(conn);
            objConn.Open();
            SqlCommand objComm = new SqlCommand("insert_loaihanghoa1", objConn);
            objComm.CommandType = CommandType.StoredProcedure;
            SqlParameter[] parms = new SqlParameter[]{
                  new SqlParameter("@maloai", SqlDbType.Int),
                new SqlParameter("@tenloai", SqlDbType.NVarChar)};
            parms[0].Value = loaihang.maloai;
            parms[1].Value = loaihang.tenloai;
            objComm.Parameters.AddRange(parms);
            i = objComm.ExecuteNonQuery();
            objConn.Close();
            return i;
        }
        public HangHoaBLL()
        {
            //
            // TODO: Add constructor logic here
            //
        }
    }
}