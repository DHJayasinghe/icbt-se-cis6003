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
        <jsp:include page="header.jsp" />
    </head>
    <body class="hold-transition skin-blue sidebar-mini fixed">
        <div class="wrapper">
             <jsp:include page="main-header.jsp" />
            <jsp:include page="main-sidebar.jsp" >
                <jsp:param name="controller" value="studyfield" />
            </jsp:include>
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
