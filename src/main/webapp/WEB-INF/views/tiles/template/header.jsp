<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<style>
	.vcenter {
	    display: inline-block;
	    vertical-align: middle;
	    float: none;
	}
</style>
		<!-- Logo starts -->
		<div class="logo">
			<a href="#"> 
				<img src="<c:url value='/resources/template/img/logo.png' />" alt="logo">
				<span class="menu-toggle hidden-xs"> <i class="fa fa-bars"></i> </span>
			</a>
		</div>
		<!-- Logo ends -->

		<!-- Custom Search Starts -->
		<div class="navbar-header">
			<a class="btn btn-primary" href="${pageContext.request.contextPath}/cursos">
				<i class="fa fa-desktop"></i> Cursos
			</a>
		</div>
		
		<!-- Custom Search Ends -->

		<!-- Mini right nav starts -->
		<div class="navbar-header pull-right vcenter">
			<ul id="mini-nav" class="clearfix">
				<li class="list-box user-profile hidden-xs">
					<a id="drop4" href="#" class="user-avtar animated rubberBanddropdown-toggle" data-toggle="dropdown" style="margin-top: 24px;">  
						<span class="user-name">Mr. Willams <i class="fa fa-angle-down"></i></span>
					</a>
					<ul class="dropdown-menu sm user-settings">
						<li><a href="profile.html"><i class="fa fa-meh-o"></i> Perfil</a></li>
						<hr class="less-margin">
						<li><a href="#"> <i class="fa fa-sun-o"></i> Configuración</a></li>
						<li><a href="login.html"> <i class="fa fa-sign-out"></i> Cerrar Sesion</a></li>
					</ul>
				</li>
			</ul>
		</div>
		<!-- Mini right nav ends -->




