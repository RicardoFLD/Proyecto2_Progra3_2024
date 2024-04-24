using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Runtime.CompilerServices;
using System.Web;

namespace Proyecto_Alarma
{
    public class AlarmController
    {
        public List<Malarms> GetMalarms()
        {

            List<Malarms> malarms = new List<Malarms>();

            Database database = new Database();
            DataTable dsAlarms = database.GetAlarms();

            foreach (DataRow dr in dsAlarms.Rows)
            {
                malarms.Add(new Malarms
                {
                    Id = (int)dr["id_alar"],
                    Name = dr["name"].ToString(),
                    Hour = dr["hour"].ToString(),
                    Days = dr["days"].ToString(),
                    Active = dr["active"].ToString(),


                });

            }
            return malarms;


        }

        public void SaveAlarm(Malarms malarms)
        {
            Database database = new Database();
            database.SaveAlarms(malarms);
        }

        public void DeleteAlarm(int alarmID) {
            
            Database database = new Database();

            database.DeleteAlarm(alarmID);
        
        }

        public void UpdateAlarm(Malarms malarms)
        {
            Database database = new Database();
            database.UpdateAlarm(malarms);


        }
    }
}
        