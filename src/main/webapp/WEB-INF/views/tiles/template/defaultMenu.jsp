<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>	
		<!-- Navigation -->
        <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse">
                    <span class="sr-only">Navegacion SWAAAD</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="${pageContext.request.contextPath}/home">SWAAAD</a>
            </div>
            <!-- Top Menu Items -->
            <ul class="nav navbar-right top-nav">
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-bell"></i> <b class="caret"></b></a>
                    <ul class="dropdown-menu alert-dropdown">
                        <li>
                            <a href="#">Alert Name <span class="label label-default">Alert Badge</span></a>
                        </li>
                        <li>
                            <a href="#">Alert Name <span class="label label-primary">Alert Badge</span></a>
                        </li>
                        <li>
                            <a href="#">Alert Name <span class="label label-success">Alert Badge</span></a>
                        </li>
                        <li>
                            <a href="#">Alert Name <span class="label label-info">Alert Badge</span></a>
                        </li>
                        <li>
                            <a href="#">Alert Name <span class="label label-warning">Alert Badge</span></a>
                        </li>
                        <li>
                            <a href="#">Alert Name <span class="label label-danger">Alert Badge</span></a>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <a href="#">View All</a>
                        </li>
                    </ul>
                </li>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-user"></i> John Smith <b class="caret"></b></a>
                    <ul class="dropdown-menu">
                        <li>
                            <a href="${pageContext.request.contextPath}/perfil"><i class="fa fa-fw fa-user"></i> Perfil</a>
                        </li>
                        <li>
                            <a href="#"><i class="fa fa-fw fa-gear"></i> Configuracion</a>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <a href="<c:url value="/logout" />"><i class="fa fa-fw fa-power-off"></i> Cerrar Sesion</a>
                        </li>
                    </ul>
                </li>
            </ul>
            <!-- Sidebar Menu Items - These collapse to the responsive navigation menu on small screens -->
            <div class="collapse navbar-collapse navbar-ex1-collapse">
                <ul class="nav navbar-nav side-nav">
                    <li>
                        <a href="${pageContext.request.contextPath}/perfil"><i class="fa fa-user"></i> Perfil</a>
                    </li>
                    <li class="active">
                        <a href="${pageContext.request.contextPath}/cursos" data-target="#demo"><i class="fa fa-fw fa-table"></i> Cursos</i></a>
                        <ul id="demo">
                        	
                            <li>
                                <a href="${pageContext.request.contextPath}/alumnos">Alumnos</a>
                            </li>
                            <li>
                                <a href="${pageContext.request.contextPath}/listNota">Notas</a>
                            </li>
                            <li>
                                <a href="${pageContext.request.contextPath}/asistencias">Asistencias</a>
                            </li>
                            <li>
                                <a href="${pageContext.request.contextPath}/actividades-pedagogicas">Act.Pedagogicas</a>
                            </li>
                            <li>
                                <a href="${pageContext.request.contextPath}/aula-dinamica">Aula Dinamica</a>
                            </li>
<!--                             <li> -->
<%--                                 <a href="${pageContext.request.contextPath}/participacion">Participacion</a> --%>
<!--                             </li> -->
<!--                             <li> -->
<%--                                 <a href="${pageContext.request.contextPath}/grupos">Grupos</a> --%>
<!--                             </li> -->
                        </ul>
                    </li>
                </ul>
            </div>
            <!-- /.navbar-collapse -->
        </nav>