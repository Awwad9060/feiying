using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.IO;
using System.Web;

public class LogHelper
{
    public static void WriteLog(string msg)
    {
        //try
        //{

        //    string logPath = System.Web.HttpContext.Current.Server.MapPath("~/log/");
        //    if (!Directory.Exists(logPath))
        //    {
        //        Directory.CreateDirectory(logPath);
        //    }
        //    string fileName = DateTime.Now.ToString("yyyyMMdd") + ".Log";
        //    string filePath = logPath + fileName;
        //    if (!File.Exists(filePath))
        //    {
        //        File.CreateText(filePath);
        //    }
        //    System.IO.StreamWriter sw = System.IO.File.AppendText(filePath);
        //    sw.WriteLine(DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss:  ") + msg);
        //    sw.Close();
        //}
        //catch (Exception)
        //{

        //    throw;
        //}
    }
}