using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.InteropServices;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace Proyecto_Alarma
{
    public partial class mainA : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            LoadAlarm();
        }

        protected void btnSaveAlarm_ServerClick(object sender, EventArgs e)
        {
            List<string> selectdays = new List<string>();

            AlarmController alarmController = new AlarmController();
            if (Days0.Checked)
            {
                selectdays.Add("Monday");
            }
            if (Days1.Checked)
            {
                selectdays.Add("Tuesday");
            }
            if (Days2.Checked)
            {
                selectdays.Add("Wednesday");
            }
            if (Days3.Checked)
            {
                selectdays.Add("Thursday");
            }
            if (Days4.Checked)
            {
                selectdays.Add("Friday");
            }

            if (Days5.Checked)
            {
                selectdays.Add("Saturday");
            }
            if (Days6.Checked)
            {
                selectdays.Add("Sundya");
            }


            string resul = string.Join(",", selectdays);

            Malarms malarms = new Malarms
            {
                Name = txtName.Value,
                Hour = timeAlarm.Value,
                Days = resul,
                Active = dropDownState.Value


            };

            alarmController.SaveAlarm(malarms);

            string msg = $"alert('¡Se guardo la alarma!')";
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", msg, true);
            LoadAlarm();

        }


        public void LoadAlarm()
        {

            AlarmController alarmController = new AlarmController();

            List<Malarms> malarms = alarmController.GetMalarms();

            RepAlarm.DataSource = malarms;
            RepAlarm.DataBind();


        }



        protected void BtnDelete_ServerClick1(object sender, EventArgs e)
        {

            var button = (HtmlButton)sender;
            int alarmID = Convert.ToInt16(button.Attributes["data-id"]);

            AlarmController alarmController = new AlarmController();


            alarmController.DeleteAlarm(alarmID);

            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Se elimino la alarma')", true);
            LoadAlarm();
        }



        protected void BtnCkeck_ServerClick(object sender, EventArgs e)
        {
            string msg = string.Empty;
            AlarmController alarmController = new AlarmController();
            List<Malarms> malarms = alarmController.GetMalarms();
            var now = DateTime.Now;
            var button = (HtmlButton)sender;
            int alarmID = Convert.ToInt16(button.Attributes["data-check"]);
            string dayWeek = now.ToString("dddd", new System.Globalization.CultureInfo("en-US"));



            foreach (var alarm in malarms)
            {

                DateTime hora = Convert.ToDateTime(alarm.Hour);
                string hours = Convert.ToString(hora.Hour);
                string minutes = Convert.ToString(hora.Minute);
                


                if (alarm.Id == alarmID && now.Hour.ToString() == hours && now.Minute.ToString() == minutes && alarm.Active == "Active")
                {

                    string dias = alarm.Days;
                    string[] diasSeperados = dias.Split(',');

                    foreach (string dia in diasSeperados)
                    {

                        if (now.DayOfWeek.ToString() == dia)
                        {

                            msg = $"alert('¡Alarma sonando!')";
                            Page.ClientScript.RegisterStartupScript(this.GetType(), "Mensaje", msg, true);
                        };

                    }

                }
            }


        }
    }

}

