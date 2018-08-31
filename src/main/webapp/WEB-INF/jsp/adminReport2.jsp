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
         <jsp:include page="header.jsp" />
    </head>
    <body class="hold-transition skin-blue sidebar-mini fixed">
        <div class="wrapper">
            <jsp:include page="main-header.jsp" />
            <jsp:include page="main-sidebar.jsp" >
                <jsp:param name="controller" value="report2" />
            </jsp:include>
            
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
                                                    <span class="input-group-addon">To</span>
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
            <jsp:include page="footer.jsp" />
        </div>
        <!-- ./wrapper -->
        
        <jsp:include page="page-vendor-script.jsp"/>
        <!--DataTables - Export -->
        <script src="https://cdn.datatables.net/buttons/1.5.2/js/dataTables.buttons.min.js"></script>
        <script src="https://cdn.datatables.net/buttons/1.5.2/js/buttons.flash.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jszip/3.1.3/jszip.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.36/pdfmake.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.36/vfs_fonts.js"></script>
        <script src="https://cdn.datatables.net/buttons/1.5.2/js/buttons.html5.min.js"></script>
        <script src="https://cdn.datatables.net/buttons/1.5.2/js/buttons.print.min.js"></script>
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
