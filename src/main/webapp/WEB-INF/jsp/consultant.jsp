<%-- 
    Document   : consultantRegister
    Created on : Jul 27, 2018, 11:55:25 AM
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
        <!-- Select2 -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.5/css/select2.min.css" />
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
                        <li class="treeview active">
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
                        <li class="treeview">
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
                                    <li ><a href="#addrecord" data-toggle="tab" aria-expanded="true"><i class="fa fa-plus"></i>&nbsp;Create New</a></li>
                                    <li class="active"><a href="#summary" data-toggle="tab" aria-expanded="false">Consultants</a></li>
                                    <li class="hidden"><a href="#editrecord" data-toggle="tab" aria-expanded="false">Edit Details</a></li>
                                    <li class="hidden"><a href="#deleterecord" data-toggle="tab" aria-expanded="false">Delete Profile</a></li>
                                </ul>
                                <div class="tab-content">
                                    <div class="tab-pane fade" id="addrecord">
                                        <div class="row">
                                            <div class="col-md-7">
                                                <div class="box">
                                                    <div class="box-header with-border">
                                                        <h3 class="box-title">Profile Details</h3>
                                                    </div>
                                                    <form id="formAddConsultant" method="post" action="${cp}/admin/consultant/register" role="form" class="form-horizontal">
                                                        <div class="box-body">
                                                            <div class="form-group">
                                                                <label class="col-sm-2 control-label">Email</label>
                                                                <div class="col-sm-10">
                                                                    <input name="email" type="email" class="form-control" placeholder="Email" maxlength="254" required="">
                                                                </div>
                                                            </div>
                                                            <div class="form-group">
                                                                <label class="col-sm-2 control-label">First Name</label>
                                                                <div class="col-sm-10">
                                                                    <input type="text" name="firstName" class="form-control" placeholder="First Name" required="" maxlength="100">
                                                                </div>
                                                            </div>
                                                            <div class="form-group">
                                                                <label class="col-sm-2 control-label">Last Name</label>
                                                                <div class="col-sm-10">
                                                                    <input type="text" name="lastName" class="form-control" placeholder="Last Name" required="" maxlength="100">
                                                                </div>
                                                            </div>
                                                            <div class="form-group">
                                                                <label class="col-sm-2 control-label">Title</label>
                                                                <div class="col-sm-4">
                                                                    <select name="title" class="form-control" required>
                                                                        <option value="Mr">Mr.</option>
                                                                        <option value="Mrs">Mrs.</option>
                                                                        <option value="Ms">Ms.</option>
                                                                        <option value="Miss">Miss</option>
                                                                    </select>
                                                                </div>
                                                                <label class="col-sm-2 control-label">Gender</label>
                                                                <div class="col-sm-4">
                                                                    <select name="gender" class="form-control" required>
                                                                        <option value="M">Male</option>
                                                                        <option value="F">Female</option>
                                                                    </select>
                                                                </div>
                                                            </div>
                                                            <div class="form-group">
                                                                <label class="col-sm-2 control-label">D.O.B</label>
                                                                <div class="col-sm-10">
                                                                    <input type="date" name="dateOfBirth"  class="form-control" required="" />
                                                                </div>
                                                            </div> 
                                                            <div class="form-group">
                                                                <label class="col-sm-2 control-label">Mobile No.</label>
                                                                <div class="col-sm-10">
                                                                    <input type="text" name="mobileNumber" maxlength="50" class="form-control" placeholder="Mobile No." />
                                                                </div>
                                                            </div>
                                                            <div class="form-group">
                                                                <label class="col-sm-2 control-label">Phone No.</label>
                                                                <div class="col-sm-10">
                                                                    <input type="text" name="phoneNumber" maxlength="50" class="form-control" placeholder="Phone No." />
                                                                </div>
                                                            </div>          
                                                            <div class="form-group">
                                                                <label class="col-sm-2 control-label">Qualification</label>
                                                                <div class="col-sm-10">
                                                                    <textarea name="qualification" rows="3" class="form-control" placeholder="Qualification" maxlength="500"></textarea>
                                                                </div>
                                                            </div>
                                                            <div class="form-group">
                                                                <div class="col-sm-10 col-sm-offset-2 response-message">
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <!-- /.box-body -->
                                                        <div class="box-footer">
                                                            <button type="submit" class="btn btn-primary pull-right">Add Profile</button>
                                                            <button type="reset" class="btn btn-default pull-right">Cancel</button>
                                                        </div>
                                                        <!-- /.box-footer -->
                                                    </form>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="tab-pane active" id="summary">
                                        <table id="tblConsultantDetails" class="table table-bordered table-striped">
                                            <thead>
                                                <tr>
                                                    <th></th>
                                                    <th>Full Name</th>
                                                    <th>D.O.B</th>
                                                    <th>Contact No</th>
                                                    <th>Email</th>
                                                    <th>Qualifications</th>
                                                    <th>Created Date</th>
                                                </tr>
                                            </thead>
                                            <tbody></tbody>
                                        </table>
                                    </div>
                                    <div class="tab-pane fade" id="editrecord">
                                        <div class="row">
                                            <div class="col-md-7">
                                                <div class="box">
                                                    <div class="box-header with-border">
                                                        <h3 class="box-title">Profile details</h3>
                                                    </div>
                                                    <form id="formEditConsultant" method="post" action="${cp}/admin/consultant/update" role="form" class="form-horizontal">
                                                        <div class="box-body">
                                                            <input name="consultantId" type="hidden" />
                                                            <div class="form-group">
                                                                <label class="col-sm-2 control-label">Email</label>
                                                                <div class="col-sm-10">
                                                                    <input name="email" type="email" class="form-control" placeholder="Email" maxlength="254" required="">
                                                                </div>
                                                            </div>
                                                            <div class="form-group">
                                                                <label class="col-sm-2 control-label">First Name</label>
                                                                <div class="col-sm-10">
                                                                    <input type="text" name="firstName" class="form-control" placeholder="First Name" required="" maxlength="100">
                                                                </div>
                                                            </div>
                                                            <div class="form-group">
                                                                <label class="col-sm-2 control-label">Last Name</label>
                                                                <div class="col-sm-10">
                                                                    <input type="text" name="lastName" class="form-control" placeholder="Last Name" required="" maxlength="100">
                                                                </div>
                                                            </div>
                                                            <div class="form-group">
                                                                <label class="col-sm-2 control-label">Title</label>
                                                                <div class="col-sm-4">
                                                                    <select name="title" class="form-control" required>
                                                                        <option value="Mr">Mr.</option>
                                                                        <option value="Mrs">Mrs.</option>
                                                                        <option value="Ms">Ms.</option>
                                                                        <option value="Miss">Miss</option>
                                                                    </select>
                                                                </div>
                                                                <label class="col-sm-2 control-label">Gender</label>
                                                                <div class="col-sm-4">
                                                                    <select name="gender" class="form-control" required>
                                                                        <option value="M">Male</option>
                                                                        <option value="F">Female</option>
                                                                    </select>
                                                                </div>
                                                            </div>
                                                            <div class="form-group">
                                                                <label class="col-sm-2 control-label">D.O.B</label>
                                                                <div class="col-sm-10">
                                                                    <input type="date" name="dateOfBirth"  class="form-control" required="" />
                                                                </div>
                                                            </div> 
                                                            <div class="form-group">
                                                                <label class="col-sm-2 control-label">Mobile No.</label>
                                                                <div class="col-sm-10">
                                                                    <input type="text" name="mobileNumber" maxlength="50" class="form-control" placeholder="Mobile No." />
                                                                </div>
                                                            </div>
                                                            <div class="form-group">
                                                                <label class="col-sm-2 control-label">Phone No.</label>
                                                                <div class="col-sm-10">
                                                                    <input type="text" name="phoneNumber" maxlength="50" class="form-control" placeholder="Phone No." />
                                                                </div>
                                                            </div>          
                                                            <div class="form-group">
                                                                <label class="col-sm-2 control-label">Qualification</label>
                                                                <div class="col-sm-10">
                                                                    <textarea name="qualification" rows="3" class="form-control" placeholder="Qualification" maxlength="500"></textarea>
                                                                </div>
                                                            </div>
                                                            <div class="form-group">
                                                                <div class="col-sm-10 col-sm-offset-2 response-message">
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <!-- /.box-body -->
                                                        <div class="box-footer">
                                                            <button type="submit" class="btn btn-primary pull-right">Save Profile</button>
                                                            <button type="reset" class="btn btn-default pull-right">Cancel</button>
                                                        </div>
                                                        <!-- /.box-footer -->
                                                    </form>
                                                </div>
                                            </div>
                                            <div class="col-md-5">
                                                <div class="box">
                                                    <div class="box-header with-border">
                                                        <h3 class="box-title">Specialized Area</h3>
                                                    </div>
                                                    <form id="formEditSepeciality" method="post" action="${cp}/admin/consultant/speciality/update" role="form" class="form-horizontal">
                                                        <div class="box-body">
                                                            <input name="consultantId" type="hidden" />
                                                            <div class="form-group">
                                                                <label class="col-sm-3 control-label">Field of Study</label>
                                                                <div class="col-sm-9">
                                                                    <select name="fieldName" type="text" class="form-control" required=""></select>
                                                                </div>
                                                            </div>
                                                            <div class="form-group">
                                                                <label class="col-sm-3 control-label">Country</label>
                                                                <div class="col-sm-9">
                                                                    <select name="countryName" type="text" class="form-control" required=""></select>
                                                                </div>
                                                            </div>
                                                            <div class="form-group">
                                                                <div class="col-sm-9 col-sm-offset-3 response-message">
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="box-footer">
                                                            <button type="submit" class="btn btn-primary pull-right">Update</button>
                                                            <button type="reset" class="btn btn-default pull-right">Cancel</button>
                                                        </div>
                                                    </form>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div id="deleterecord" class="tab-pane fade">
                                        <div class="row">
                                            <div class="col-md-6">
                                                <div class="box">
                                                    <div class="box-header with-border">
                                                        <h3 class="box-title">Delete this profile?</h3>
                                                    </div>
                                                    <form id="formDeleteConsultant" method="post" action="${cp}/admin/consultant/delete" role="form" class="form-horizontal">
                                                        <div class="box-body">
                                                            <input name="consultantId" type="hidden" />
                                                            <ul class="list-group list-group-unbordered">
                                                                <li class="list-group-item">
                                                                    <b>Email</b> <a class="pull-right" name="email"></a>
                                                                </li>
                                                                <li class="list-group-item">
                                                                    <b>First Name</b> <a class="pull-right" name="firstName"></a>
                                                                </li>
                                                                <li class="list-group-item">
                                                                    <b>Last Name</b> <a class="pull-right" name="lastName"></a>
                                                                </li>
                                                                <li class="list-group-item">
                                                                    <b>D.O.B</b> <a class="pull-right" name="dateOfBirth"></a>
                                                                </li>
                                                                <li class="list-group-item">
                                                                    <b>Qualification</b> <a class="pull-right" name="qualification"></a>
                                                                </li>
                                                            </ul>
                                                            <p class="text-red text-bold">Are you sure, you want to delete this profile permanently?</p>
                                                            <div class="form-group">
                                                                <div class="col-sm-10 col-sm-offset-2 response-message">
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="box-footer">
                                                            <button type="submit" class="btn btn-primary pull-right">Delete Profile</button>
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
        <!-- Select2 -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.5/js/select2.full.min.js"></script>
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
                },
                select2:{
                    fieldofStudy:function(data){ 
                        return {
                            placeholder: '- Select your option -',
                            width: "100%",
                            allowClear: true,
                            multiple:true,
                            data:data
                        };
                    },
                    consultCountry:function(data){ 
                        return {
                            placeholder: '- Select your option -',
                            width: "100%",
                            allowClear: true,
                            multiple:true,
                            data:data
                        };
                    }
                }
            };
            
            var getConsultantSummary=function(){
                var table = $('#tblConsultantDetails').dataTable();
                table.fnDestroy(false);
                table.fnDraw();
                table = $('#tblConsultantDetails').DataTable({
                    "ajax": {
                        "url": "/educan.oas/admin/consultant/summary",
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
                                    return '<a href="javascript:void(0)" class="btn-edit text-primary" title="Edit" data-recid="'+ data.consultantId +'"><i class="fa fa-edit"></i></a>'+
                                        ' | ' +
                                        '<a href="javascript:void(0)" class="btn-delete text-danger" title="Remove" data-recid="'+ data.consultantId +'"><i class="fa fa-trash"></i></a>';
                                return '<small class="label pull-right bg-red">Inactive</small>';
                            }
                        },
                        {
                            "data": function (data, type, full, meta) {
                                return data.title + ' '+data.firstName+' '+data.lastName;
                            },
                            "defaultContent": ''
                        },
                        {
                            "data": "dateOfBirth",
                            "defaultContent": ''
                        },
                        {
                            "data": function (data, type, full, meta) {
                                return data.mobileNumber + '/' +data.phoneNumber;
                            },
                            "defaultContent": ''
                        },
                        {
                            "data": "email",
                            "defaultContent": ''
                        },
                        {
                            "data": "qualification",
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
                                //load consultant details + consultant specialized areas to edit
                                getConsultantDetails(recid,"edit"); 
                                getConsultantSpeciality(recid);
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
                    $.get("/educan.oas/admin/consultant/details/"+id,function(data){
                        if(type==='edit'){
                            $('.nav-tabs a[href="#editrecord"]').tab('show'); //switch to edit panel
                            $.each(data, function(key, element) {
                                $('#formEditConsultant [name="'+ key +'"]').val(element);
                                //console.log('key: ' + key + '\n' + 'value: ' + element);
                            });
                        }else if(type==="delete"){
                            $('.nav-tabs a[href="#deleterecord"]').tab('show'); //switch to delete panel
                            $.each(data, function(key, element) {
                                if(key==='consultantId')
                                    $('#formDeleteConsultant [name="'+ key +'"]').val(element);
                                else
                                    $('#formDeleteConsultant [name="'+ key +'"]').html(element);
                            });
                        }
                    });
                }
            };
            var getFieldofStudyList=function(){
                $.get("/educan.oas/admin/studyfield/list",function(data){
                    var data = $.map(data, function(n,i){
                        return {id:n.fieldId,text:n.fieldName};
                    });
                    //console.log(data);
                    //init field of study dropdown list
                    $('#formEditSepeciality [name=fieldName]').select2(app.select2.fieldofStudy(data));
                });
            };
            var getConsultCountryList=function(){
                $.get("/educan.oas/admin/country/list",function(data){
                    var data = $.map(data, function(n,i){
                        return {id:n.countryId,text:n.countryName};
                    });
                    //console.log(data);
                    //init consult country dropdown list
                    $('#formEditSepeciality [name=countryName]').select2(app.select2.consultCountry(data));
                });
            };
            var getConsultantSpeciality=function(id){
                $.get("/educan.oas/admin/consultant/speciality/details/"+id,function(data){
                    if(data!==null){
                        $('#formEditSepeciality [name="consultantId"]').val(data.consultantId);
                        $('#formEditSepeciality [name="fieldName"]').val(
                                data.fieldName!==null ? data.fieldName.toString().split(','): '').change();
                        $('#formEditSepeciality [name="countryName"]').val(
                                data.countryName!==null ? data.countryName.toString().split(','): '').change();
                    }else{
                        //Empty Form Fields If data not exist
                        $('#formEditSepeciality [name="consultantId"]').val(0);
                        $('#formEditSepeciality [name="fieldName"]').val('').change();
                        $('#formEditSepeciality [name="countryName"]').val('').change();
                    }
                });
            };
            
            $(document).ready(function(e){
                getConsultantSummary();
                getFieldofStudyList();
                getConsultCountryList();
                
                //consultant details add event
                $('#formAddConsultant').submit(function(e){
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
                $('#formAddConsultant [type=reset]').click(function(e){
                    $('#formAddConsultant .response-message').empty(); //clear response label
                });
                
                //consultant details edit event
                $('#formEditConsultant').submit(function(e){
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
                $('#formEditConsultant [type=reset]').click(function(e){
                    $('.nav-tabs a[href="#summary"]').tab('show'); //switch to summary panel
                    $('#formEditConsultant .response-message').empty(); //clear response label
                });
                
                //consultant details delete event
                $('#formDeleteConsultant').submit(function(e){
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
                                $('#formDeleteConsultant [type=reset]').trigger('click');
                            }
                        },
                        error: function (jqXhr, textStatus, errorThrown) {
                            console.log(jqXhr.responseText);
                            alert("Error occured while processing this request. Please try again later.");
                        }
                    });
                });
                $('#formDeleteConsultant [type=reset]').click(function(e){
                    $('.nav-tabs a[href="#summary"]').tab('show'); //switch to summary panel
                    $('#formDeleteConsultant .response-message').empty(); //clear response label
                });
                
                //consultant specialized field edits event
                $('#formEditSepeciality').submit(function(e){
                    e.preventDefault();
                    var formid=$(this).attr("id");
                    var action=$(this).attr("action");
                    var method=$(this).attr("method");
                    var data = app.serializeFormData($(this).serializeArray());
                    data.fieldName=$('#'+formid+' [name=fieldName]').val().join(',');
                    data.countryName=$('#'+formid+' [name=countryName]').val().join(',');
                    //console.log(data);
                    
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
                                //getConsultantSummary(); //refresh datatable
                                //$('#formDeleteConsultant [type=reset]').trigger('click');
                            }
                        },
                        error: function (jqXhr, textStatus, errorThrown) {
                            console.log(jqXhr.responseText);
                            alert("Error occured while processing this request. Please try again later.");
                        }
                    });
                });
                $('#formEditSepeciality [type=reset]').click(function(e){
                    var consultantId=$('#formEditSepeciality [name=consultantId]').val();
                    getConsultantSpeciality(consultantId);  //load already assigned specialities
                    $('#formEditSepeciality .response-message').empty(); //clear response label
                });
            });
        </script>
    </body>
</html>

