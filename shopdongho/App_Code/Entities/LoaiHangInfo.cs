using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for LoaiHangInfo
/// </summary>
namespace DONGHOCAOCAP.Entities
{
    public class LoaiHangInfo
    {
        string MALOAI;
        string TENLOAI;
        public string maloai
        {
            get { return MALOAI; }
            set { MALOAI = value; }
        }
        public string tenloai
        {
            get { return TENLOAI; }
            set { TENLOAI = value; }
        }
        public LoaiHangInfo(string maloai, string tenloai)
        {
            this.maloai = maloai;
            this.tenloai = tenloai;
        }
        public LoaiHangInfo()
        {
            //
            // TODO: Add constructor logic here
            //
        }
    }
}