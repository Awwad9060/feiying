using System;

using System.Collections;
using System.Configuration;
using System.Data;
using System.Web;
using System.Web.Security;

using System.Security.Cryptography;
using System.Text;


using System.Drawing;
using System.Drawing.Imaging;
using System.Drawing.Drawing2D;

public partial class share_VerifyImagePage : System.Web.UI.Page
{
    /// <summary>
    /// 创 建 者：Jesse
    /// 创建日期：2008-08-01
    /// 主要功能：
    /// 生成验证码的页面
    /// </summary>
    protected override void OnInit(EventArgs e)
    {
        base.OnInit(e);

        Color bg = Color.White;

        //string verifycode = Utils.CreateAuthStr(5, false);
        string verifycode = AuthHelper.CreateAuthStr(4, true);
        Success.Common.SessionHelper.Set("verificode", verifycode);
       
        Bitmap image = VerifyImageHelper.GenerateImage(verifycode, 100, 30, bg, 1);
        HttpContext.Current.Request.ContentType = "image/gif";
        image.Save(this.Response.OutputStream, ImageFormat.Jpeg);

    }


    #region 验证码类
    private class AuthHelper
    {
        #region 随机数
        /// <summary>
        /// 验证码生成的取值范围
        /// </summary>
        private static string[] verifycodeRange = { "0","1","2","3","4","5","6","7","8","9",
                                                    "a","b","c","d","e","f","g",
                                                    "h",    "j","k",    "m","n",
                                                        "p","q",    "r","s","t",
                                                    "u","v","w",    "x","y"
        
                                                  };
        /// <summary>
        /// 生成验证码所使用的随机数发生器
        /// </summary>
        private static Random verifycodeRandom = new Random();

        /// <summary>
        /// 产生验证码
        /// </summary>
        /// <param name="len">长度</param>
        /// <returns>验证码</returns>
        public static string CreateAuthStr(int len)
        {
            int number;
            StringBuilder checkCode = new StringBuilder();

            Random random = new Random();

            for (int i = 0; i < len; i++)
            {
                number = random.Next();

                if (number % 2 == 0)
                {
                    checkCode.Append((char)('0' + (char)(number % 10)));
                }
                else
                {
                    checkCode.Append((char)('A' + (char)(number % 26)));
                }

            }

            return checkCode.ToString();
        }

        /// <summary>
        /// 产生验证码
        /// </summary>
        /// <param name="len">长度</param>
        /// <param name="OnlyNum">是否仅为数字</param>
        /// <returns></returns>
        public static string CreateAuthStr(int len, bool OnlyNum)
        {
            int number;
            StringBuilder checkCode = new StringBuilder();

            for (int i = 0; i < len; i++)
            {
                if (!OnlyNum)
                {
                    number = verifycodeRandom.Next(0, verifycodeRange.Length);
                }
                else
                {
                    number = verifycodeRandom.Next(0, 10);
                }
                checkCode.Append(verifycodeRange[number]);
            }

            return checkCode.ToString();
        }

        #endregion
    }

    #endregion

    #region VerifyImageHelper
    /// <summary>
    /// 生成验证码图片的操作类
    /// </summary>
    private class VerifyImageHelper
    {
        private static Bitmap charbmp = new Bitmap(40, 40);
        private static Matrix m = new Matrix();
        private static byte[] randb = new byte[4];
        private static RNGCryptoServiceProvider rand = new RNGCryptoServiceProvider();


        /// <summary>
        /// 获得下一个随机数
        /// </summary>
        /// <param name="max">最大值</param>
        /// <returns></returns>
        private static int Next(int max)
        {
            rand.GetBytes(randb);
            int value = BitConverter.ToInt32(randb, 0);
            value = value % (max + 1);
            if (value < 0)
                value = -value;
            return value;
        }

        /// <summary>
        /// 获得下一个随机数
        /// </summary>
        /// <param name="min">最小值</param>
        /// <param name="max">最大值</param>
        /// <returns></returns>
        private static int Next(int min, int max)
        {
            int value = Next(max - min) + min;
            return value;
        }

        /// <summary>
        /// 获取验证码图片信息对象
        /// </summary>
        /// <param name="code">在图像中显示的代码</param>
        /// <param name="width">生成图像的宽</param>
        /// <param name="height">生成图像的高</param>
        /// <param name="bgColor">生成图像的背景色</param>
        /// <param name="textColor">生成的字体色，0为黑色，非0为彩色</param>
        /// <returns>返回VerifyImageInfo对象</returns>
        public static Bitmap GenerateImage(string code, int width, int height, Color bgColor, int textColor)
        {
            //VerifyImageInfo imageInfo = new VerifyImageInfo();
            //imageInfo.ImageFormat = ImageFormat.Jpeg;
            //imageInfo.ContentType = "image/pjpeg";

            if (height < 30)
                height = 30;
            if (width < 100)
                width = 100;


            Bitmap image = new Bitmap(width, height, PixelFormat.Format32bppArgb);


            int fontSize = (int)width / 10 + (int)height / 10;

            Font[] fonts = {
                                    new Font(new FontFamily("Times New Roman"),fontSize + Next(4), FontStyle.Bold),
                                    new Font(new FontFamily("Georgia"), fontSize + Next(4), FontStyle.Bold),
                                    new Font(new FontFamily("Arial"), fontSize + Next(4), FontStyle.Bold),
                                    new Font(new FontFamily("Comic Sans MS"), fontSize + Next(4), FontStyle.Bold)
                                 };

            Graphics graphics = Graphics.FromImage(image);
            graphics.SmoothingMode = SmoothingMode.HighSpeed;
            graphics.Clear(bgColor);


            int fixedNumber = (textColor == 2) ? 60 : 0;


            SolidBrush drawBrush = new SolidBrush(Color.FromArgb(Next(100), Next(100), Next(100)));
            for (int x = 0; x < 3; x++)
            {
                Pen pen = new Pen(Color.FromArgb(Next(150) + fixedNumber, Next(150) + fixedNumber, Next(150) + fixedNumber), 1f);
                graphics.DrawLine(pen, new PointF(0.0F + Next(20), 0.0F + Next(height)), new PointF(0.0F + Next(width), 0.0F + Next(height)));
            }

            Graphics graphics2 = Graphics.FromImage(charbmp);


            float f = -18f;
            for (int j = 0; j < code.Length; j++)
            {
                m.Reset();
                m.RotateAt((float)(Next(50) - 0x19), new PointF((float)(Next(3) + 7), (float)(Next(3) + 7)));
                graphics2.Clear(Color.Transparent);
                graphics2.Transform = m;
                if (textColor == 0)
                {
                    drawBrush.Color = Color.Black;
                }
                else
                {
                    drawBrush.Color = Color.FromArgb(Next(150) + fixedNumber + 20, Next(150) + fixedNumber + 20, Next(150) + fixedNumber + 20);
                }
                //drawBrush.Color = Color.Black;
                f = (f + 18f) + Next(5);
                PointF point = new PointF(f, 2f);
                graphics2.DrawString(code[j].ToString(), fonts[Next(fonts.Length - 1)], drawBrush, new PointF(0f, 0f));
                graphics2.ResetTransform();
                graphics.DrawImage(charbmp, point);
            }
            drawBrush.Dispose();
            graphics.Dispose();
            graphics2.Dispose();
            //imageInfo.Image = image;

            return image;
        }

    }
    #endregion
}
