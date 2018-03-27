using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ShopDongHo
{
    public partial class ThongKeSoLuongBanDuoc : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            KetNoi kn = new KetNoi();
            kn.loadGridView("select ct.MaSP,s.TenSP,SUM(ct.SOLUONG) as SOLUONGBAN,s.SOLUONG as SOLUONGCONLAI from SANPHAM s join CHITIETDH ct on s.MaSP = ct.MaSP group by ct.MaSP, s.TenSP, s.SOLUONG",GridView1);
            kn.loadGridView("select TENNH,n.MaNH,SUM(s.SOLUONG) as SOLUONGCONLAI,SUM(ct.SOLUONG) as SOLUONGBAN from NHOMHANG n join SANPHAM s on n.MANH = s.MaNH join CHITIETDH ct on s.MaSP = ct.MaSP group by TENNH, n.MaNH", GridView2);
        }
    }
}