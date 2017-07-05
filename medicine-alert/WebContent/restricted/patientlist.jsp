<%@ page import="java.io.*,java.util.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<%@include file="header.jsp"%>
<html>

<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>All Patient</title>
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
					<li><a href="patientlist.jsp"><i class="fa fa-table fa-fw"></i>Medical
							History</a></li>
					<li><a href="patient.jsp"><i class="fa fa-edit fa-fw"></i>Add
							Patient</a></li>

					<li><a href="patientlist.jsp"><i class="fa fa-flask fa-fw"></i>Patient
							List</a></li>
					<li><a href="medicine.jsp"><i class="fa fa-table fa-fw"></i>Medicine
							List</a></li>
					<li><a href="choosemedicine.jsp"><i
							class="fa fa-table fa-fw"></i>Choose Medicine </a></li>

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
					<h1 class="page-header">Patient Management</h1>
				</div>
				<!--End Page Header -->

			</div>
			<div class="row">
				<%@include file="../connection/connection.jsp"%>

				<div class="col-lg-12">
					<!-- Form Elements -->
					<div class="panel panel-default" style="min-height: 500px">
						<div class="panel-heading">All Patients</div>
						<div class="panel-body">
							<div id="topmsg"></div>
							<div class="row">
								<div class="col-sm-12 hidden-xs "
									style="padding-top: 1em; background-color: #9CF; font-size: 12px;">
									<div class="col-sm-1">ID</div>
									<div class="col-sm-3">Name</div>
									<div class="col-sm-2">DOB</div>
									<div class="col-sm-2">Blood Group</div>
									<div class="col-sm-2">Gender</div>

									<div class="col-sm-2" style="text-align: center;">Action
									</div>
								</div>
								<%
									stmt = con.createStatement();
									String sql;
									sql = "SELECT * FROM patient_details";
									ResultSet rs = stmt.executeQuery(sql);

									while (rs.next()) {
										int id = rs.getInt("id");
										String pname = rs.getString("patient_name");
										String dob = rs.getString("dob");
										String bloodgroup = rs.getString("bloodgroup");
										String gender = rs.getString("gender");
								%>
								<div class="col-sm-1">
									<%
										out.print(id);
									%>
								</div>
								<div class="col-sm-3">
									<%
										out.print(pname);
									%>
								</div>
								<div class="col-sm-2">
									<%
										out.print(dob);
									%>
								</div>
								<div class="col-sm-2">
									<%
										out.print(bloodgroup);
									%>
								</div>
								<div class="col-sm-2">
									<%
										out.print(gender);
									%>
								</div>

								<div class="col-sm-2" style="text-align: center;">
									<a href="viewpatient.jsp?id=<%out.print(id);%>">View</a>
								</div>
								<%
									}
								%>
							</div>
						</div>
					</div>
					<!-- End Form Elements -->
				</div>
			</div>


		</div>
		<!-- end page-wrapper -->

	</div>
	<!-- end wrapper -->

	<!-- Core Scripts - Include with every page -->


</body>

</html>
