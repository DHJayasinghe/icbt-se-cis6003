<%-- 
    Document   : adminReport
    Created on : Aug 18, 2018, 4:53:44 PM
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
        <link rel="stylesheet" href="https://cdn.datatables.net/buttons/1.5.2/css/buttons.dataTables.min.css"/>
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
                        <li>
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
                        <li class="treeview active">
                            <a href="javascript:void(0)"><i class="fa fa-tachometer"></i> <span>Summary Reports</span></a>
                            <ul class="treeview-menu">
                                <li><a href="${cp}/home/report1"><i class="fa fa-circle-o"></i> By Field of Study</a></li>
                                <li class="active"><a href="${cp}/home/report2"><i class="fa fa-circle-o"></i> By Consultant</a></li>
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
                        <div class="col-md-12">
                            <div class="box">
                                <div class="box-header with-border">
                                    <h3 class="box-title">Appointment Summary Report - By Consultant</h3>
                                    
                                    <div class="box-tools pull-right">
                                        <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i>
                                        </button>
                                        <button type="button" class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i></button>
                                    </div>
                                </div>
                                <!-- /.box-header -->
                                <div class="box-body">
                                    <form id="formSummaryReport1" class="form-horizontal" role="form">
                                        <div class="form-group row">
                                            <div class="col-md-3">
                                                <div class="input-group">
                                                    <span class="input-group-addon">Group</span>
                                                    <select class="form-control" name="reportType" required>
                                                        <option value="ByDates" selected="">By Date</option>
                                                        <option value="ByWeekDays">By Weekday</option>
                                                        <option value="ByMonths">By Month</option>
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="col-md-3">
                                                <div class="input-group">
                                                    <span class="input-group-addon">From</span>
                                                    <input type="date" name="startDate" class="form-control" required=""/>
                                                </div>
                                            </div>
                                            <div class="col-md-3">
                                                <div class="input-group">
                                                    <span class="input-group-addon">From</span>
                                                    <input type="date" name="endDate" class="form-control" required=""/>
                                                </div>
                                            </div>
                                            <div class="col-md-3">
                                                <button type="submit" class="btn btn-primary"><span class="fa fa-search"></span> Search</button>
                                            </div>
                                        </div>
                                    </form>
                                    <!--<div class="row">
                                        <div class="col-md-12">
                                            <p class="text-center">
                                                <strong>Sales: 1 Jan, 2014 - 30 Jul, 2014</strong>
                                            </p>
                                            
                                            <div class="chart">
                                                <canvas id="salesChart" style="height: 180px;"></canvas>
                                            </div>
                                        </div>
                                    </div>-->
                                    <div class="row">
                                        <div class="col-md-12">
                                            <table id="tblAppointmentReport1" class="table table-bordered display nowrap" style="width:100%">
                                                <thead>
                                                    <tr>
                                                        <th>Consultant Name</th>
                                                        <th>Field of Study</th>
                                                        <th>Year</th>
                                                        <th>Month</th>
                                                        <th>Weekday</th>
                                                        <th title="Appointment Date">Apt. Date</th>
                                                        <th title="Appointment Count">Apt. Count</th>
                                                    </tr>
                                                </thead>
                                            </table>
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
        <!--DataTables - Export -->
        <script src="https://cdn.datatables.net/buttons/1.5.2/js/dataTables.buttons.min.js"></script>
        <script src="https://cdn.datatables.net/buttons/1.5.2/js/buttons.flash.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jszip/3.1.3/jszip.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.36/pdfmake.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.36/vfs_fonts.js"></script>
        <script src="https://cdn.datatables.net/buttons/1.5.2/js/buttons.html5.min.js"></script>
        <script src="https://cdn.datatables.net/buttons/1.5.2/js/buttons.print.min.js"></script>
        <!-- FastClick -->
        <script src="${cp}/resources/plugins/fastclick/fastclick.js"></script>
        <!-- AdminLTE App -->
        <script src="${cp}/resources/js/app.min.js"></script>
        <!-- SlimScroll -->
        <script src="${cp}/resources/plugins/slimScroll/jquery.slimscroll.min.js"></script>
        <!-- ChartJS 1.0.1 -->
        <script src="${cp}/resources/plugins/chartjs/Chart.min.js"></script>
        <!-- <script src="${cp}/resources/js/pages/dashboard2.js"></script> -->
        <script>
            (function(){
                var module={
                    getSummaryReport1: function(reportType, startDate, endDate){
                        var table = $('#tblAppointmentReport1').dataTable();
                        table.fnDestroy(false);
                        table.fnDraw();
                        table = $('#tblAppointmentReport1').DataTable({
                            dom: 'Bfrtip',
                            buttons: [
                                {
                                    text: '<i class="fa fa-file-excel-o"></i> Excel',
                                    extend: 'excelHtml5',
                                    title: 'Appointment Summary Report - By Consultant ('+ startDate +' - '+ endDate +')',
                                    titleAttr: 'Excel'
                                },
                                {
                                    text: '<i class="fa fa-file-pdf-o"></i> PDF',
                                    extend: 'pdfHtml5',
                                    title: 'Appointment Summary Report - By Consultant ('+ startDate +' - '+ endDate +')',
                                    titleAttr: 'PDF',
                                    pageSize: 'A4'
                                }
                            ],
                            "ajax": {
                                "url": "/educan.oas/admin/report/report2/"+ reportType +"/"+ startDate +"/"+endDate,
                                "dataSrc": function (json) {
                                    return json;
                                    //return JSON.parse(json.GetFlightPlanScheduleResult);
                                }, "cache": false
                            },
                            "columns": [
                                {
                                    "data": function (data, type, full, meta) {
                                        return data.consultantName;
                                    },
                                    "defaultContent": ''
                                },
                                {
                                    "data": function (data, type, full, meta) {
                                        return data.fieldName;
                                    },
                                    "defaultContent": ''
                                },
                                {
                                    "data": "year",
                                    "defaultContent": ''
                                },
                                {
                                    "data": function (data, type, full, meta) {
                                        return data.month;
                                    },
                                    "defaultContent": ''
                                },
                                {
                                    "data": "weekDay",
                                    "defaultContent": ''
                                },
                                {
                                    "data": "date",
                                    "defaultContent": ''
                                },
                                {
                                    "data":"aptCount",
                                },
                            ],
                            "pagingType": "full_numbers",
                            "order": [[0, 'asc']],
                            "destroy": true,
                            "fnRowCallback": function (nRow, data, iDisplayIndex, iDisplayIndexFull) {
                                $(nRow).off(); // Unbind Events
                        
                            }
                        });
                    },
                    getFormData:function($form){
                        var unindexed_array = $form.serializeArray();
                        var indexed_array = {};

                        $.map(unindexed_array, function(n, i){
                            indexed_array[n['name']] = n['value'];
                        });

                        return indexed_array;
                    },
                    initDatePicker:function(){
                        var getFormattedDate = function () {
                            var pad = function (str, pad_char, max) {
                                str = str.toString();
                                return str.length < max ? pad(pad_char + str, max) : str;
                            };
                            var date = new Date();
                            var str = date.getFullYear() + "-" + pad((date.getMonth() + 1), "0", 2) + "-" + pad(date.getDate(), "0", 2);

                            return str;
                        };
                        
                        var $datepicker = $('[type=date]');
                        $datepicker.val(getFormattedDate()).prop('max', getFormattedDate());
                    },
                    register:{
                        events:function(){
                            $('#formSummaryReport1').submit(function(e){
                                e.preventDefault();
                                var formData = module.getFormData($(this));
                                module.getSummaryReport1(formData.reportType,formData.startDate,formData.endDate);
                            });
                        },
                        controls:function(){
                            module.initDatePicker();
                            $('#formSummaryReport1').submit();
                        }
                    }
                };
            
                $(document).ready(function(e){
                    module.register.events();
                    module.register.controls();
                
                    
                });
            })();
        </script>
    </body>
</html>
