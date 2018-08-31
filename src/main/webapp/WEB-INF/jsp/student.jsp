<%-- 
    Document   : student
    Created on : Jul 28, 2018, 6:13:00 PM
    Author     : "Dhanuka Jayasinghe"
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="cp" value="${pageContext.request.servletContext.contextPath}" scope="request" />

<!DOCTYPE html>
<html>
    <head>
         <jsp:include page="header.jsp" />
    </head>
    <body class="hold-transition skin-blue sidebar-mini fixed">
        <div class="wrapper">
             <jsp:include page="main-header.jsp" />
            <jsp:include page="main-sidebar.jsp" >
                <jsp:param name="controller" value="student" />
            </jsp:include>
            <!-- Content Wrapper. Contains page content -->
            <div class="content-wrapper">
                <!-- Main content -->
                <section class="content">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="nav-tabs-custom">
                                <ul class="nav nav-tabs">
                                    <li class="active"><a href="#summary" data-toggle="tab" aria-expanded="false">Students</a></li>
                                    <li class="hidden"><a href="#editrecord" data-toggle="tab" aria-expanded="false">Student Details</a></li>
                                    <li class="hidden"><a href="#deleterecord" data-toggle="tab" aria-expanded="false">Delete Profile</a></li>
                                </ul>
                                <div class="tab-content">
                                    <div class="tab-pane active" id="summary">
                                        <table id="tblConsultantDetails" class="table table-bordered table-striped">
                                            <thead>
                                                <tr>
                                                    <th></th>
                                                    <th>Full Name</th>
                                                    <th>D.O.B</th>
                                                    <th>Contact No</th>
                                                    <th>Email</th>
                                                    <th>Joined Date</th>
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
                                                    <form id="formEditRecord" method="post" role="form" class="form-horizontal">
                                                        <div class="box-body">
                                                            <input name="studentId" type="hidden" />
                                                            <div class="form-group">
                                                                <label class="col-sm-2 control-label">Email</label>
                                                                <div class="col-sm-10">
                                                                    <input name="email" type="email" class="form-control" placeholder="Email" maxlength="254" required="" readonly="">
                                                                </div>
                                                            </div>
                                                            <div class="form-group">
                                                                <label class="col-sm-2 control-label">First Name</label>
                                                                <div class="col-sm-10">
                                                                    <input type="text" name="firstName" class="form-control" placeholder="First Name" required="" maxlength="100" readonly="">
                                                                </div>
                                                            </div>
                                                            <div class="form-group">
                                                                <label class="col-sm-2 control-label">Last Name</label>
                                                                <div class="col-sm-10">
                                                                    <input type="text" name="lastName" class="form-control" placeholder="Last Name" required="" maxlength="100" readonly="">
                                                                </div>
                                                            </div>
                                                            <div class="form-group">
                                                                <label class="col-sm-2 control-label">Title</label>
                                                                <div class="col-sm-4">
                                                                    <select name="title" class="form-control" required disabled>
                                                                        <option value="Mr">Mr.</option>
                                                                        <option value="Mrs">Mrs.</option>
                                                                        <option value="Ms">Ms.</option>
                                                                        <option value="Miss">Miss</option>
                                                                    </select>
                                                                </div>
                                                                <label class="col-sm-2 control-label">Gender</label>
                                                                <div class="col-sm-4">
                                                                    <select name="gender" class="form-control" required disabled>
                                                                        <option value="M">Male</option>
                                                                        <option value="F">Female</option>
                                                                    </select>
                                                                </div>
                                                            </div>
                                                            <div class="form-group">
                                                                <label class="col-sm-2 control-label">D.O.B</label>
                                                                <div class="col-sm-10">
                                                                    <input type="date" name="dateOfBirth"  class="form-control" required="" readonly="" />
                                                                </div>
                                                            </div> 
                                                            <div class="form-group">
                                                                <label class="col-sm-2 control-label">Mobile No.</label>
                                                                <div class="col-sm-10">
                                                                    <input type="text" name="mobileNumber" maxlength="50" class="form-control" placeholder="Mobile No." readonly="" />
                                                                </div>
                                                            </div>
                                                            <div class="form-group">
                                                                <label class="col-sm-2 control-label">Phone No.</label>
                                                                <div class="col-sm-10">
                                                                    <input type="text" name="phoneNumber" maxlength="50" class="form-control" placeholder="Phone No." readonly="" />
                                                                </div>
                                                            </div>
                                                            <div class="form-group">
                                                                <label class="col-sm-2 control-label">Address</label>
                                                                <div class="col-sm-10">
                                                                    <input type="text" name="building" value="${student.getBuilding()}" class="form-control" placeholder="Building" maxlength="50" required="" readonly="" />
                                                                </div>
                                                            </div>
                                                            <div class="form-group">
                                                                <div class="col-sm-10 col-sm-push-2">
                                                                    <input type="text" name="street" value="${student.getStreet()}" class="form-control" placeholder="Street" maxlength="50" readonly="" />
                                                                </div>
                                                            </div>
                                                            <div class="form-group">
                                                                <div class="col-sm-10 col-sm-push-2">
                                                                    <input type="text" name="city" value="${student.getCity()}" class="form-control" placeholder="City" maxlength="50" required="" readonly="" />
                                                                </div>
                                                            </div>
                                                            <div class="form-group">
                                                                <div class="col-sm-5 col-sm-offset-2">
                                                                    <input type="text" name="postal" value="${student.getPostal()}" class="form-control" placeholder="Postal" maxlength="9" readonly="" />
                                                                </div>
                                                                <div class="col-sm-5">
                                                                    <input type="text" name="country" value="${student.getCountry()}" class="form-control" placeholder="Country" readonly="" />
                                                                </div>
                                                            </div>
                                                            <div class="form-group">
                                                                <label class="col-sm-2 control-label">Qualification</label>
                                                                <div class="col-sm-10">
                                                                    <textarea name="qualification" rows="3" class="form-control" placeholder="Qualification" maxlength="500" readonly=""></textarea>
                                                                </div>
                                                            </div>
                                                            <div class="form-group">
                                                                <div class="col-sm-10 col-sm-offset-2 response-message">
                                                                </div>
                                                            </div>
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
                                                    <form id="formDeleteRecord" method="post" action="${cp}/admin/student/delete" role="form" class="form-horizontal">
                                                        <div class="box-body">
                                                            <input name="studentId" type="hidden" />
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
             <jsp:include page="footer.jsp" />
        </div>
        <!-- ./wrapper -->
        
        <jsp:include page="page-vendor-script.jsp"/>
        
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
            };
            
            var getStudentSummary=function(){
                var table = $('#tblConsultantDetails').dataTable();
                table.fnDestroy(false);
                table.fnDraw();
                table = $('#tblConsultantDetails').DataTable({
                    "ajax": {
                        "url": "/educan.oas/admin/student/summary",
                        "dataSrc": function (json) {
                            return json;
                        }, "cache": false
                    },
                    "columns": [
                        {
                            "data": null,
                            "orderable":false,
                            "render": function (data, type, full, meta) {
                                if(data.recStatus==='A') //if record is active
                                    return '<a href="javascript:void(0)" class="btn-edit text-primary" title="Details" data-recid="'+ data.email +'"><i class="fa fa-list"></i></a>'+
                                        ' | ' +
                                        '<a href="javascript:void(0)" class="btn-delete text-danger" title="Remove" data-recid="'+ data.email +'"><i class="fa fa-trash"></i></a>';
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
                            //load student details to edit
                            getStudentDetails(recid,"edit"); 
                        });
                        $(nRow).on('click', 'a.btn-delete', function (e) {
                            var recid=$(this).data('recid'); //record id
                            //load student details to delete record
                            getStudentDetails(recid,"delete"); 
                        });
                    }
                });
            };
            var getStudentDetails=function(id,type){
                $.get("/educan.oas/admin/student/details/"+id+"/",function(data){
                    if(type==='edit'){
                        $('.nav-tabs a[href="#editrecord"]').tab('show'); //switch to edit panel
                        $.each(data, function(key, element) {
                            $('#formEditRecord [name="'+ key +'"]').val(element);
                            //console.log('key: ' + key + '\n' + 'value: ' + element);
                        });
                    }else if(type==="delete"){
                        $('.nav-tabs a[href="#deleterecord"]').tab('show'); //switch to delete panel
                        $.each(data, function(key, element) {
                            if(key==='consultantId')
                                $('#formDeleteRecord [name="'+ key +'"]').val(element);
                            else
                                $('#formDeleteRecord [name="'+ key +'"]').html(element);
                        });
                    }
                });
            };
            
            $(document).ready(function(e){
                getStudentSummary();
                
                //consultant details delete event
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
                                getStudentSummary()(); //refresh datatable
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
