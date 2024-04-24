<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="mainA.aspx.cs" Inherits="Proyecto_Alarma.mainA" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous" />
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
    <title>Alarms</title>
</head>
<body style="background-image: url(https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT17cPniaGa1RqmFcYpPMrmEYL2XZ5c-sCXqA&usqp=CAU)">
    <form id="form1" runat="server">
        <div>




            <div class="container" style="margin-top: 100px;">
                <div class="row justify-content-center">
                    <div class="col-md-6">
                        <nav class="navbar bg-dark border-bottom border-body" data-bs-theme="dark">
                            <div class="container-xxl">
                                <a class="navbar-brand" style="color: orange;">Alarms</a>

                                <button class="btn btn-warning" style="color: white;" type="button" data-bs-toggle="modal" data-bs-target="#exampleModal" data-bs-whatever="@mdo">New Alarms</button>

                            </div>
                        </nav>                

                        <!--Aqui va estar el repetidor-->

                        <asp:Repeater ID="RepAlarm" runat="server">
                            <HeaderTemplate></HeaderTemplate>
                            <ItemTemplate>
                                <div class="card" style="background-color: black;">
                                    <div class="card-body">                                 
                                        <h5 class="card-title" style="color: white"><%#Eval ("Name") %></h5>
                                        <p class="card-text" style="color: orange;"><%#Eval("Hour") %></p>
                                        <p class="card-text" style="color: orange;"><%#Eval("Days") %></p>
                                        <button runat="server" data-id='<%#Eval("Id")%>' class="btn btn-danger" onserverclick="BtnDelete_ServerClick1" style="color: white;">Delete</button>}
                                        <a href="Edit.aspx?Id=<%# Eval("Id")%>" class="btn btn-success">Update</a>
                                        <button runat="server" data-check='<%#Eval("Id")%>' id="BtnCkeck" class="btn btn-primary" onserverclick="BtnCkeck_ServerClick" style="color: white;">Ckeck Alarm</button>

                                    </div>
                                </div>
                            </ItemTemplate>

                            <FooterTemplate></FooterTemplate>
                        </asp:Repeater>



                    </div>
                </div>
            </div>




            <%--  Modal del create alarm--%>


            <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header" style="background-color: black;">
                            <h1 class="modal-title fs-5" id="exampleModalLabel" style="color: orange;">New Alarm</h1>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>

                        <div class="modal-body" style="background-color: black;">

                            <div class="form-group">
                                <div class=" mb-3">
                                    <label for="txtName" class="col-form-label" style="color: orange;">Name Alamr:</label>
                                    <input runat="server" type="text" class="form-control" id="txtName" placeholder="Name" />
                                </div>
                                <div class=" mb-3">
                                    <label for="timeAlarm" class="col-form-label" style="color: orange;">hour</label>
                                    <input runat="server" type="time" class="form-control" id="timeAlarm" />
                                </div>
                                <div class=" mb-3">
                                    <label for="DateT" class="col-form-label" style="color: orange;">Days</label><br />

                                    <input runat="server" type="checkbox" id="Days0" name="Days0" value="Monday" />
                                    <label runat="server" for="Days0" style="color: orange">Monday</label><br />

                                    <input runat="server" type="checkbox" id="Days1" name="Days1" value="Tuesday" />
                                    <label runat="server" for="Days1" style="color: orange">Tuesday</label><br />

                                    <input runat="server" type="checkbox" id="Days2" name="Days2" value="Wednesday" />
                                    <label runat="server" for="Days2" style="color: orange">Wednesday</label><br />

                                    <input runat="server" type="checkbox" id="Days3" name="Days3" value="Thursday" />
                                    <label runat="server" for="Days3" style="color: orange">Thursday</label><br />

                                    <input runat="server" type="checkbox" id="Days4" name="Days4" value="Friday" />
                                    <label runat="server" for="Days4" style="color: orange">Friday</label><br />

                                    <input runat="server" type="checkbox" id="Days5" name="Days5" value="Saturday" />
                                    <label runat="server" for="Days5" style="color: orange">Saturday</label><br />

                                    <input runat="server" type="checkbox" id="Days6" name="Days6" value="Sunday" />
                                    <label runat="server" for="Days6" style="color: orange">Sunday</label><br />

                                    <label  style="color: orange">Select</label>
                                    <select id="dropDownState" runat="server" class="form-select" aria-label=".form-select-sm example">
                                        
                                        <option value="Active">Active</option>
                                        <option value="Inactive">Inactive</option>
                                    </select>
                                    <br />

                                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                    <button runat="server" type="button" id="btnSaveAlarm" class="btn btn-warning" onserverclick="btnSaveAlarm_ServerClick" style="color: white;">Create alarm</button>

                                </div>

                            </div>

                        </div>

                    </div>
                </div>
            </div>







        </div>
    </form>
</body>
</html>
