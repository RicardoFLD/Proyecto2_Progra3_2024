using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Proyecto_Alarma
{
    public partial class Edit : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void BtnEditA_ServerClick(object sender, EventArgs e)
        {
            List<string> selectdays = new List<string>();
            AlarmController alarmController = new AlarmController();

            if (UDays0.Checked)
            {
                selectdays.Add("Monday");
            }
            if (UDays1.Checked)
            {
                selectdays.Add("Tuesday");
            }
            if (UDays2.Checked)
            {
                selectdays.Add("Wednesday");
            }
            if (UDays3.Checked)
            {
                selectdays.Add("Thursday");
            }
            if (UDays4.Checked)
            {
                selectdays.Add("Friday");
            }

            if (UDays5.Checked)
            {
                selectdays.Add("Saturday");
            }
            if (UDays6.Checked)
            {
                selectdays.Add("Sundya");
            }

            string resul = string.Join(",", selectdays);

            Malarms malarms = new Malarms
            {
                Id = Convert.ToInt32(Request.QueryString["Id"]),
                Name = UptxtName.Value,
                Hour = UptimeAlarm.Value,
                Days = resul,
                Active=dropDownState.Value
                

            };
            alarmController.UpdateAlarm(malarms);
            string msg = $"alert('Se actulizo la alarma')";
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", msg, true);

            Response.Redirect("mainA.aspx");
        }
    }
}