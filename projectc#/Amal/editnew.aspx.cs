using System;
using System.IO;
using System.Linq;
using System.Web.UI.WebControls;

namespace projectc_
{
    public partial class editnew : System.Web.UI.Page
    {
        private string filePath;

        protected void Page_Load(object sender, EventArgs e)
        {


            this.UnobtrusiveValidationMode = System.Web.UI.UnobtrusiveValidationMode.None;



            lblmsg.Visible = false;
            filePath = Server.MapPath("addroomfile.txt"); // مسار ملف الغرف

            if (!IsPostBack)
            {
                LoadRoomDropdown(); // تحميل القائمة المنسدلة للغرف
            }
        }

        private void LoadRoomDropdown()
        {
            ddlRooms.Items.Clear();
            ddlRooms.Items.Add(new ListItem("Select a Room", "")); // إضافة عنصر افتراضي

            if (File.Exists(filePath))
            {
                var lines = File.ReadAllLines(filePath); // قراءة جميع الأسطر من الملف
                foreach (var line in lines)
                {
                    var data = line.Split(','); // تقسيم البيانات باستخدام الفاصلة
                    if (data.Length >= 4) // التأكد من أن السطر يحتوي على بيانات كافية
                    {
                        ddlRooms.Items.Add(new ListItem(data[1], data[0])); // إضافة اسم الغرفة ورقمها إلى القائمة
                    }
                }
            }
        }

        protected void ddlRooms_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(ddlRooms.SelectedValue))
            {
                LoadRoomDetails(int.Parse(ddlRooms.SelectedValue)); // تحميل تفاصيل الغرفة المحددة
            }
        }

        private void LoadRoomDetails(int roomId)
        {
            if (File.Exists(filePath))
            {
                var lines = File.ReadAllLines(filePath); // قراءة جميع الأسطر من الملف
                foreach (var line in lines)
                {
                    var data = line.Split(','); // تقسيم البيانات باستخدام الفاصلة
                    if (data.Length >= 4 && int.Parse(data[0]) == roomId) // التأكد من أن السطر يحتوي على بيانات كافية
                    {
                        txtRoomName.Text = data[1]; // تعيين اسم الغرفة
                        txtCapacity.Text = data[2]; // تعيين السعة
                        txtDescription.Text = data[3]; // تعيين الوصف
                        return;
                    }
                }
            }
        }

        protected void btnUpdateRoom_Click(object sender, EventArgs e)
        {
            string roomName = txtRoomName.Text.Trim(); // اسم الغرفة
            string capacity = txtCapacity.Text.Trim(); // السعة
            string description = txtDescription.Text.Trim(); // الوصف
            int roomId = int.Parse(ddlRooms.SelectedValue); // رقم الغرفة

            if (string.IsNullOrEmpty(roomName) || string.IsNullOrEmpty(capacity) || string.IsNullOrEmpty(description))
            {
                lblmsg.Text = "All fields are required."; // رسالة خطأ إذا كانت الحقول فارغة
                lblmsg.ForeColor = System.Drawing.Color.Red;
                lblmsg.Visible = true;
                return;
            }

            UpdateRoomData(roomId, roomName, capacity, description); // تحديث بيانات الغرفة
            lblmsg.Text = "Room updated successfully!"; // رسالة نجاح
            lblmsg.ForeColor = System.Drawing.Color.Green;
            lblmsg.Visible = true;

        }

        private void UpdateRoomData(int roomId, string roomName, string capacity, string description)
        {
            if (!File.Exists(filePath)) return;

            var lines = File.ReadAllLines(filePath).ToList(); // قراءة جميع الأسطر من الملف
            for (int i = 0; i < lines.Count; i++)
            {
                var data = lines[i].Split(','); // تقسيم البيانات باستخدام الفاصلة
                if (data.Length >= 4 && int.Parse(data[0]) == roomId) // التأكد من أن السطر يحتوي على بيانات كافية
                {
                    lines[i] = $"{roomId},{roomName},{capacity},{description}"; // تحديث بيانات الغرفة
                    break;
                }
            }
            File.WriteAllLines(filePath, lines); // حفظ التعديلات في الملف
           
        }  

        protected void btnDeleteRoom_Click(object sender, EventArgs e)
        {
            int roomId = int.Parse(ddlRooms.SelectedValue); // رقم الغرفة المحددة
            if (roomId == 0)
            {
                lblmsg.Text = "Please select a room to delete."; // رسالة خطأ إذا لم يتم تحديد غرفة
                lblmsg.ForeColor = System.Drawing.Color.Red;
                lblmsg.Visible = true;
                return;
            }

            var lines = File.ReadAllLines(filePath).Where(line => !line.StartsWith(roomId.ToString() + ",")); // حذف الغرفة المحددة
            File.WriteAllLines(filePath, lines); // حفظ التعديلات في الملف

            lblmsg.Text = "Room deleted successfully!"; // رسالة نجاح
            lblmsg.ForeColor = System.Drawing.Color.Green;
            lblmsg.Visible = true;
            LoadRoomDropdown(); // إعادة تحميل القائمة المنسدلة
        }

        protected void back1_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/hala2/RoomCards.aspx");
        }
    }  
}