using System;
using System.Collections.Generic;
using System.IO;
using System.Threading;
using System.Threading.Tasks;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.HtmlControls;

namespace projectc_.khalid
{
    public partial class AllBooks : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadBooks();
                LoadUserHistory();
            }
        }

        private void LoadBooks()
        {
            string filePath = Server.MapPath("books.txt");
            string borrowFilePath = Server.MapPath("borrow.txt");

            HashSet<string> borrowedBooks = new HashSet<string>();
            if (File.Exists(borrowFilePath))
            {
                string[] borrowedEntries = File.ReadAllLines(borrowFilePath);
                foreach (string entry in borrowedEntries)
                {
                    string[] parts = entry.Split('|');
                    if (parts.Length >= 8 && parts[6].Trim().ToLower() == "borrowed")
                    {
                        borrowedBooks.Add(parts[1]); // bookId
                    }
                    else if (parts.Length >= 8 && parts[6].Trim().ToLower() == "pending approval")
                    {
                        borrowedBooks.Add(parts[1]); // bookId for pending approval
                    }
                }
            }

            if (File.Exists(filePath))
            {
                string[] books = File.ReadAllLines(filePath);
                foreach (string book in books)
                {
                    string[] parts = book.Split('|');
                    if (parts.Length >= 6)
                    {
                        string bookId = parts[0];
                        string title = parts[1];
                        string author = parts[2];
                        string category = parts[3];
                        string imageName = parts[4];

                        string imagePath = ResolveUrl($"~/khalid/Images/{imageName}");
                        string buttonState = borrowedBooks.Contains(bookId) ? "disabled" : "";
                        string buttonText = borrowedBooks.Contains(bookId) ? "Borrowed" : "Borrow";

                        HtmlGenericControl card = new HtmlGenericControl("div");
                        card.Attributes["class"] = "col-md-4 mb-4";
                        card.InnerHtml = $@"
                <div class='card book-card'>
                    <img src='{imagePath}' class='card-img-top book-image' alt='{title}' />
                    <div class='card-body'>
                        <h5 class='card-title'>{title}</h5>
                        <p class='card-text'><strong>Author:</strong> {author}</p>
                        <p class='card-text'><strong>Category:</strong> {category}</p>
                        <button class='btn btn-primary' onclick=""borrowBook('{bookId}', '{title}', '{author}', '{category}', '{imageName}', this, event)"" {buttonState}>
                            {buttonText}
                        </button>
                        <button class='btn btn-danger' onclick=""returnBook('{bookId}', this, event)"">Return Book</button>
                    </div>
                </div>";

                        booksContainer.Controls.Add(card);
                    }
                }
            }
        }


        private void LoadUserHistory()
        {
            string borrowFilePath = Server.MapPath("borrow.txt");
            string email = GetUserEmail();

            if (string.IsNullOrEmpty(email)) return;

            if (File.Exists(borrowFilePath))
            {
                string[] borrowEntries = File.ReadAllLines(borrowFilePath);
                foreach (string entry in borrowEntries)
                {
                    string[] parts = entry.Split('|');
                    if (parts.Length >= 8 && parts[0] == email)
                    {
                        string bookId = parts[1];
                        string title = parts[2];
                        string author = parts[3];
                        string category = parts[4];
                        string imageName = parts[5];
                        string status = parts[6].Trim();
                        string returned = parts[7].Trim();

                        string imagePath = ResolveUrl($"~/khalid/Images/{imageName}");

                        HtmlGenericControl card = new HtmlGenericControl("div");
                        card.Attributes["class"] = "col-md-4 mb-4";
                        card.InnerHtml = $@"
                        <div class='card book-card'>
                            <img src='{imagePath}' class='card-img-top book-image' alt='{title}' />
                            <div class='card-body'>
                                <h5 class='card-title'>{title}</h5>
                                <p class='card-text'><strong>Author:</strong> {author}</p>
                                <p class='card-text'><strong>Category:</strong> {category}</p>
                                <p class='card-text'><strong>Status:</strong> {status}</p>
                                <p class='card-text'><strong>Returned:</strong> {returned}</p>
                            </div>
                        </div>";

                        //historyContainer.Controls.Add(card);
                    }
                }
            }
        }

        private static bool IsUserBlacklisted(string email)
        {
            string blacklistFilePath = HttpContext.Current.Server.MapPath("blacklist.txt");
            if (File.Exists(blacklistFilePath))
            {
                string[] blacklistEntries = File.ReadAllLines(blacklistFilePath);
                foreach (string entry in blacklistEntries)
                {
                    if (entry.Trim() == email)
                    {
                        return true;
                    }
                }
            }
            return false;
        }


        //private void AddToBlacklist(string email)
        //{
        //    string blacklistFilePath = Server.MapPath("blacklist.txt");
        //    using (StreamWriter writer = new StreamWriter(blacklistFilePath, true))
        //    {
        //        writer.WriteLine(email);
        //    }
        //}

        //private void RemoveFromBlacklist(string email)
        //{
        //    string blacklistFilePath = Server.MapPath("blacklist.txt");
        //    if (File.Exists(blacklistFilePath))
        //    {
        //        string[] blacklistEntries = File.ReadAllLines(blacklistFilePath);
        //        List<string> updatedEntries = new List<string>();
        //        foreach (string entry in blacklistEntries)
        //        {
        //            if (entry.Trim() != email)
        //            {
        //                updatedEntries.Add(entry);
        //            }
        //        }
        //        File.WriteAllLines(blacklistFilePath, updatedEntries);
        //    }
        //}

        // Update the BorrowBook method to check the timestamp and start a 10-second countdown after acceptance
        // تعريف القاموس لتخزين المؤقتات
        private static Dictionary<string, CancellationTokenSource> countdownTimers = new Dictionary<string, CancellationTokenSource>();
        // دالة للتحقق إذا كان البريد الإلكتروني موجودًا في البلاكليست
        private static bool IsEmailInBlacklist(string email)
        {
            string blacklistFilePath = HttpContext.Current.Server.MapPath("blacklist.txt");

            // تحقق من وجود الملف
            if (!File.Exists(blacklistFilePath))
            {
                return false; // إذا لم يوجد الملف، نعود بـ false
            }

            string[] blacklistEntries = File.ReadAllLines(blacklistFilePath);
            foreach (string entry in blacklistEntries)
            {
                // نأخذ الجزء قبل الـ | (البريد الإلكتروني)
                string blacklistEmail = entry.Split('|')[0].Trim();

                // التحقق إذا كان البريد الإلكتروني في البلاكليست
                if (blacklistEmail == email)
                {
                    return true;
                }
            }
            return false;
        }

        [WebMethod]
        public static string BorrowBook(string bookId, string title, string author, string category, string imageName)
        {
            string email = GetUserEmail(); // تأكد من جلب البريد الإلكتروني بشكل صحيح

            if (string.IsNullOrEmpty(email))
            {
                return "Error: User not logged in.";
            }

            // تحقق مما إذا كان البريد الإلكتروني موجودًا في البلاكليست
            if (IsEmailInBlacklist(email))
            {
                return "Error: You are blacklisted and cannot borrow books.";
            }

            string borrowFilePath = HttpContext.Current.Server.MapPath("borrow.txt");
            if (!File.Exists(borrowFilePath))
            {
                File.Create(borrowFilePath).Close();
            }

            // تعديل الحالة لتكون "pending approval" بدلاً من "borrowed"
            string bookData = $"{email}|{bookId}|{title}|{author}|{category}|{imageName}|pending approval|false";

            using (StreamWriter writer = new StreamWriter(borrowFilePath, true))
            {
                writer.WriteLine(bookData);
            }

            return "You have successfully borrowed the book, awaiting approval!";
        }


        // دالة لتحميل البريد الإلكتروني من الملف UserData.txt
        private static string GetUserEmail()
        {
            string userDataFilePath = HttpContext.Current.Server.MapPath("~/App_Data/logged.txt");
            if (File.Exists(userDataFilePath))
            {
                string[] userData = File.ReadAllLines(userDataFilePath);
                if (userData.Length >= 1)
                {
                    return userData[0];  // البريد الإلكتروني في الفهرس 1
                }
            }
            return null;  // إذا لم يتم العثور على البريد
        }



        [WebMethod]
        public static string ReturnBook(string bookId)
        {
            string email = GetUserEmail(); // تأكد من جلب البريد الإلكتروني بشكل صحيح

            if (string.IsNullOrEmpty(email))
            {
                return "Error: User not logged in.";
            }

            // إيقاف المؤقت الخاص بالعد التنازلي لهذا المستخدم والكتاب
            string timerKey = email + "_" + bookId;
            if (AllBooks.countdownTimers.ContainsKey(timerKey))
            {
                AllBooks.countdownTimers[timerKey].Cancel();
                AllBooks.countdownTimers.Remove(timerKey);
            }

            return "Thanks For Return The Book.";
        }



        [WebMethod]
        public static string ApproveReturn(string bookId)
        {
            //string email = HttpContext.Current.Session["UserEmail"] as string;

            string email = GetUserEmail();

            if (string.IsNullOrEmpty(email))
            {
                return "Error: User not logged in.";
            }

            string borrowFilePath = HttpContext.Current.Server.MapPath("borrow.txt");
            if (File.Exists(borrowFilePath))
            {
                string[] borrowEntries = File.ReadAllLines(borrowFilePath);
                for (int i = 0; i < borrowEntries.Length; i++)
                {
                    string[] parts = borrowEntries[i].Split('|');
                    if (parts.Length >= 8 && parts[0] == email && parts[1] == bookId)
                    {
                        borrowEntries[i] = $"{parts[0]}|{parts[1]}|{parts[2]}|{parts[3]}|{parts[4]}|{parts[5]}|returned|true";
                        break;
                    }
                }
                File.WriteAllLines(borrowFilePath, borrowEntries);
            }

            return "Return request approved successfully!";
        }

        protected void back_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Mohammed/userdashboard.aspx");
        }

       
    }
}