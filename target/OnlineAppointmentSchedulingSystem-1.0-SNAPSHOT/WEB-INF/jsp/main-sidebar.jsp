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
            <li class='${param.controller=="appointment"?"active":""}'>
                <a href="${cp}/home/appointment">
                    <i class="fa fa-th"></i>
                    <span>Appointment</span>
                </a>
            </li>
            <li class='${param.controller=="consultant/session"?"active":""}'>
                <a href="${cp}/home/consultant/session">
                    <i class="fa fa-user"></i>
                    <span>Consult Session</span>
                </a>
            </li>
            <li class='${param.controller=="consultant"?"active":""}'>
                <a href="${cp}/home/consultant">
                    <i class="fa fa-user"></i>
                    <span>Consultant</span>
                </a>
            </li>
            <li class='${param.controller=="student"?"active":""}'>
                <a href="${cp}/home/student">
                    <i class="fa fa-user"></i>
                    <span>Student</span>
                </a>
            </li>
            <li class='${param.controller=="studyfield"?"active":""}'>
                <a href="${cp}/home/studyfield">
                    <i class="fa fa-user"></i>
                    <span>Study Field</span>
                </a>
            </li>
            <li class="treeview ${param.controller=="report1" || param.controller=="report2" ?"active":"" }">
                <a href="javascript:void(0)"><i class="fa fa-tachometer"></i> <span>Summary Reports</span></a>
                <ul class="treeview-menu">
                    <li class="${param.controller=="report1" ?"active":""}"><a href="${cp}/home/report1"><i class="fa fa-circle-o"></i> By Field of Study</a></li>
                    <li class="${param.controller=="report2" ?"active":""}"><a href="${cp}/home/report2"><i class="fa fa-circle-o"></i> By Consultant</a></li>
                </ul>
            </li>
        </ul>
    </section>
</aside>
