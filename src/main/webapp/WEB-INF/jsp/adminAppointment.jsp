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
        <jsp:include page="header.jsp" />
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
            <jsp:include page="main-header.jsp" />
            <jsp:include page="main-sidebar.jsp" >
                <jsp:param name="controller" value="appointment" />
            </jsp:include>
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
            <jsp:include page="footer.jsp" />
        </div>
        <!-- ./wrapper -->
        
        <jsp:include page="page-vendor-script.jsp"/>
        
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
