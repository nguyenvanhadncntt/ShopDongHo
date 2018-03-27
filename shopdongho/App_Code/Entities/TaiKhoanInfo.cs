using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for TaiKhoanInfo
/// </summary>
namespace DONGHOCAOCAP.Entities
{
    public class TaiKhoanInfo
    {

        string TENDANGNHAP;
        string MATKHAU;
        public string tendangnhap
        {
            set { TENDANGNHAP = value; }
            get { return TENDANGNHAP; }
        }
        public string matkhau
        {
            set { MATKHAU = value; }
            get { return MATKHAU; }
        }
        public TaiKhoanInfo()
        {
            //
            // TODO: Add constructor logic here
            //
        }
    }
}