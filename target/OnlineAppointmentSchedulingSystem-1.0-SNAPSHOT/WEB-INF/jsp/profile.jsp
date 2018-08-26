<%-- 
    Document   : register.jsp
    Created on : Jul 19, 2018, 8:26:23 AM
    Author     : User
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
                        <li class="treeview active">
                            <a href="${cp}/student/profile">
                                <i class="fa fa-user"></i>
                                <span>Student Profile</span>
                            </a>
                        </li>
                        <li class="treeview">
                            <a href="javascript:void(0)"><i class="fa fa-th"></i> <span>Appointment</span></a>
                            <ul class="treeview-menu">
                                <li><a href="${cp}/student/appointment/create"><i class="fa fa-circle-o"></i> Make Appointment</a></li>
                                <li><a href="${cp}/student/appointment/cancel"><i class="fa fa-circle-o"></i> Cancel Appointment</a></li>
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
                        <!-- right column -->
                        <div class="col-md-8">
                            <!-- Horizontal Form -->
                            <div class="box box-primary">
                                <div class="box-header with-border">
                                    <h3 class="box-title">Setup My Profile</h3>
                                </div>
                                <form method="post" action="${cp}/student/profile/update" role="form" class="form-horizontal">
                                    <div class="box-body">
                                        <div class="form-group">
                                            <label class="col-sm-2 control-label">Email</label>
                                            <div class="col-sm-10">
                                                <input type="email" class="form-control" placeholder="Email" value="${student.getEmail()}" readonly="" maxlength="254">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-sm-2 control-label">First Name</label>
                                            <div class="col-sm-10">
                                                <input type="text" name="firstName" class="form-control" placeholder="First Name" value="${student.getFirstName()}" required="" maxlength="100">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-sm-2 control-label">Last Name</label>
                                            <div class="col-sm-10">
                                                <input type="text" name="lastName" class="form-control" placeholder="Last Name" value="${student.getLastName()}" required="" maxlength="100">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-sm-2 control-label">Title</label>
                                            <div class="col-sm-4">
                                                <select name="title" class="form-control" required>
                                                    <option value="Mr" ${student.getTitle() == 'Mr' ? 'selected' : ''}>Mr.</option>
                                                    <option value="Mrs" ${student.getTitle() == 'Mrs' ? 'selected' : ''}>Mrs.</option>
                                                    <option value="Ms" ${student.getTitle() == 'Ms' ? 'selected' : ''}>Ms.</option>
                                                    <option value="Miss" ${student.getTitle() == 'Miss' ? 'selected' : ''}>Miss</option>
                                                </select>
                                            </div>
                                            <label class="col-sm-2 control-label">Gender</label>
                                            <div class="col-sm-4">
                                                <select name="gender" class="form-control" required>
                                                    <option value="M" ${student.getGender() == 'M' ? 'selected' : ''}>Male</option>
                                                    <option value="F" ${student.getGender() == 'F' ? 'selected' : ''}>Female</option>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-sm-2 control-label">D.O.B</label>
                                            <div class="col-sm-10">
                                                <input type="date" name="dateOfBirth"  value="${student.getDateOfBirth()}" class="form-control" required="" />
                                            </div>
                                        </div> 
                                        <div class="form-group">
                                            <label class="col-sm-2 control-label">Mobile No.</label>
                                            <div class="col-sm-10">
                                                <input type="text" name="mobileNumber" value="${student.getMobileNumber()}" maxlength="50" class="form-control" placeholder="Mobile No." />
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-sm-2 control-label">Phone No.</label>
                                            <div class="col-sm-10">
                                                <input type="text" name="phoneNumber" value="${student.getPhoneNumber()}" maxlength="50" class="form-control" placeholder="Phone No." />
                                            </div>
                                        </div>          
                                        <div class="form-group">
                                            <label class="col-sm-2 control-label">Address</label>
                                            <div class="col-sm-10">
                                                <input type="text" name="building" value="${student.getBuilding()}" class="form-control" placeholder="Building" maxlength="50" required="" />
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <div class="col-sm-10 col-sm-push-2">
                                                <input type="text" name="street" value="${student.getStreet()}" class="form-control" placeholder="Street" maxlength="50" />
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <div class="col-sm-10 col-sm-push-2">
                                                <input type="text" name="city" value="${student.getCity()}" class="form-control" placeholder="City" maxlength="50" required="" />
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <div class="col-sm-5 col-sm-offset-2">
                                                <input type="text" name="postal" value="${student.getPostal()}" class="form-control" placeholder="Postal" maxlength="9" />
                                            </div>
                                            <div class="col-sm-5">
                                                <input type="text" name="country" value="${student.getCountry()}" class="form-control" placeholder="Country" />
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-sm-2 control-label">Qualification</label>
                                            <div class="col-sm-10">
                                                <textarea name="qualification" rows="3" class="form-control" placeholder="Qualification" maxlength="500">${student.getQualification()}</textarea>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <div class="col-sm-10 col-sm-offset-2">
                                                <span class="${response.getCode()==1?'text-success':'text-danger'}">${response.getMessage()}</span>
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
                            <!-- /.box -->
                        </div>
                        <!--/.col (right) -->
                    </div>
                    <!-- /.row -->
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
        <!-- FastClick -->
        <script src="${cp}/resources/plugins/fastclick/fastclick.js"></script>
        <!-- SlimScroll -->
        <script src="${cp}/resources/plugins/slimScroll/jquery.slimscroll.min.js"></script>
        <!-- AdminLTE App -->
        <script src="${cp}/resources/js/app.min.js"></script>
    </body>
</html>
