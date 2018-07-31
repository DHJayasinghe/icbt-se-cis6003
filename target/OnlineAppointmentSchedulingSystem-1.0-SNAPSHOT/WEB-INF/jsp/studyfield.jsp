<%-- 
    Document   : studyfield
    Created on : Jul 27, 2018, 8:14:59 PM
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
        <!-- Font Awesome -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css">
        <!-- Ionicons -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
        <!-- DataTables -->
        <link rel="stylesheet" href="${cp}/resources/plugins/datatables/dataTables.bootstrap.css">
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
                        <b>A</b>LT</span>
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
                                    <span class="hidden-xs">
                                        
                                    </span>
                                </a>
                                <ul class="dropdown-menu">
                                    <!-- User image -->
                                    <li class="user-header">
                                        <img src="${cp}/resources/img/user2-160x160.jpg" class="img-circle" alt="User Image">
                                        
                                        <p> </p>
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
                            <p> </p>
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
                        <li class="treeview">
                            <a href="${cp}/home/consultant/session">
                                <i class="fa fa-user"></i>
                                <span>Session</span>
                            </a>
                        </li>
                        <li class="treeview">
                            <a href="${cp}/home/consultant">
                                <i class="fa fa-user"></i>
                                <span>Consultant</span>
                            </a>
                        </li>
                        <li class="treeview">
                            <a href="${cp}/home/student">
                                <i class="fa fa-user"></i>
                                <span>Student</span>
                            </a>
                        </li>
                        <li class="treeview active">
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
                        <div class="col-md-12">
                            <div class="nav-tabs-custom">
                                <ul class="nav nav-tabs">
                                    <li class="active"><a href="#summary" data-toggle="tab" aria-expanded="false">Study Fields</a></li>
                                    <li class="hidden"><a href="#editrecord" data-toggle="tab" aria-expanded="false">Edit Details</a></li>
                                    <li class="hidden"><a href="#deleterecord" data-toggle="tab" aria-expanded="false">Delete Record</a></li>
                                </ul>
                                <div class="tab-content">
                                    <div class="tab-pane active" id="summary">
                                        <div class="row">
                                            <div class="col-md-7">
                                                <table id="tblSummaryDetails" class="table table-bordered table-striped">
                                                    <thead>
                                                        <tr>
                                                            <th></th>
                                                            <th>Field Name</th>
                                                            <th>Description</th>
                                                            <th>Created Date</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody></tbody>
                                                </table>
                                            </div>
                                            <div class="col-md-5">
                                                <div class="box">
                                                    <div class="box-header with-border">
                                                        <h3 class="box-title">Add a field</h3>
                                                    </div>
                                                    <form id="formAddRecord" method="post" action="${cp}/admin/studyfield/register" role="form" class="form-horizontal">
                                                        <div class="box-body">
                                                            <div class="form-group">
                                                                <label class="col-sm-4 control-label">Field Name</label>
                                                                <div class="col-sm-8">
                                                                    <input type="text" name="fieldName" class="form-control" placeholder="Field Name" required="" maxlength="100">
                                                                </div>
                                                            </div>
                                                            <div class="form-group">
                                                                <label class="col-sm-4 control-label">Description</label>
                                                                <div class="col-sm-8">
                                                                    <textarea type="text" name="description" class="form-control" placeholder="Description" maxlength="200"></textarea>
                                                                </div>
                                                            </div>
                                                            <div class="form-group">
                                                                <div class="col-sm-8 col-sm-offset-4 response-message">
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="box-footer">
                                                            <button type="submit" class="btn btn-primary pull-right">Add Field</button>
                                                            <button type="reset" class="btn btn-default pull-right">Cancel</button>
                                                        </div>
                                                    </form>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="tab-pane fade" id="editrecord">
                                        <div class="row">
                                            <div class="col-md-5">
                                                <div class="box">
                                                    <div class="box-header with-border">
                                                        <h3 class="box-title">Edit record</h3>
                                                    </div>
                                                    <form id="formEditRecord" method="post" action="${cp}/admin/studyfield/update" role="form" class="form-horizontal">
                                                        <div class="box-body">
                                                            <input name="fieldId" type="hidden" />
                                                            <div class="form-group">
                                                                <label class="col-sm-4 control-label">Field Name</label>
                                                                <div class="col-sm-8">
                                                                    <input type="text" name="fieldName" class="form-control" placeholder="Field Name" required="" maxlength="100">
                                                                </div>
                                                            </div>
                                                            <div class="form-group">
                                                                <label class="col-sm-4 control-label">Description</label>
                                                                <div class="col-sm-8">
                                                                    <textarea type="text" name="description" class="form-control" placeholder="Description" maxlength="200"></textarea>
                                                                </div>
                                                            </div>
                                                            <div class="form-group">
                                                                <div class="col-sm-8 col-sm-offset-4 response-message">
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <!-- /.box-body -->
                                                        <div class="box-footer">
                                                            <button type="submit" class="btn btn-primary pull-right">Save Record</button>
                                                            <button type="reset" class="btn btn-default pull-right">Cancel</button>
                                                        </div>
                                                        <!-- /.box-footer -->
                                                    </form>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div id="deleterecord" class="tab-pane fade">
                                        <div class="row">
                                            <div class="col-md-5">
                                                <div class="box">
                                                    <div class="box-header with-border">
                                                        <h3 class="box-title">Delete this record?</h3>
                                                    </div>
                                                    <form id="formDeleteRecord" method="post" action="${cp}/admin/studyfield/delete" role="form" class="form-horizontal">
                                                        <div class="box-body">
                                                            <input name="fieldId" type="hidden" />
                                                            <ul class="list-group list-group-unbordered">
                                                                <li class="list-group-item">
                                                                    <b>Field Name</b> <a class="pull-right" name="fieldName"></a>
                                                                </li>
                                                                <li class="list-group-item">
                                                                    <b>Description</b> <a class="pull-right" name="description"></a>
                                                                </li>
                                                            </ul>
                                                            <p class="text-red text-bold">Are you sure, you want to delete this record permanently?</p>
                                                            <div class="form-group">
                                                                <div class="col-sm-10 col-sm-offset-2 response-message">
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="box-footer">
                                                            <button type="submit" class="btn btn-primary pull-right">Delete Record</button>
                                                            <button type="reset" class="btn btn-default pull-right">Cancel</button>
                                                        </div>
                                                    </form>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!-- /.tab-content -->
                            </div>
                        </div>
                    </div>
                </section>
                <!-- /.content -->
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
        
        <script type="text/javascript">
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
                }
            };
            
            var getConsultantSummary=function(){
                var table = $('#tblSummaryDetails').dataTable();
                table.fnDestroy(false);
                table.fnDraw();
                table = $('#tblSummaryDetails').DataTable({
                    "ajax": {
                        "url": "http://localhost:8084/educan.oas/admin/studyfield/summary",
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
                                if(data.recStatus==='A') //if record is active
                                    return '<a href="javascript:void(0)" class="btn-edit text-primary" title="Edit" data-recid="'+ data.fieldId +'"><i class="fa fa-edit"></i></a>'+
                                        ' | ' +
                                        '<a href="javascript:void(0)" class="btn-delete text-danger" title="Remove" data-recid="'+ data.fieldId +'"><i class="fa fa-trash"></i></a>';
                                return '<small class="label pull-right bg-red">Inactive</small>';
                            }
                        },
                        {
                            "data": function (data, type, full, meta) {
                                return data.fieldName;
                            },
                            "defaultContent": ''
                        },
                        {
                            "data": "description",
                            "defaultContent": ''
                        },
                        {
                            "data":"createdDate",
                            "defaultContent": ''
                        }
                    ],
                    "pagingType": "full_numbers",
                    "order": [[0, 'asc']],
                    "destroy": true,
                    "fnRowCallback": function (nRow, data, iDisplayIndex, iDisplayIndexFull) {
                        $(nRow).off(); // Unbind Events
                        $(nRow).on('click', 'a.btn-edit', function (e) {
                            var recid=$(this).data('recid'); //record id
                            if(!isNaN(recid)){
                                //load consultant details to edit record
                                getConsultantDetails(recid,"edit"); 
                            }
                        });
                        $(nRow).on('click', 'a.btn-delete', function (e) {
                            var recid=$(this).data('recid'); //record id
                            if(!isNaN(recid)){
                                //load consultant details to delete record
                                getConsultantDetails(recid,"delete"); 
                            }
                        });
                    }
                });
            };
            var getConsultantDetails=function(id,type){
                if(isNaN(id)){
                    alert('invalid request parameter.');
                }else{
                    $.get("/educan.oas/admin/studyfield/details/"+id,function(data){
                        if(type==='edit'){
                            $('.nav-tabs a[href="#editrecord"]').tab('show'); //switch to edit panel
                            $.each(data, function(key, element) {
                                $('#formEditRecord [name="'+ key +'"]').val(element);
                                //console.log('key: ' + key + '\n' + 'value: ' + element);
                            });
                        }else if(type==="delete"){
                            $('.nav-tabs a[href="#deleterecord"]').tab('show'); //switch to delete panel
                            $.each(data, function(key, element) {
                                if(key==='fieldId')
                                    $('#formDeleteRecord [name="'+ key +'"]').val(element);
                                else
                                    $('#formDeleteRecord [name="'+ key +'"]').html(element);
                            });
                        }
                    });
                }
            }
            
            $(document).ready(function(e){
                getConsultantSummary();
                
                //consultant details add event
                $('#formAddRecord').submit(function(e){
                    e.preventDefault();
                    var formid=$(this).attr("id");
                    var action=$(this).attr("action");
                    var method=$(this).attr("method");
                    var data = app.serializeFormData($(this).serializeArray());
                    
                    $.ajax({
                        type:method,
                        url: action,
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        data: JSON.stringify(data),
                        beforeSend: function (jqXHR, settings) {
                        },
                        success: function (data, textStatus, jQxhr) {
                            $('#'+formid + ' .response-message').html(app.responseMessage(data));
                            if(data.code===1){
                                getConsultantSummary(); //refresh datatable
                            }
                        },
                        error: function (jqXhr, textStatus, errorThrown) {
                            console.log(jqXhr.responseText);
                            alert("Error occured while processing this request. Please try again later.");
                        }
                    });
                });
                $('#formAddRecord [type=reset]').click(function(e){
                    $('#formAddRecord .response-message').empty(); //clear response label
                });
                
                //consultant details edit event
                $('#formEditRecord').submit(function(e){
                    e.preventDefault();
                    var formid=$(this).attr("id");
                    var action=$(this).attr("action");
                    var method=$(this).attr("method");
                    var data = app.serializeFormData($(this).serializeArray());
                    
                    $.ajax({
                        type:method,
                        url: action,
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        data: JSON.stringify(data),
                        beforeSend: function (jqXHR, settings) {
                        },
                        success: function (data, textStatus, jQxhr) {
                            $('#'+formid + ' .response-message').html(app.responseMessage(data));
                            if(data.code===1){
                                getConsultantSummary(); //refresh datatable
                            }
                        },
                        error: function (jqXhr, textStatus, errorThrown) {
                            console.log(jqXhr.responseText);
                            alert("Error occured while processing this request. Please try again later.");
                        }
                    });
                });
                $('#formEditRecord [type=reset]').click(function(e){
                    $('.nav-tabs a[href="#summary"]').tab('show'); //switch to summary panel
                    $('#formEditRecord .response-message').empty(); //clear response label
                });
                
                //consultant details edit event
                $('#formDeleteRecord').submit(function(e){
                    e.preventDefault();
                    var formid=$(this).attr("id");
                    var action=$(this).attr("action");
                    var method=$(this).attr("method");
                    var data = app.serializeFormData($(this).serializeArray());
                    
                    $.ajax({
                        type:method,
                        url: action,
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        data: JSON.stringify(data),
                        beforeSend: function (jqXHR, settings) {
                        },
                        success: function (data, textStatus, jQxhr) {
                            $('#'+formid + ' .response-message').html(app.responseMessage(data));
                            if(data.code===1){
                                getConsultantSummary(); //refresh datatable
                                $('#formDeleteRecord [type=reset]').trigger('click');
                            }
                        },
                        error: function (jqXhr, textStatus, errorThrown) {
                            console.log(jqXhr.responseText);
                            alert("Error occured while processing this request. Please try again later.");
                        }
                    });
                });
                $('#formDeleteRecord [type=reset]').click(function(e){
                    $('.nav-tabs a[href="#summary"]').tab('show'); //switch to summary panel
                    $('#formDeleteRecord .response-message').empty(); //clear response label
                });
            });
        </script>
    </body>
</html>
