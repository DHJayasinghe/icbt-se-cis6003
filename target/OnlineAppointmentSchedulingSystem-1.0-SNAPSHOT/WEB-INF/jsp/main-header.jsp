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