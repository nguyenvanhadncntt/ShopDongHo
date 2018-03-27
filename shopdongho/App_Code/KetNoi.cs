using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls;

namespace ShopDongHo
{
    public class KetNoi
    {
        public SqlConnection sqlcon;
        public SqlDataReader rd;
        public SqlCommand cm;
        public DataTable dt;

        //public static string getconnectionstringbyname(string connectionstringname)
        //{
        //    System.Configuration.configuration rootwebconfig = system.web.configuration.webconfigurationmanager.openwebconfiguration("{0}", system.reflection.assembly.getexecutingassembly().fullname);
        //    System.configuration.connectionstringsettings constring;
        //    if (rootwebconfig.connectionstrings.connectionstrings.count > 0)
        //    {
        //        constring = rootwebconfig.connectionstrings.connectionstrings[connectionstringname];
        //        if (constring != null) return constring.connectionstring;
        //    }
        //    return "";
        //}


        public void connectDB()
        {
           // String conn = getConnectionStringByName("phukiennuConnectionString");
           // sqlcon = new SqlConnection(conn);
            sqlcon = new SqlConnection(@"Data Source=DESKTOP-899GKH5\THEHAPROK;Initial Catalog=phukiennu;Integrated Security=True");
            sqlcon.Open();
            //cm = new SqlCommand();
         //   cm.Connection = sqlcon;
            dt = new DataTable();
        }

        public void close()
        {
            sqlcon.Close();
            //cm.Dispose();
            
        }
        public DataTable loadDT(String sql) 
        {            
                connectDB();
                SqlDataAdapter adapter = new SqlDataAdapter(sql, sqlcon);
                adapter.Fill(dt);
                return dt;
                close();
                adapter.Dispose();
        }
        public SqlDataReader getReader(String sql)
        {
            connectDB();
            cm = new SqlCommand();
            cm.Connection = sqlcon;
            cm.CommandText = sql;
            rd = cm.ExecuteReader();
            return rd;
        }

        public void updateDonHang(String mahd,String email,String diachi)
        {
            
                connectDB();
                cm = new SqlCommand();
                cm.Connection = sqlcon;
                cm.CommandText = "insert into HOADON values(@mahd,@ngaymua,@email,@diachi)";
                cm.Parameters.AddWithValue("@mahd", mahd);
                cm.Parameters.AddWithValue("@ngaymua", DateTime.Now.ToShortDateString());
                cm.Parameters.AddWithValue("@email", email);
                cm.Parameters.AddWithValue("@diachi", diachi);
                cm.ExecuteNonQuery();
                close();
               // cm.Dispose();
            
        }

        public void delete(String masp)
        {
            connectDB();
            cm = new SqlCommand();
            cm.Connection = sqlcon;
            cm.CommandText = "delete from SANPHAM where MaSP='"+masp+"'";
            cm.ExecuteNonQuery();
            close();
            cm.Dispose();

        }

        public void updateSP(String a6,String a, String a1, String a2, String a3, String a4, String a5)
        {
            connectDB();
            cm = new SqlCommand();
            cm.Connection = sqlcon;
            cm.CommandText = "update SANPHAM set TenSP=@a,MaNH=@a1,ANHSP=@a2,SOLUONG=@a3,CHITIET=@a4,DONGIA=@a5 where MaSP=@a6";
            cm.Parameters.AddWithValue("@a", a);
            cm.Parameters.AddWithValue("@a1", a1);
            cm.Parameters.AddWithValue("@a2", a2);
            cm.Parameters.AddWithValue("@a3", a3);
            cm.Parameters.AddWithValue("@a4", a4);
            cm.Parameters.AddWithValue("@a5", a5);
            cm.Parameters.AddWithValue("@a6", a6);
            cm.ExecuteNonQuery();
            close();
        }

        public void insertSP(String a, String a1, String a2, String a3, String a4, String a5, String a6)
        {
            connectDB();
            cm = new SqlCommand();
            cm.Connection = sqlcon;
            cm.CommandText = "insert into SANPHAM values(@a,@a1,@a2,@a3,@a4,@a5,@a6,@a7)";
            cm.Parameters.AddWithValue("@a",a);
            cm.Parameters.AddWithValue("@a7", DateTime.Now.ToShortDateString());
            cm.Parameters.AddWithValue("@a1", a1);
            cm.Parameters.AddWithValue("@a2", a2);
            cm.Parameters.AddWithValue("@a3", a3);
            cm.Parameters.AddWithValue("@a4", a4);
            cm.Parameters.AddWithValue("@a5", a5);
            cm.Parameters.AddWithValue("@a6", a6);
            cm.ExecuteNonQuery();
            close();
            cm.Dispose();
        }

        public void upadateChiTietDonHang(String mahd,String masp,int soluong,int dongia)
        {
            try
            {
                connectDB();
                SqlCommand cmd = new SqlCommand();
                cmd.Connection = sqlcon;
                cmd.CommandText = "insert into CHITIETDH values(@mahd,@masp,@soluong,@dongia)";
                cmd.Parameters.AddWithValue("@mahd", mahd);
                cmd.Parameters.AddWithValue("@masp", masp);
                cmd.Parameters.AddWithValue("@soluong", soluong);
                cmd.Parameters.AddWithValue("@dongia", dongia);
                cmd.ExecuteNonQuery();
               // cm.Dispose();
                close();
                updateSoLuongSanPham(masp, soluong);
            }
            catch(Exception e)
            {
                Console.Write(e.StackTrace);
            }
        }
        

        public void updateSoLuongSanPham(String masp,int soluong)
        {
            connectDB();
            SqlCommand cmdh = new SqlCommand();
            cmdh.Connection = sqlcon;
            cmdh.CommandText = "update SANPHAM set SOLUONG=SOLUONG-@soluong where MaSP=@masp";
            cmdh.Parameters.AddWithValue("@masp", masp);
            cmdh.Parameters.AddWithValue("@soluong", soluong);
            cmdh.ExecuteNonQuery();
            close();
            //cm.Dispose();
        }
        public bool checkEmailExist(String email)
        {
            connectDB();
            cm = new SqlCommand("sp_checkEmail", sqlcon);
            cm.CommandType = CommandType.StoredProcedure;
            cm.Parameters.Add("@Email", SqlDbType.VarChar).Value = email;
            rd = cm.ExecuteReader();
            return rd.HasRows;
            
        }
        public void updateInformation(String email,String ten,int gt,String diachi,String sdt,String image)
        {
            connectDB();
            cm = new SqlCommand("sp_tk", sqlcon);
            cm.CommandType = CommandType.StoredProcedure;
            cm.Parameters.Add("@Email", SqlDbType.VarChar).Value = email;
            cm.Parameters.Add("@HoTen", SqlDbType.NVarChar).Value = ten;
            cm.Parameters.Add("@GioiTinh", SqlDbType.Int).Value = gt;
            cm.Parameters.Add("@DiaChi", SqlDbType.NVarChar).Value = diachi;
            cm.Parameters.Add("@SoDT", SqlDbType.VarChar).Value = sdt;
            cm.Parameters.Add("@image", SqlDbType.VarChar).Value =image;
            cm.ExecuteNonQuery();
            close();
            
        }

        public void doimk(String mk,String tk)
        {
            connectDB();
            cm = new SqlCommand();
            cm.Connection = sqlcon;
            cm.CommandText = "update TAIKHOAN set MatKhau=@mk where Email=@tk";
            cm.Parameters.AddWithValue("@mk", mk);
            cm.Parameters.AddWithValue("@tk", tk);
            cm.ExecuteNonQuery();
            close();
        }
         public void insert(String sql)
        {
            connectDB();
            cm = new SqlCommand();
            cm.CommandText = sql;
            cm.ExecuteNonQuery();
            close();
            cm.Dispose();
        }
        public void loadGridView(String sql,GridView gv)
        {
            connectDB();
            SqlDataAdapter adapter = new SqlDataAdapter(sql, sqlcon);
            adapter.Fill(dt);
            gv.DataSource = dt;
            gv.DataBind();
            close();
            adapter.Dispose();
        }
       public void loadDataList(String sql,DataList dtl)
        {
            connectDB();
            SqlDataAdapter adapter = new SqlDataAdapter(sql, sqlcon);
            adapter.Fill(dt);
            dtl.DataSource = dt;
            dtl.DataBind();
            close();
            adapter.Dispose();
        }
        public void dangKy(String email,String hoten,int gt,String diachi,String matkhau,String sodt,int quyen ,String image)
        {
            connectDB();
            cm = new SqlCommand();
            cm.Connection = sqlcon;
            cm.CommandText = "insert into TAIKHOAN values(@email,@hoten,@gt,@diachi,@matkhau,@sodt,@quyen,@image)";
            cm.Parameters.AddWithValue("@email",email);
            cm.Parameters.AddWithValue("@hoten", hoten);
            cm.Parameters.AddWithValue("@gt", gt);
            cm.Parameters.AddWithValue("@diachi", diachi);
            cm.Parameters.AddWithValue("@matkhau", matkhau);
            cm.Parameters.AddWithValue("@sodt", sodt);
            cm.Parameters.AddWithValue("@quyen", quyen);
            cm.Parameters.AddWithValue("@image", image);
            cm.ExecuteNonQuery();
            close();

            
        }
        public DataRow DR(String s)
        {
            connectDB();
            SqlDataAdapter dad = new SqlDataAdapter(s, sqlcon);
            DataSet d = new DataSet();
            dad.Fill(d);
            close();
            return d.Tables[0].Rows[0];
        }
        public SqlDataReader dangnhap(String email,String mk)
        {
            
            connectDB();
            cm = new SqlCommand();
            cm.Connection = sqlcon;
            cm.CommandText = "select * from TAIKHOAN where Email='" + email + "'";
            rd = cm.ExecuteReader();
            if (rd.HasRows)
            {
                rd.Read();
                if (mk == rd["MatKhau"].ToString())
                {
                    return rd;
                }else
                {
                    return null;
                }
            }
            close();
            rd.Close();
            return null;
        }
    }
}