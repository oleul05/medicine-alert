<%@ page import="java.io.*,java.util.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<%@include file="header.jsp"%>
<html>

<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Drug Interaction Alert System</title>
<!-- Core CSS - Include with every page -->
<link href="../assets/plugins/bootstrap/bootstrap.css" rel="stylesheet" />
<link href="../assets/font-awesome/css/font-awesome.css"
	rel="stylesheet" />
<link href="../assets/css/style.css" rel="stylesheet" />
<link href="../assets/css/main-style.css" rel="stylesheet" />

<!-- Page-Level CSS -->

<!-- Core Scripts - Include with every page -->
<script src="../assets/plugins/jquery-1.10.2.js"></script>
<script src="../assets/plugins/bootstrap/bootstrap.min.js"></script>

<link href="../assets/plugins/jquery-ui.css" rel="stylesheet" />
<script src="../assets/plugins/jquery-ui.js"></script>
<script src="../assets/scripts/patient.js"></script>

</head>

<body>
	<!--  wrapper -->
	<div id="wrapper">
		<!-- navbar top -->
		<nav class="navbar navbar-default navbar-fixed-top" role="navigation"
			id="navbar">
			<!-- navbar-header -->
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target=".sidebar-collapse">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="index.html"> <img
					src="../assets/img/logo.png" alt="" />
				</a>
			</div>
			<!-- end navbar-header -->
			<!-- navbar-top-links -->
			<ul class="nav navbar-top-links navbar-right">
				<!-- main dropdown -->

				<li class="dropdown"><a class="dropdown-toggle"
					data-toggle="dropdown" href="#"> <i class="fa fa-user fa-3x"></i>
				</a> <!-- dropdown user-->
					<ul class="dropdown-menu dropdown-user">
						<li><a href="#"><i class="fa fa-user fa-fw"></i>User
								Profile</a></li>
						<li><a href="#"><i class="fa fa-gear fa-fw"></i>Settings</a>
						</li>
						<li class="divider"></li>
						<li><a href="../logout.jsp"><i
								class="fa fa-sign-out fa-fw"></i>Logout</a></li>
					</ul> <!-- end dropdown-user --></li>
				<!-- end main dropdown -->
			</ul>
			<!-- end navbar-top-links -->

		</nav>
		<!-- end navbar top -->

		<!-- navbar side -->
		<nav class="navbar-default navbar-static-side" role="navigation">
			<!-- sidebar-collapse -->
			<div class="sidebar-collapse">
				<!-- side-menu -->
				<ul class="nav" id="side-menu">
					<li>
						<!-- user image section-->
						<div class="user-section">
							<div class="user-section-inner">
								<img src="../assets/img/user.jpg" alt="">
							</div>
							<div class="user-info">
								<div><%=session.getAttribute("fname")%>
									<strong><%=session.getAttribute("lname")%></strong>
								</div>
								<div class="user-text-online">
									<span class=""></span>&nbsp;
								</div>
							</div>
						</div> <!--end user image section-->
					</li>
					<li class=""><a href="index.jsp"><i
							class="fa fa-dashboard fa-fw"></i>Dashboard</a></li>
					<li><a href="choosemedicine.jsp"><i
							class="fa fa-table fa-fw"></i>Medical History</a></li>
					<li><a href="patient.jsp"><i class="fa fa-edit fa-fw"></i>Add
							Patient</a></li>

					<li><a href="patientlist.jsp"><i class="fa fa-flask fa-fw"></i>Patient
							List</a></li>
					<li><a href="patientlist.jsp"><i class="fa fa-table fa-fw"></i>Medicine
							List</a></li>
					<li><a href="choosemedicine.jsp"><i class="fa fa-table fa-fw"></i>Choose Medicine
							</a></li>

					<li><a href="../logout.jsp"><i
							class="fa fa-sign-out fa-fw"></i>Logout</a></li>

				</ul>
				<!-- end side-menu -->
			</div>
			<!-- end sidebar-collapse -->
		</nav>
		<!-- end navbar side -->
		<!--  page-wrapper -->
		<div id="page-wrapper">

			<div class="row">
				<!-- Page Header -->
				<div class="col-lg-12">
					<h1 class="page-header">Dashboard</h1>
				</div>
				<!--End Page Header -->
				<div class="col-lg-6 col-sm-6">
					<h2>
						<a href="choosemedicine.jsp"><i class="fa fa-table fa-fw"></i>Medical
							History</a>
					</h2>
				</div>
				<div class="col-lg-6 col-sm-6">
					<h2>
						<a href="patientlist.jsp"><i class="fa fa-flask fa-fw"></i>Patient
							List</a>
					</h2>
				</div>
				<div class="col-lg-6 col-sm-6">
					<h2>
						<a href="patient.jsp"><i class="fa fa-edit fa-fw"></i>Add
							Patient</a>
					</h2>
				</div>
				<div class="col-lg-6 col-sm-6">
					<h2>
						<a href="../logout.jsp"><i class="fa fa-sign-out fa-fw"></i>Logout</a>
					</h2>
				</div>
			</div>

		</div>
		<!-- end page-wrapper -->

	</div>
	<!-- end wrapper -->

	<!-- Core Scripts - Include with every page -->


</body>

</html>
