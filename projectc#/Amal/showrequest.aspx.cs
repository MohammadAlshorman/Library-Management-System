using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace projectc_.Amal
{
    public partial class showrequest : System.Web.UI.Page
    {



        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindReservationData(); // استدعاء دالة لربط بيانات الحجوزات
            }
        }

        private void BindReservationData()
        {
            string reservationFile = Server.MapPath("reserveroom.txt"); // مسار ملف الحجوزات
            string[] reservationData = File.Exists(reservationFile) ? File.ReadAllLines(reservationFile) : new string[0]; // قراءة بيانات الحجوزات

            string tableContent = ""; // متغير لتخزين محتوى الجدول

            foreach (var line in reservationData) // التكرار على كل حجز
            {
                string[] resData = line.Split(','); // تقسيم بيانات الحجز
                tableContent += $"<tr><td>{resData[0]}</td><td>{resData[1]}</td><td>{resData[2]}</td><td>{resData[3]}</td><td>{resData[4]}</td></tr>"; // إضافة صف جديد إلى الجدول
            }

            reservationTable.InnerHtml = tableContent; // تعيين محتوى الجدول
        }

        protected void btnApprove_Click(object sender, EventArgs e)
        {
            UpdateReservationStatus("Approved"); // تحديث حالة الحجز إلى "Approved"
            BindReservationData(); // إعادة ربط البيانات
        }

        protected void btnReject_Click(object sender, EventArgs e)
        {
            UpdateReservationStatus("Rejected"); // تحديث حالة الحجز إلى "Rejected"
            BindReservationData(); // إعادة ربط البيانات
        }

        private void UpdateReservationStatus(string status)
        {
            string reservationFile = Server.MapPath("reserveroom.txt"); // مسار ملف الحجوزات
            string[] reservationData = File.ReadAllLines(reservationFile); // قراءة بيانات الحجوزات

            for (int i = 0; i < reservationData.Length; i++) // التكرار على كل حجز
            {
                string[] resData = reservationData[i].Split(','); // تقسيم بيانات الحجز
                if (resData[0] == txtRoomID.Text) // إذا كان Room ID مطابقًا
                {
                    reservationData[i] = $"{resData[0]},{resData[1]},{resData[2]},{resData[3]},{status}"; // تحديث حالة الحجز
                    break;
                }
            }

            File.WriteAllLines(reservationFile, reservationData); // حفظ التعديلات في الملف
        }

        protected void back3_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/hala2/RoomCards.aspx");
        }
    }
}
    //    protected void Page_Load(object sender, EventArgs e)
    //    {
    //        string file = Server.MapPath("userdata");
    //        if (File.Exists(file))
    //        {
    //            string[] lines = File.ReadAllLines(file);
    //            foreach (string line in lines)
    //            {
    //                string[] dataSplit = line.Split(' ');

    //                tableBody.InnerHtml += $"<tr><td>  {dataSplit[0]}   </td> <td>  {dataSplit[1]}    </td> <td>   {dataSplit[2]}     </td> <td> {dataSplit[3]} </td> <td>  </td></tr>";
    //            }
    //        }
    //    }
       

    //    protected void acceptbut_Click(object sender, EventArgs e)
    //    {

    //    }

    //    protected void rejectbut_Click(object sender, EventArgs e)
    //    {

    //    }
    //}

