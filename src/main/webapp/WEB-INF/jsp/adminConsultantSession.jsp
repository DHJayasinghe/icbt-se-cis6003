<%-- 
    Document   : availability
    Created on : Jul 28, 2018, 9:04:50 PM
    Author     : "Dhanuka Jayasinghe"
--%>
    
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="cp" value="${pageContext.request.servletContext.contextPath}" scope="request" />
    
<!DOCTYPE html>
<html>
    <head>
        <jsp:include page="header.jsp" />
        <!-- Select2 -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.5/css/select2.min.css" />
    </head>
    <body class="hold-transition skin-blue sidebar-mini fixed">
        <div class="wrapper">
            <jsp:include page="main-header.jsp" />
            <jsp:include page="main-sidebar.jsp" >
                <jsp:param name="controller" value="consultant/session" />
            </jsp:include>
                
            <!-- Content Wrapper. Contains page content -->
            <div class="content-wrapper">
                <!-- Main content -->
                <section class="content">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="nav-tabs-custom">
                                <ul class="nav nav-tabs">
                                    <li ><a href="#addrecord" data-toggle="tab" aria-expanded="true"><i class="fa fa-plus"></i>&nbsp;Create New</a></li>
                                    <li class="active"><a href="#summary" data-toggle="tab" aria-expanded="false">Consultant Sessions</a></li>
                                    <li class="hidden"><a href="#editrecord" data-toggle="tab" aria-expanded="false">Edit Details</a></li>
                                    <li class="hidden"><a href="#deleterecord" data-toggle="tab" aria-expanded="false">Delete Profile</a></li>
                                </ul>
                                <div class="tab-content">
                                    <div class="tab-pane fade" id="addrecord">
                                        <div class="row">
                                            <div class="col-md-7">
                                                <div class="box">
                                                    <div class="box-header with-border">
                                                        <h3 class="box-title">Consultant Session</h3>
                                                    </div>
                                                    <form id="formAddRecord" method="post" action="${cp}/admin/consultant/session/add" role="form" class="form-horizontal">
                                                        <div class="box-body">
                                                            <div class="form-group">
                                                                <label class="col-sm-3 control-label">Consultant</label>
                                                                <div class="col-sm-9">
                                                                    <select name="consultantId" type="email" class="form-control" required=""></select>
                                                                </div>
                                                            </div>
                                                            <div class="form-group">
                                                                <label class="col-sm-3 control-label">Date</label>
                                                                <div class="col-sm-9">
                                                                    <input type="date" name="sessionDate" class="form-control" placeholder="Session Date" required="" />
                                                                </div>
                                                            </div>
                                                            <div class="form-group">
                                                                <label class="col-sm-3 control-label">Duration (min)</label>
                                                                <div class="col-sm-9">
                                                                    <input type="number" name="sessionDuration" value="30" min="10" max="120" class="form-control" placeholder="Session Duration" />
                                                                </div>
                                                            </div>
                                                            <div class="form-group">
                                                                <label class="col-sm-3 control-label">Available From</label>
                                                                <div class="col-sm-9">
                                                                    <input type="time" name="sessionTimeFrom" value="08:30" class="form-control" placeholder="Last Name" required="" />
                                                                </div>
                                                            </div>
                                                            <div class="form-group">
                                                                <label class="col-sm-3 control-label">Available To</label>
                                                                <div class="col-sm-9">
                                                                    <input type="time" name="sessionTimeTo" value="17:30"  class="form-control" required="" />
                                                                </div>
                                                            </div> 
                                                                
                                                            <div class="form-group">
                                                                <label class="col-sm-3 control-label">Room No.</label>
                                                                <div class="col-sm-9">
                                                                    <input type="text" name="room" maxlength="50" class="form-control" placeholder="Session Room" />
                                                                </div>
                                                            </div>       
                                                            <div class="form-group">
                                                                <div class="col-sm-9 col-sm-offset-3 response-message">
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <!-- /.box-body -->
                                                        <div class="box-footer">
                                                            <button type="submit" class="btn btn-primary pull-right">Add Session</button>
                                                            <button type="reset" class="btn btn-default pull-right">Cancel</button>
                                                        </div>
                                                        <!-- /.box-footer -->
                                                    </form>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="tab-pane active" id="summary">
                                        <table id="tblSummaryDetails" class="table table-bordered table-striped">
                                            <thead>
                                                <tr>
                                                    <th style="width:8px;"></th>
                                                    <th>Consultant</th>
                                                    <th>Session Date</th>
                                                    <th>Duration</th>
                                                    <th>Available (Time)</th>
                                                    <th>Room</th>
                                                    <th>Created Date</th>
                                                </tr>
                                            </thead>
                                            <tbody></tbody>
                                        </table>
                                    </div>
                                    <div id="deleterecord" class="tab-pane fade">
                                        <div class="row">
                                            <div class="col-md-6">
                                                <div class="box">
                                                    <div class="box-header with-border">
                                                        <h3 class="box-title">Cancel this session?</h3>
                                                    </div>
                                                    <form id="formDeleteRecord" method="post" action="${cp}/admin/consultant/session/delete" role="form" class="form-horizontal">
                                                        <div class="box-body">
                                                            <input name="sessionId" type="hidden" />
                                                            <ul class="list-group list-group-unbordered">
                                                                <li class="list-group-item">
                                                                    <b>Consultant Name</b> <a class="pull-right" name="consultantName"></a>
                                                                </li>
                                                                <li class="list-group-item">
                                                                    <b>Session Date</b> <a class="pull-right" name="sessionDate"></a>
                                                                </li>
                                                                <li class="list-group-item">
                                                                    <b>Available (From)</b> <a class="pull-right" name="sessionTimeFrom"></a>
                                                                </li>
                                                                <li class="list-group-item">
                                                                    <b>Available (To)</b> <a class="pull-right" name="sessionTimeTo"></a>
                                                                </li>
                                                                <li class="list-group-item">
                                                                    <b>Room</b> <a class="pull-right" name="room"></a>
                                                                </li>
                                                            </ul>
                                                            <p class="text-danger text-bold">Are you sure, you want to cancel this consultant session? Please provide valid reason for cancellation.</p>
                                                            
                                                            <div class="form-group">
                                                                <div class="col-md-12">
                                                                    <textarea name="recRemarks" class="form-control" rows="3" maxlength="150" required=""></textarea>
                                                                </div>
                                                            </div>
                                                            <p class="text-warning text-bold"><i class="text-bold">NOTE:</i> This will cancel all the associated student appointments, and appointment cancellation email will send to students.</p>
                                                            <div class="form-group">
                                                                <div class="col-sm-10 col-sm-offset-2 response-message">
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="box-footer">
                                                            <button type="reset" class="btn btn-default pull-right">Go Back</button>
                                                            <button type="submit" class="btn btn-danger pull-right"><i class="fa fa-trash"></i> Yes, Continue</button>
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
        <script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.5/js/select2.full.min.js"></script>
            
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
            
            var getSummaryDetails=function(){
                var table = $('#tblSummaryDetails').dataTable();
                table.fnDestroy(false);
                table.fnDraw();
                table = $('#tblSummaryDetails').DataTable({
                    "ajax": {
                        "url": "/educan.oas/admin/consultant/session/summary",
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
                                    return '<a href="javascript:void(0)" class="btn-delete text-danger" title="Cancel" data-recid="'+ data.sessionId +'"><i class="fa fa-trash"></i></a>';
                                return '<small class="label pull-right bg-red">Inactive</small>';
                            }
                        },
                        {
                            "data": function (data, type, full, meta) {
                                return data.consultantName;
                            },
                            "defaultContent": ''
                        },
                        {
                            "data": "sessionDate",
                            "defaultContent": ''
                        },
                        {
                            "data": "sessionDuration",
                            "defaultContent": ''
                        },
                        {
                            "data": function (data, type, full, meta) {
                                return data.sessionWeekDay+', '+ data.sessionTimeFrom + ' - '+data.sessionTimeTo;
                            },
                            "defaultContent": ''
                        },
                        {
                            "data": "room",
                            "defaultContent": ''
                        },
                        {
                            "data":"createdDate",
                            "defaultContent": ''
                        }
                    ],
                    "pagingType": "full_numbers",
                    "order": [[2, 'desc']],
                    "destroy": true,
                    "fnRowCallback": function (nRow, data, iDisplayIndex, iDisplayIndexFull) {
                        $(nRow).off(); // Unbind Events
                        $(nRow).on('click', 'a.btn-delete', function (e) {
                            var recid=$(this).data('recid'); //record id
                            if(!isNaN(recid)){
                                //load session details to delete record
                                getSessionDetails(recid);
                            }
                        });
                    }
                });
            };
            var getSessionDetails=function(id){
                if(isNaN(id)){
                    alert('invalid request parameter.');
                }else{
                    $.get("/educan.oas/admin/consultant/session/details/"+id,function(data){
                        $('.nav-tabs a[href="#deleterecord"]').tab('show'); //switch to delete panel
                        $.each(data, function(key, element) {
                            if(key==='consultantId')
                                $('#formDeleteRecord [name="'+ key +'"]').val(element);
                            else
                                $('#formDeleteRecord [name="'+ key +'"]').html(element);
                        });
                    });
                }
            };
            var getConsultantList=function(){
                $.get("/educan.oas/admin/consultant/list",function(data){
                    var data = $.map(data, function(n,i){
                        return {id:n.consultantId,text:n.title+' '+n.firstName+' '+n.lastName};
                    });
                    //console.log(data);
                    //init consult country dropdown list
                    $('#formAddRecord [name=consultantId]').select2(app.select2.consultant(data));
                });
            };
            
            $(document).ready(function(e){
                getSummaryDetails();
                getConsultantList();
                
                //consultant session add event
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
                                getSummaryDetails(); //refresh datatable
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
                                getSummaryDetails(); //refresh datatable
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