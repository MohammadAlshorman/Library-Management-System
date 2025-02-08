using System;
using System.Collections.Generic;
using System.IO;
using System.Web;
using System.Web.UI;

namespace projectc_.Mohammed
{
    public partial class history : System.Web.UI.Page
    {
        string roomsFilePath = HttpContext.Current.Server.MapPath("~/App_Data/UserRooms.txt");
        string booksFilePath = HttpContext.Current.Server.MapPath("~/khalid/books.txt");
        string loggedFilePath = HttpContext.Current.Server.MapPath("~/App_Data/logged.txt"); // الملف الذي يحتوي على البريد المسجل

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserEmail"] != null)
            {
                lblUserName.Text = Session["UserName"]?.ToString() ?? "User";
                EnsureFilesExist(); // ✅ إنشاء الملفات إذا لم تكن موجودة

                if (IsUserLoggedIn()) // تحقق من وجود البريد في ملف logged.txt
                {
                    LoadUserHistory(); // تحميل سجل المستخدم
                }
                else
                {
                    Response.Redirect("login.aspx"); // إذا لم يكن البريد موجودًا في ملف logged.txt
                }
            }
            else
            {
                Response.Redirect("login.aspx");
            }
        }

        // ✅ إنشاء الملفات إذا لم تكن موجودة
        private void EnsureFilesExist()
        {
            if (!File.Exists(roomsFilePath))
            {
                File.Create(roomsFilePath).Close(); // إنشاء ملف غرف فارغ
            }

            if (!File.Exists(booksFilePath))
            {
                File.Create(booksFilePath).Close(); // إنشاء ملف كتب فارغ
            }

            if (!File.Exists(loggedFilePath))
            {
                File.Create(loggedFilePath).Close(); // إنشاء ملف logged فارغ
            }
        }

        // ✅ تحقق من وجود البريد الإلكتروني في ملف logged.txt
        private bool IsUserLoggedIn()
        {
            string userEmail = Session["UserEmail"].ToString();
            string[] loggedUsers = File.ReadAllLines(loggedFilePath);

            foreach (string line in loggedUsers)
            {
                string[] parts = line.Split('|');
                if (parts.Length >= 1 && parts[0] == userEmail) // تحقق من تطابق البريد الإلكتروني
                {
                    return true;
                }
            }
            return false;
        }

        // ✅ تحميل السجل
        private void LoadUserHistory()
        {
            List<object> books = new List<object>();
            List<object> rooms = new List<object>();

            string userEmail = Session["UserEmail"].ToString();

            // ✅ قراءة البيانات من ملف الكتب المحجوزة (books.txt)
            string[] book1 = File.ReadAllLines(booksFilePath);

            foreach (string line in book1)
            {
                string[] data = line.Split('|');
                if (data.Length >= 7 && data[0] == userEmail) // تحقق من تطابق البريد الإلكتروني مع الكتاب
                {
                    books.Add(new
                    {
                        BookID = data[1],
                        BookTitle = data[2],
                        Author = data[3],
                        Category = data[4],
                        BorrowDate = data[5],
                        ReturnDate = data[6]
                    });
                }
            }

            // ✅ قراءة البيانات من ملف الغرف المحجوزة (UserRooms.txt)
            foreach (string line in File.ReadAllLines(roomsFilePath))
            {
                string[] data = line.Split('|');
                if (data.Length >= 5 && data[0] == userEmail)
                {
                    rooms.Add(new
                    {
                        RoomID = data[1],
                        RoomName = data[2],
                        Time = data[3],
                        Date = data[4]
                    });
                }
            }

            // ✅ ربط البيانات بالـ Repeater
            rptBooks.DataSource = books;
            rptBooks.DataBind();

            rptRooms.DataSource = rooms;
            rptRooms.DataBind();
        }

        protected void btnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("userdashboard.aspx");
        }
    }
}
