using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.IO;

public partial class fileload : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.QueryString["path"] == null)
            return;
        string path=Request.QueryString["path"];
        if(string.IsNullOrEmpty(path))
            return;
        this.fileLoad3(path);
    }

    void fileLoad(string path)
    {
        string filepath = Server.MapPath(path);
        string filename = System.IO.Path.GetFileName(path);
        Response.ContentType = "application/x-zip-compressed";
        Response.AddHeader("Content-Disposition", "attachment;filename=" + filename);
        Response.TransmitFile(filepath);
    }

    void fileLoad2(string path)
    {
        string filepath = Server.MapPath(path);
        string filename = System.IO.Path.GetFileName(path);

        //以字符流的形式下载文件
        FileStream fs = new FileStream(filepath, FileMode.Open);
        byte[] bytes = new byte[(int)fs.Length];
        fs.Read(bytes, 0, bytes.Length);
        fs.Close();
        Response.ContentType = "application/octet-stream";
        //通知浏览器下载文件而不是打开
        Response.AddHeader("Content-Disposition", "attachment;  filename=" + HttpUtility.UrlEncode(filename, System.Text.Encoding.UTF8));
        Response.BinaryWrite(bytes);
        Response.Flush();
        Response.End();
    }

    void fileLoad3(string path)
    {
        string filepath = Server.MapPath(path);
        string filename = System.IO.Path.GetFileName(path);

        System.IO.FileInfo fileInfo = new System.IO.FileInfo(filepath);
        if (fileInfo.Exists == true)
        {
            const long ChunkSize = 102400;//100K 每次读取文件，只读取100K，这样可以缓解服务器的压力
            byte[] buffer = new byte[ChunkSize];
            Response.Clear();
            System.IO.FileStream iStream = System.IO.File.OpenRead(filepath);
            long dataLengthToRead = iStream.Length;//获取下载的文件总大小
            Response.ContentType = "application/octet-stream";
            Response.AddHeader("Content-Disposition", "attachment; filename=" + HttpUtility.UrlEncode(filename));
            while (dataLengthToRead > 0 && Response.IsClientConnected)
            {
                int lengthRead = iStream.Read(buffer, 0, Convert.ToInt32(ChunkSize));//读取的大小
                Response.OutputStream.Write(buffer, 0, lengthRead);
                Response.Flush();
                dataLengthToRead = dataLengthToRead - lengthRead;
            }
            Response.Close();
        }
    }
}

