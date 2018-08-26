<%-- 
    Document   : adminAppointment
    Created on : Aug 12, 2018, 9:27:03 AM
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
            
            td.details-control {
                background: url('../resources/details_open.png') no-repeat center center;
                cursor: pointer;
            }
            tr.shown td.details-control {
                background: url('../resources/details_close.png') no-repeat center center;
            }
            
            div.slider {
                display: none;
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
                        <li class="active">
                            <a href="${cp}/home/appointment">
                                <i class="fa fa-th"></i>
                                <span>Appointment</span>
                            </a>
                        </li>
                        <li>
                            <a href="${cp}/home/consultant/session">
                                <i class="fa fa-user"></i>
                                <span>Session</span>
                            </a>
                        </li>
                        <li>
                            <a href="${cp}/home/consultant">
                                <i class="fa fa-user"></i>
                                <span>Consultant</span>
                            </a>
                        </li>
                        <li>
                            <a href="${cp}/home/student">
                                <i class="fa fa-user"></i>
                                <span>Student</span>
                            </a>
                        </li>
                        <li>
                            <a href="${cp}/home/studyfiled">
                                <i class="fa fa-user"></i>
                                <span>Study Field</span>
                            </a>
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
                                    <h3 class="box-title" style="font-size: 20px; padding-bottom: 4px; padding-top: 3px;">Student Appointment</h3>
                                </div>
                                <div class="box-body">
                                    <form id="formSearch" role="form" class="form-horizontal">
                                        <div class="form-group row">
                                            <div class="col-sm-3">
                                                <div class="input-group">
                                                    <span class="input-group-addon">From</span>
                                                    <input type='date' class="form-control" id="fromDate" required=""/>
                                                </div>
                                            </div>
                                            <div class="col-sm-3">
                                                <div class="input-group">
                                                    <span class="input-group-addon">To</span>
                                                    <input type='date' class="form-control" id="toDate" required=""/>
                                                </div>
                                            </div>
                                            <div class="col-sm-3">
                                                <button type="submit" class="btn btn-primary btn-sm"><i class="fa fa-search"></i> SEARCH</button>
                                            </div>
                                        </div>
                                    </form>
                                    <table id="tblAppointments" class="wrap table table-striped table-hover">
                                        <thead>
                                            <tr>
                                                <th style="width:10px;"></th>
                                                <th>Student Name</th>
                                                <th>Consultant</th>
                                                <th>Field of Study</th>
                                                <th>Appointment Date</th>
                                                <th>Appointment Time</th>
                                                <th></th>
                                            </tr>
                                        </thead>
                                    </table>
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
            };
            
            var setStudentAppointment=function(data){
                $.ajax({
                    type:"POST",
                    url: "/educan.oas/admin/appointment/cancel",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    data: JSON.stringify(data),
                    beforeSend: function (jqXHR, settings) {
                    },
                    success: function (data, textStatus, jQxhr) {
                        //console.log(data);
                        if(data.code===1){
                            getAppointmentDetails();
                        }
                    },
                    error: function (jqXhr, textStatus, errorThrown) {
                        console.log(jqXhr.responseText);
                        alert("Error occured while processing this request. Please try again later.");
                    }
                });
                
            };
            
            var getAppointmentDetails=function(){
                function formatData ( d ) {
                    // `d` is the original data object for the row
                    return '<table class="table table-hover" cellpadding="5" cellspacing="0" border="0" style="width:550px;padding-left:50px;margin-bottom:0px;">'+
                            '<tr>'+
                            '<td>Student Email:</td>'+
                            '<td>'+d.studentEmail+'</td>'+
                            '</tr>'+
                            '<tr>'+
                            '<td>Student Contact:</td>'+
                            '<td>'+d.studentContact+'</td>'+
                            '</tr>'+
                            '<tr>'+
                            '<td>Appointment Time:</td>'+
                            '<td>'+d.appointmentTime+'</td>'+
                            '</tr>'+
                            '<tr>'+
                            '<td>Room Number:</td>'+
                            '<td>'+d.room+'</td>'+
                            '</tr>'+
                            '<tr>'+
                            '<td>Created Date</td>'+
                            '<td>'+ d.createdDate +'</td>'+
                            '</tr>'+
                            '</table>';
                };
                
                var table = $('#tblAppointments').dataTable();
                table.fnDestroy(false);
                table.fnDraw();
                table = $('#tblAppointments').DataTable({
                    "ajax": {
                        "url": "/educan.oas/admin/appointment/summary",
                        "dataSrc": function (json) {
                            return json;
                            //return JSON.parse(json.GetFlightPlanScheduleResult);
                        }, "cache": false
                    },
                    "columns": [
                        {
                            "className": 'details-control',
                            "orderable": false,
                            "data": null,
                            "defaultContent": ''
                        },
                        {
                            "data":"studentName",
                            "defaultContent":''
                        },
                        {
                            "data": "consultantName",
                            "defaultContent": '',
                        },
                        {
                            "data": "studyField",
                            "defaultContent": '',
                        },
                        {
                            "data": null,
                            "defaultContent": '',
                            "render": function (data, type, full, meta) {
                                return '<span>'+ data.appointmentDate+'</span>';
                            }
                        },
                        {
                            "data": null,
                            "defaultContent": '',
                            "render": function (data, type, full, meta) {
                                return '<span>'+ data.appointmentTime +'</span>';
                            }
                        },
                        {
                            "data": null,
                            "orderable":false,
                            "render": function (data, type, full, meta) {
                                if(data.appointmentStatus==='A' && data.dateExpired!=='Y') //if record is active & appointment not expired
                                    return '<button class="btn btn-xs btn-cancel btn-danger" title="Cancel Appointment"><i class="fa fa-trash"></i> Cancel</button>';
                                else if(data.appointmentStatus==='D')
                                    return '<small class="label bg-red" style="font-size: 12px;">Canceled</small>';
                                return "";
                            }
                        },
                    ],
                    "pagingType": "full_numbers",
                    "searching": true,
                    "lengthChange":true,
                    "order": [[6, 'asc']],
                    "destroy": true,
                    "fnRowCallback": function (nRow, data, iDisplayIndex, iDisplayIndexFull) {
                        $(nRow).off(); // Unbind Events
                        // Add event listener for opening and closing details
                        $(nRow).on('mousedown', 'td.details-control', function (e) {
                            var row = table.row(nRow);
                            if (row.child.isShown()) {
                                row.child.hide();
                                $(nRow).removeClass('shown');
                            }
                            else {
                                row.child(formatData(data), 'no-padding').show();
                                $(nRow).addClass('shown');
                                $('div.slider', row.child()).slideDown();
                            }
                        });
                        
                        $(nRow).on('click', '.btn-cancel', function (e) {
                            var appointment={
                                appointmentId:data.appointmentId
                            };
                            //console.log(appointment);
                            if(!isNaN(data.appointmentId)){
                                var r = confirm("Do you want to canel this appointment? Please confirm your choice.");
                                if (r === true) {
                                    setStudentAppointment(appointment);
                                }
                            }
                        });
                    }
                });
            };
            $(document).ready(function(e){
                getAppointmentDetails();
            });
        </script>
    </body>
</html>
