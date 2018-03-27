using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ShopDongHo
{
    public partial class QuanLy_SP : System.Web.UI.Page
    {
        KetNoi kn;
        DataTable dt;
        protected void Page_Load(object sender, EventArgs e)
        {
                kn = new KetNoi();
            if (!IsPostBack)
            {
                // kn.loadGridView("select * from SANPHAM", GridView1);
                load("select * from SANPHAM");
                loadDDL();
            }
        }

        public void load(String sql)
        {
            DataTable dt = kn.loadDT(sql);
            Session["dt"] = dt;
            GridView1.DataSource = dt;
            GridView1.DataBind();
           
        }
      
        protected void bt_capnhat_Click(object sender, EventArgs e)
        {
            if (txt_masp.Text.Trim() != "" && txt_tensp.Text.Trim() != "" && txt_soluong.Text.Trim() != "" && txt_chitiet.Text.Trim() != "" && txt_dongia.Text.Trim() != "")
            {
                try
                {
                    if (ful_anhsp.HasFiles) {
                        String s = ful_anhsp.FileName;
                        String duoi = Path.GetExtension(s);
                        if (duoi == ".png" || duoi == ".gif" || duoi == ".jpg" || duoi == ".jpeg" || duoi == ".bmp")
                        {
                            kn.updateSP(txt_masp.Text.Trim(), txt_tensp.Text.Trim(), drp_nhomhang.SelectedValue.ToString(), "~/ images / sanpham / " + ful_anhsp.FileName, txt_soluong.Text.Trim(), txt_chitiet.Text.Trim(), txt_dongia.Text.Trim());
                            ful_anhsp.SaveAs(MapPath("~/images/sanpham/") + ful_anhsp.FileName);
                            lbl_thongbao.Text = "Cập nhập sản phẩm thành công";
                            load("select * from SANPHAM");
                        }
                    }else
                    {
                        kn.updateSP(txt_masp.Text.Trim(), txt_tensp.Text.Trim(), drp_nhomhang.SelectedValue.ToString(), Session["hinhanh_SP"].ToString(), txt_soluong.Text.Trim(), txt_chitiet.Text.Trim(), txt_dongia.Text.Trim());
                        lbl_thongbao.Text = "Cập nhập sản phẩm thành công";
                        load("select * from SANPHAM");
                    }

            }
                  catch (Exception exx)
            {
                lbl_thongbao.Text = exx.StackTrace;
            }
        }
            else
            {
                lbl_thongbao.Text = "Hãy nhập đủ thông tin để thêm sản phẩm";
            }
        }

        protected void bt_themnh_Click(object sender, EventArgs e)
        {
            if (tb_mn.Text.Trim() != "" && tb_tn.Text.Trim() != "")
            {
                kn.insert("insert into NHOMHANG values('" + int.Parse(tb_mn.Text.Trim()) + "','" + tb_tn.Text.Trim() + "')");
                tb.Text = "Bạn đã thêm mới nhóm thành công";
                
            }
            else
            {
                tb.Text = "Phải nhập đầy đủ thông tin của nhóm";
            }
        }

        protected void btn_cancel_Click(object sender, EventArgs e)
        {
            panel_nhom.Visible = false;
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            panel_nhom.Visible = true;
        }

        protected void bt_them_Click(object sender, EventArgs e)
        {
            if (txt_masp.Text.Trim() != "" && txt_tensp.Text.Trim() != "" && ful_anhsp.HasFiles && txt_soluong.Text.Trim()!="" && txt_chitiet.Text.Trim()!="" && txt_dongia.Text.Trim()!="")
            {
                try
                {
                    String s = ful_anhsp.FileName;
                    String duoi = Path.GetExtension(s);
                if (duoi == ".png" || duoi == ".gif" || duoi == ".jpg" || duoi == ".jpeg" || duoi == ".bmp")
                {
                    kn.insertSP(txt_masp.Text.Trim() , txt_tensp.Text.Trim() , drp_nhomhang.SelectedValue.ToString() , "~/images/sanpham/" + ful_anhsp.FileName , txt_soluong.Text.Trim() ,txt_chitiet.Text.Trim(),txt_dongia.Text.Trim());
                    ful_anhsp.SaveAs(MapPath("~/images/sanpham/") +ful_anhsp.FileName);
                    lbl_thongbao.Text = "Thêm sản phẩm thành công";
                    load("select * from SANPHAM");
                    }
                }
                catch (Exception exx)
                {
                    lbl_thongbao.Text = exx.StackTrace;
                }
            }
            else
            {
                lbl_thongbao.Text = "Hãy nhập đủ thông tin để thêm sản phẩm";
            }
        }

        protected void bt_up_Click(object sender, EventArgs e)
        {
            try
            {
                if (txt_masp.Text.Trim() != "")
                {
                    kn.delete(txt_masp.Text.Trim());
                    lbl_thongbao.Text = "Xóa sản phẩm thành công";
                    load("select * from SANPHAM");
                }
                else
                {
                    lbl_thongbao.Text = "Chưa nhập mã sản phẩm muốn xóa";
                }
            }catch(Exception exx)
            {
                lbl_thongbao.Text = exx.StackTrace;
            }
        }

        public void loadDDL()
        {
            SqlDataReader read = kn.getReader("select TENNH,MANH from NHOMHANG");
            drp_nhomhang.Items.Clear();
            while (read.Read())
            {
                ListItem item = new ListItem();
                item.Text = read.GetString(0)+" Mã nhóm: "+ read.GetInt32(1).ToString();
                item.Value = read.GetInt32(1).ToString();
                drp_nhomhang.Items.Add(item);
            }
        }
        protected void bt_tim_Click(object sender, EventArgs e)
        {
            if (btn_tk.Text.Trim() != "")
            {
               load("select * from SANPHAM where TenSP like '%" + btn_tk.Text.Trim() + "%'");             
            }
        }

        protected void select(object sender, GridViewSelectEventArgs e)
        {
            int index = e.NewSelectedIndex;
            txt_masp.Text = GridView1.Rows[index].Cells[0].Text;
            txt_tensp.Text = GridView1.Rows[index].Cells[1].Text;
            txt_soluong.Text = GridView1.Rows[index].Cells[3].Text;
            txt_chitiet.Text =GridView1.Rows[index].Cells[4].Text;
            txt_dongia.Text = GridView1.Rows[index].Cells[5].Text;
            Session["hinhanh_SP"]= GridView1.Rows[index].Cells[7].Text;        
        }

        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            dt = (DataTable)Session["dt"];
            int pageIndex = e.NewPageIndex;
            GridView1.DataSource = dt;
            if (pageIndex >= 0)
                GridView1.PageIndex = pageIndex;
            GridView1.DataBind();
        }
    }
}