using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.ComponentModel;

namespace Proyecto_Alarma
{
    public class Database
    {
        const string database = "Alarmas";
        const string server = "LAPTOP-0V63PIRE\\HOLA";
        SqlConnection connection = new SqlConnection($"Data Source={server};Initial Catalog={database};Integrated Security=True");



        public DataTable GetAlarms()
        {

            return Fill("spGetAlarm", null);

        }

        public void SaveAlarms(Malarms malarms) 
        {
             List<SqlParameter> parameters = new List<SqlParameter>();

            parameters.Add(new SqlParameter("@name",malarms.Name));
            parameters.Add(new SqlParameter("@hour",malarms.Hour));
            parameters.Add(new SqlParameter("@days",malarms.Days));
            parameters.Add(new SqlParameter("@active",malarms.Active));

            Execute("spSaveAlarm", parameters);


        }
 

        public void DeleteAlarm(int alarmID)
        {
            List<SqlParameter> parameters = new List<SqlParameter>();

            parameters.Add(new SqlParameter("alarmid", alarmID));

            Execute("spDeleteAlarm", parameters);

        }

        public void UpdateAlarm(Malarms malarms) 
        {
            List<SqlParameter> parameters = new List<SqlParameter>();

            parameters.Add(new SqlParameter ("@id",malarms.Id));
            parameters.Add(new SqlParameter("@name", malarms.Name));
            parameters.Add(new SqlParameter("@hour", malarms.Hour));
            parameters.Add(new SqlParameter("@days", malarms.Days));
            parameters.Add(new SqlParameter("active", malarms.Active));

            Execute("spUpdateAlar", parameters);

        }





        public DataTable Fill(string storedProcedure, List<SqlParameter> paramList)
        {
            //control de errores
            try
            {
                //usamos la conexion
                using (this.connection)
                {
                    //abra la conexion a la base de datos
                    connection.Open();
                    //creamos un comando de base de datos
                    SqlCommand cmd = connection.CreateCommand();
                    //el comando es de tipo store procedure
                    cmd.CommandType = CommandType.StoredProcedure;
                    //le damos el noombre del store procedure
                    cmd.CommandText = storedProcedure;

                    if (paramList != null)
                    {
                        foreach (SqlParameter param in paramList)
                        {
                            cmd.Parameters.Add(param);
                        }
                    }

                    //creamos el objeto que almacena los datos
                    DataTable ds = new DataTable();
                    //el adaptador ejecuta el comando a la base de datos
                    SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                    //llena el objeto con los datos que devolvio el adapter
                    adapter.Fill(ds);
                    //retornamos el objeto lleno de datos
                    return ds;
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }

        }

        public void Execute(string storedProcedure, List<SqlParameter> paramList)
        {
            //control de errores
            try
            {
                //usamos la conexion
                using (this.connection)
                {
                    //abra la conexion a la base de datos
                    connection.Open();
                    //creamos un comando de base de datos
                    SqlCommand cmd = connection.CreateCommand();
                    //el comando es de tipo store procedure
                    cmd.CommandType = CommandType.StoredProcedure;
                    //le damos el noombre del store procedure
                    cmd.CommandText = storedProcedure;

                    if (paramList != null)
                    {
                        foreach (SqlParameter param in paramList)
                        {
                            cmd.Parameters.Add(param);
                        }
                    }

                    cmd.ExecuteNonQuery();
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }




    }
}