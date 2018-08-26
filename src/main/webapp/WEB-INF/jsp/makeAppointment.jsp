<%-- 
    Document   : makeAppointment
    Created on : Jul 29, 2018, 8:20:18 PM
    Author     : "Dhanuka Jayasinghe"
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="cp" value="${pageContext.request.servletContext.contextPath}" scope="request" />

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>EduCan | ${title}</title>
        <!-- Tell the browser to be responsive to screen width -->
        <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
        <!-- Bootstrap 3.3.6 -->
        <link rel="stylesheet" href="${cp}/resources/bootstrap/css/bootstrap.min.css">
        <!-- DataTables -->
        <link rel="stylesheet" href="${cp}/resources/plugins/datatables/dataTables.bootstrap.css">
        <!-- Select2 -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.5/css/select2.min.css" />
        <!-- Font Awesome -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css">
        <!-- Ionicons -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
        <!-- Theme style -->
        <link rel="stylesheet" href="${cp}/resources/css/AdminLTE.min.css">
        <link rel="stylesheet" href="${cp}/resources/css/skins/skin-blue.min.css">
        
        <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
        <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
        <![endif]-->
        <style>
            .appntment-text{
                font-size: 14px;
                padding: 3px 0px;
                text-transform: uppercase;
                display: block;
            }
            .btn-book-custom{
                padding-top: 3px;
                padding-bottom: 3px;
            }
        </style>
    </head>
    <body class="hold-transition skin-blue sidebar-mini fixed">
        <div class="wrapper">
            
            <header class="main-header">
                <!-- Logo -->
                <a href="../../index2.html" class="logo">
                    <!-- mini logo for sidebar mini 50x50 pixels -->
                    <span class="logo-mini">
                        <b>E</b>DU</span>
                    <!-- logo for regular state and mobile devices -->
                    <span class="logo-lg">
                        <b>Edu</b>Can</span>
                </a>
                <!-- Header Navbar: style can be found in header.less -->
                <nav class="navbar navbar-static-top">
                    <!-- Sidebar toggle button-->
                    <a href="#" class="sidebar-toggle" data-toggle="offcanvas" role="button">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </a>
                    
                    <div class="navbar-custom-menu">
                        <ul class="nav navbar-nav">
                            <!-- User Account: style can be found in dropdown.less -->
                            <li class="dropdown user user-menu">
                                <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                                    <img src="${cp}/resources/img/user2-160x160.jpg" class="user-image" alt="User Image">
                                    <span class="hidden-xs">${identity.getFirstName()} ${identity.getLastName()}</span>
                                </a>
                                <ul class="dropdown-menu">
                                    <!-- User image -->
                                    <li class="user-header">
                                        <img src="${cp}/resources/img/user2-160x160.jpg" class="img-circle" alt="User Image">
                                        
                                        <p>${identity.getUsername()}</p>
                                    </li>
                                    <!-- Menu Footer-->
                                    <li class="user-footer">
                                        <div class="pull-left">
                                            <a href="#" class="btn btn-default btn-flat">Profile</a>
                                        </div>
                                        <div class="pull-right">
                                            <form id="logoutForm" action="${cp}/student/signout" method="post">
                                                <a href="javascript:document.getElementById('logoutForm').submit()" class="btn btn-default btn-flat">Sign out</a>
                                            </form>
                                        </div>
                                    </li>
                                </ul>
                            </li>
                        </ul>
                    </div>
                </nav>
            </header>
            <!-- Left side column. contains the logo and sidebar -->
            <aside class="main-sidebar">
                <!-- sidebar: style can be found in sidebar.less -->
                <section class="sidebar">
                    <!-- Sidebar user panel -->
                    <div class="user-panel">
                        <div class="pull-left image">
                            <img src="${cp}/resources/img/user2-160x160.jpg" class="img-circle" alt="User Image">
                        </div>
                        <div class="pull-left info">
                            <p>${identity.getFirstName()} ${identity.getLastName()}</p>
                            <a href="#">
                                <i class="fa fa-circle text-success"></i> Online</a>
                        </div>
                    </div>
                    <ul class="sidebar-menu">
                        <li class="header">MAIN NAVIGATION</li>
                        <li class="treeview">
                            <a href="${cp}/student/profile">
                                <i class="fa fa-user"></i>
                                <span>Student Profile</span>
                            </a>
                        </li>
                        <li class="treeview active">
                            <a href="javascript:void(0)"><i class="fa fa-th"></i> <span>Appointment</span></a>
                            <ul class="treeview-menu">
                                <li class="active"><a href="${cp}/student/appointment/create"><i class="fa fa-circle-o"></i> Make Appointment</a></li>
                                <li><a href="${cp}/student/appointment/cancel"><i class="fa fa-circle-o"></i> Appointment History</a></li>
                            </ul>
                        </li>
                    </ul>
                </section>
            </aside>
            
            <!-- Content Wrapper. Contains page content -->
            <div class="content-wrapper">
                <!-- Main content -->
                <section class="content">
                    <div class="row">
                        <div class="col-xs-12">
                            <div class="box box-primary">
                                <div class="box-header with-border text-center">
                                    <h3 class="box-title" style="font-size: 20px; padding-bottom: 4px; padding-top: 3px;">Make an Appointment with your Consultant</h3>
                                </div>
                                <div class="box-body">
                                    <form id="formSearchTimeTable" method="post" action="${cp}/student/appointment/create" role="form">
                                        <div class="row">
                                            <div class="col-sm-4">
                                                <div class="form-group">
                                                    <label>Specialization</label>
                                                    <select name="studyfieldId" class="form-control" required></select>
                                                </div>
                                            </div>
                                            <div class="col-sm-4">
                                                <div class="form-group">
                                                    <label>Consultant</label>
                                                    <select name="consultantId" class="form-control" required=""></select>
                                                </div></div>
                                            <div class="col-sm-4">
                                                <div class="form-group">
                                                    <label>Any Date</label>
                                                    <div class="input-group">
                                                        <input type="date" name="appointmentDate" class="form-control" placeholder="Appointment Date" required="" />
                                                        <div class="input-group-btn">
                                                            <button type="submit" class="btn btn-primary btn-block pull-right"><i class="fa fa-search"></i>&nbsp;SEARCH</button>
                                                        </div>
                                                        
                                                    </div>
                                                </div>
                                            </div>
                                            <span class="${response.getCode()==1?'text-success':'text-danger'}">${response.getMessage()}</span>
                                        </div>
                                    </form>
                                </div>
                                <div class="box-body">
                                    <div class="row">
                                        <div class="col-md-7">
                                            <table id="tblAppointments" class="table table-striped table-hover">
                                                <thead class="hidden">
                                                    <tr>
                                                        <th></th>
                                                        <th>Session Date</th>
                                                        <th>Session Time</th>
                                                    </tr>
                                                </thead>
                                            </table>
                                        </div>
                                        <div class="col-md-5">
                                            <div class="box box-primary" id="consultantProfile" style="display:none;">
                                                <div class="box-header with-border text-center">
                                                    <h3 class="box-title">Consultant Profile</h3>
                                                </div>
                                                <div class="box-body">
                                                    <ul class="list-group list-group-unbordered">
                                                        
                                                        <div class="col-md-9"></div>
                                                        <li class="list-group-item">
                                                            <image style="height:70px;width:auto;" alt="Consultant Profile Picture" class="img-circle" src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS6ePubttqk-ODjpbAJ2ORVxRGOua1vNCU9MjnBafh8AJYPe77E"/>
                                                            <a href="javascript:void(0)" name="consultantName" class="text-black text-bold" style="font-size:17px;margin-left: 10px;"></a><br>
                                                        </li>
                                                        <li class="list-group-item">
                                                            <b>Specialized Area</b> <a class="pull-right" name="countrySpeciality"></a>
                                                        </li>
                                                        <li class="list-group-item">
                                                            <b>Specialized Country</b> <a class="pull-right" name="fieldSpeciality"></a>
                                                        </li>
                                                        <li class="list-group-item">
                                                            <b>Qualification</b> <a class="pull-right" name="qualification"></a>
                                                        </li>
                                                    </ul>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                
                                
                            </div>
                        </div>
                    </div>
                </section>
            </div>
            <!-- /.content-wrapper -->
            <footer class="main-footer">
                <div class="pull-right hidden-xs">
                    <b>Version</b> 2.3.3
                </div>
                <strong>Copyright &copy; 2014-2015
                    <a href="http://almsaeedstudio.com">Almsaeed Studio</a>.</strong> All rights reserved.
            </footer>
        </div>
        <!-- ./wrapper -->
        
        <!-- jQuery 2.2.0 -->
        <script src="${cp}/resources/plugins/jQuery/jQuery-2.2.0.min.js"></script>
        <!-- Bootstrap 3.3.6 -->
        <script src="${cp}/resources/bootstrap/js/bootstrap.min.js"></script>
        <!-- DataTables -->
        <script src="${cp}/resources/plugins/datatables/jquery.dataTables.min.js"></script>
        <script src="${cp}/resources/plugins/datatables/dataTables.bootstrap.min.js"></script>
        <!-- Select2 -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.5/js/select2.full.min.js"></script>
        <!-- FastClick -->
        <script src="${cp}/resources/plugins/fastclick/fastclick.js"></script>
        <!-- SlimScroll -->
        <script src="${cp}/resources/plugins/slimScroll/jquery.slimscroll.min.js"></script>
        <!-- AdminLTE App -->
        <script src="${cp}/resources/js/app.min.js"></script>
        
        <script>
            var app={
                serializeFormData: function (form_data) {
                    //used to serialize form data
                    var data = {};
                    $.each(form_data, function (index, field) {
                        data[field.name] = field.value;
                    });
                    return data;
                },
                responseMessage:function(response){
                    if(response.code===1)
                        return '<span class="text-success">'+ response.message +'</span>';
                    else if(response.code===0)
                        return '<span class="text-warning">'+ response.message +'</span>';
                    else if(response.code===-1)
                        return '<span class="text-danger">'+ response.message +'</span>';
                    
                    return '<span class="text-danger">Unknown response message found</span>';
                },
                select2:{
                    fieldofStudy:function(data){ 
                        return {
                            placeholder: '- Select your option -',
                            width: "100%",
                            allowClear: true,
                            multiple:false,
                            data:data
                        };
                    },
                    consultCountry:function(data){ 
                        return {
                            placeholder: '- Select your option -',
                            width: "100%",
                            allowClear: true,
                            multiple:false,
                            data:data
                        };
                    },
                    consultant:function(data){ 
                        return {
                            placeholder: '- Select your option -',
                            width: "100%",
                            allowClear: true,
                            multiple:false,
                            data:data
                        };
                    }
                }
            };
            var getFieldofStudyList=function(){
                $.get("/educan.oas/admin/studyfield/list",function(data){
                    var data = $.map(data, function(n,i){
                        return {id:n.fieldId,text:n.fieldName};
                    });
                    //console.log(data);
                    //init field of study dropdown list
                    $('#formSearchTimeTable [name=studyfieldId]').select2(app.select2.fieldofStudy(data));
                });
            };
            var getConsultantList=function(){
                $.get("/educan.oas/admin/consultant/list",function(data){
                    var data = $.map(data, function(n,i){
                        return {id:n.consultantId,text:n.title+' '+n.firstName+' '+n.lastName};
                    });
                    //console.log(data);
                    //init consult country dropdown list
                    $('#formSearchTimeTable [name=consultantId]').select2(app.select2.consultant(data));
                    $('#formSearchTimeTable [name=consultantId]').change(); //trigger change event
                });
            };
            var getConsultantDetails=function(id){
                if(isNaN(id)){
                    $('#consultantProfile').hide();
                    console.log('invalid request parameter.');
                    //alert('invalid request parameter.');
                }else{
                    $.get("/educan.oas/admin/consultant/profile/"+id,function(data){
                        if(data.consultantId===0){
                            $('#consultantProfile').hide();
                        }else{
                            $('#consultantProfile').show();
                            $.each(data, function(key, element) {
                                $('#consultantProfile [name="'+ key +'"]').html(element);
                                //console.log('key: ' + key + '\n' + 'value: ' + element);
                            });
                        }
                    });
                }
            };
            var setStudentAppointment=function(data){
                $.ajax({
                    type:"POST",
                    url: "/educan.oas/student/appointment/create",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    data: JSON.stringify(data),
                    beforeSend: function (jqXHR, settings) {
                    },
                    success: function (data, textStatus, jQxhr) {
                        //console.log(data);
                        alert(data.message);
                        if(data.code===1){
                            $('#formSearchTimeTable').submit(); //refresh datatable
                        }
                    },
                    error: function (jqXhr, textStatus, errorThrown) {
                        console.log(jqXhr.responseText);
                        alert("Error occured while processing this request. Please try again later.");
                    }
                });
                
            };
            
            $('#formSearchTimeTable [name=consultantId]').change(function(){
                var consultantId=$(this).val();
                getConsultantDetails(consultantId); //load consultan details
            });
            
            var getAppointmentDetails=function(srchParaObj){
                var table = $('#tblAppointments').dataTable();
                table.fnDestroy(false);
                table.fnDraw();
                table = $('#tblAppointments').DataTable({
                    "ajax": {
                        "url": "/educan.oas/student/appointment/timetable/"+srchParaObj.consultantId+"/"+srchParaObj.appointmentDate,
                        "dataSrc": function (json) {
                            return json;
                            //return JSON.parse(json.GetFlightPlanScheduleResult);
                        }, "cache": false
                    },
                    "columns": [
                        {
                            "data": null,
                            "orderable":false,
                            "render": function (data, type, full, meta) {
                                if(data.available==='A') //if record is active
                                    return '<button type="button" class="btn btn-primary text-primary btn-book-custom btn-book" title="Book Now"><i class="fa fa-bookmark-o"></i>&nbsp;Schedule</button>';
                                
                                return '<button type="button" class="btn btn-warning text-primary btn-book-custom" disabled><i class="fa fa-bookmark-o"></i>&nbsp;Schedule\n\
                        </button>';
                            }
                        },
                        {
                            "data": null,
                            "defaultContent": '',
                            "render": function (data, type, full, meta) {
                                return '<span class="appntment-text">'+ data.sessionWeekDay +', '+ data.sessionDate +'</span>';
                            }
                        },
                        {
                            "data": null,
                            "defaultContent": '',
                            "render": function (data, type, full, meta) {
                                return '<span class="appntment-text"><span class="text-danger text-bold">'+ data.sessionTimeFrom+'</span> - <span class="text-danger text-bold">'+data.sessionTimeTo +'</span></span>';
                            }
                        }
                    ],
                    "pagingType": "full_numbers",
                    "searching": false,
                    "lengthChange":false,
                    "order": [[2, 'asc'],[0, 'desc']],
                    "destroy": true,
                    "fnRowCallback": function (nRow, data, iDisplayIndex, iDisplayIndexFull) {
                        $(nRow).off(); // Unbind Events
                        $(nRow).on('click', '.btn-book', function (e) {
                            var appointment={
                                fieldId:srchParaObj.studyfieldId,
                                sessionId:data.sessionId,
                                scheduledDate:data.scheduledDate,
                                scheduledTimeFrom:data.scheduledTimeFrom,
                                scheduledTimeTo:data.scheduledTimeTo
                            };
                            //console.log(appointment);
                            if(!isNaN(data.sessionId)){
                                var r = confirm("Do you want to make this appointment? Please confirm your choice.");
                                if (r === true) {
                                    setStudentAppointment(appointment);
                                }
                            }
                        });
                    }
                });
            };
            $(document).ready(function(e){
                getFieldofStudyList();
                getConsultantList();
                
                $('#formSearchTimeTable').submit(function(e){
                    e.preventDefault();
                    var data=app.serializeFormData($(this).serializeArray());
                    //console.log(data);
                    getAppointmentDetails(data);
                });
            });
        </script>
    </body>
</html>
