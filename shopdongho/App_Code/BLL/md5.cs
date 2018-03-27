﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Configuration;
/// <summary>
/// Summary description for md5
/// </summary>
public class md5
{
	public md5()
	{
		//
		// TODO: Add constructor logic here
		//
	}
    /// <summary>
    /// Mã hóa ký tự với kiểu mã hõa TripleDes - MD5
    /// </summary>
    /// <param name="key"></param>
    /// <param name="toEncrypt"></param>
    /// <returns></returns>

    public static string hmweb_Encrypt(string key, string toEncrypt)
    {
        byte[] keyArray;
        byte[] toEncryptArray = UTF8Encoding.UTF8.GetBytes(toEncrypt);
        MD5CryptoServiceProvider hashmd5 = new MD5CryptoServiceProvider();
        keyArray = hashmd5.ComputeHash(UTF8Encoding.UTF8.GetBytes(key));
        TripleDESCryptoServiceProvider tdes = new TripleDESCryptoServiceProvider();
        tdes.Key = keyArray;
        tdes.Mode = CipherMode.ECB;
        tdes.Padding = PaddingMode.PKCS7;
        ICryptoTransform cTransform = tdes.CreateEncryptor();
        byte[] resultArray = cTransform.TransformFinalBlock(toEncryptArray, 0, toEncryptArray.Length);
        return Convert.ToBase64String(resultArray, 0, resultArray.Length);
    }
    /// <summary>
    /// Giải mã dữ liệu đã mã hóa
    /// </summary>
    /// <param name="key"></param>
    /// <param name="toDecrypt"></param>
    /// <returns></returns>
    public static string hmweb_Decrypt(string key, string toDecrypt)
    {
        byte[] keyArray;
        byte[] toEncryptArray = Convert.FromBase64String(toDecrypt);
        MD5CryptoServiceProvider hashmd5 = new MD5CryptoServiceProvider();
        keyArray = hashmd5.ComputeHash(UTF8Encoding.UTF8.GetBytes(key));

        TripleDESCryptoServiceProvider tdes = new TripleDESCryptoServiceProvider();
        tdes.Key = keyArray;
        tdes.Mode = CipherMode.ECB;
        tdes.Padding = PaddingMode.PKCS7;
        ICryptoTransform cTransform = tdes.CreateDecryptor();
        byte[] resultArray = cTransform.TransformFinalBlock(toEncryptArray, 0, toEncryptArray.Length);
        return UTF8Encoding.UTF8.GetString(resultArray);
    }

}