using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for DangKiInFo
/// </summary>
namespace DONGHOCAOCAP.Entities
{
    public class DangKiInFo
    {
        int MAKHACHHANG;
        int MAQUYEN;
        string TENDANGNHAP;
        string MATKHAU;
        string HOTEN;
        string DIACHI;
        string SDT;
        string EMAIL;
        public int makhachhang
        {
            get;
            set;
        }
        public int maquyen
        {
            get;
            set;
        }
        public string tendangnhap
        {
            set {TENDANGNHAP= value; }
            get { return TENDANGNHAP; }
        }
        public string matkhau
        {
            set { MATKHAU = value; }
            get { return MATKHAU; }
        }
        public string hoten
        {
            
             set {HOTEN =value;}
             get{ return HOTEN;}
            
        }
        public string diachi
        {
            
             set {DIACHI=value;}
             get{ return DIACHI;}
            
        }

         public string sdt
        {
            
             set {SDT=value;}
             get{ return SDT;}
            
        }
         public string email
        {
            
             set {EMAIL=value;}
            get { return EMAIL; }
            
        }
        public DangKiInFo()
        {
            //
            // TODO: Add constructor logic here
            //
        }
    }
}