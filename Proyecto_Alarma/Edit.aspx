<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Edit.aspx.cs" Inherits="Proyecto_Alarma.Edit" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous" />
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
    <title>Edit alarm</title>
</head>
<body>
    <form id="form1" runat="server">
        <div style="display: flex; justify-content: center; background-color: black; padding: 20px;">
            <div class="container ">
                <div>
                    <p style="color: orange;">Edit Alarms</p>
                </div>
                <div class="form-group">
                    <div class=" mb-3">
                        <label runat="server" for="UptxtName" class="col-form-label" style="color: orange;">Name Alamr:</label>
                        <input runat="server" type="text" class="form-control" id="UptxtName" placeholder="Name" />
                    </div>
                    <div class=" mb-3">
                        <label runat="server" for="UptimeAlarm" class="col-form-label" style="color: orange;">hour</label>
                        <input runat="server" type="time" class="form-control" id="UptimeAlarm" />
                    </div>
                    <div class=" mb-3">
                        <label for="DateT" class="col-form-label" style="color: orange;">Days</label><br />

                        <input runat="server" type="checkbox" id="UDays0" name="Days0" value="Monday" />
                        <label runat="server" for="UDays0" style="color: orange">Monday</label><br />

                        <input runat="server" type="checkbox" id="UDays1" name="Days1" value="Tuesday" />
                        <label runat="server" for="UDays1" style="color: orange">Tuesday</label><br />

                        <input runat="server" type="checkbox" id="UDays2" name="Days2" value="Wednesday" />
                        <label runat="server" for="UDays2" style="color: orange">Wednesday</label><br />

                        <input runat="server" type="checkbox" id="UDays3" name="Days3" value="Thursday" />
                        <label runat="server" for="UDays3" style="color: orange">Thursday</label><br />

                        <input runat="server" type="checkbox" id="UDays4" name="Days4" value="Friday" />
                        <label runat="server" for="UDays4" style="color: orange">Friday</label><br />

                        <input runat="server" type="checkbox" id="UDays5" name="Days5" value="Saturday" />
                        <label runat="server" for="UDays5" style="color: orange">Saturday</label><br />

                        <input runat="server" type="checkbox" id="UDays6" name="Days6" value="Sunday" />
                        <label runat="server" for="UDays6" style="color: orange">Sunday</label><br />

                        <label style="color: orange">Select</label><br />
                        <select id="dropDownState" runat="server" class="form-select" aria-label=".form-select-sm example">

                            <option value="Active">Active</option>
                            <option value="Inactive">Inactive</option>
                        </select>
                        <br />
                        <br />

                        
                        <a type="button" class="btn btn-secondary" href="mainA.aspx">Close </a>
                        <button runat="server" type="button" id="BtnEditA" class="btn btn-warning" style="color: white;" onserverclick="BtnEditA_ServerClick">Update Alarm</button>
                    </div>
                </div>
            </div>
        </div>
        <div style="background-color: gray; text-align: center; padding: 10px; color: white;">
        </div>
        <div style="background-color: gray; text-align: center; padding: 10px; color: white;">
        </div>
        <div style="background-color: gray; text-align: center; padding: 10px; color: white;">
        </div>
    </form>
</body>
</html>
