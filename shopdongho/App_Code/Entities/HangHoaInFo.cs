using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for HangHoaInFo
/// </summary>
namespace DONGHOCAOCAP.Entities
{
    public class HangHoaInFo
    {
        int MASP;
        string TENSP;
        int MANH;
        string ANHSP;
        int SOLUONG;
        string CHITIET;
        float DONGIA;
        public int masp
        {
            get { return MASP; }
            set { MASP = value; }
        }
        public string tensp
        {
            get { return TENSP; }
            set { TENSP = value; }
        }
        public int manh
        {
            get { return MANH; }
            set { MANH = value; }
        }   
        
        public string anhsp
        {
            get { return ANHSP; }
            set { ANHSP = value; }
        }
        public int soluong
        {
            get { return SOLUONG; }
            set { SOLUONG = value; }
        }
        public string chitiet
        {
            get { return CHITIET; }
            set { CHITIET = value; }
        }
        public float dongia
        {
            get { return DONGIA; }
            set { DONGIA = value; }
        }

        public HangHoaInFo()
        {
            //
            // TODO: Add constructor logic here
            //
        }
    }
}