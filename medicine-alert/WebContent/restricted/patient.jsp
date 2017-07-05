<%@ page import="java.io.*,java.util.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<%@include file="header.jsp"%>
<html>

<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Add New Patient</title>
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
					<h1 class="page-header">Add New Patient</h1>
				</div>
				<!--End Page Header -->

			</div>
			<div class="row">
				<%@include file="../connection/connection.jsp"%>

				<div class="col-lg-12">
					<!-- Form Elements -->
					<div class="panel panel-default" style="min-height: 500px">
						<div class="panel-heading">Fill Patient Information</div>
						<div class="panel-body">
							<div id="topmsg"></div>
							<div class="row">
								<form role="form" id="patientform" name="patientform"
									onSubmit="return false" method="post">
									<div class="col-lg-6 col-sm-6">

										<div class="form-group">
											<label>Name : </label> <input id="patientname"
												name="patientname" class="form-control">
										</div>

										<div class="form-group">
											<label>Gender</label> <label class="radio-inline"> <input
												type="radio" name="gender" id="optMale" value="male" checked>Male
											</label> <label class="radio-inline"> <input type="radio"
												name="gender" id="OptFemale" value="Female">Female
											</label>
										</div>
										<div class="form-group">
											<label>Text area</label>
											<textarea id="address" name="address" class="form-control"
												rows="5"></textarea>
										</div>
									</div>
									<div class="col-lg-6 col-sm-6">

										<div class="form-group">
											<label>Date of Birth : </label> <input id="dateofbirth"
												name="dateofbirth" class="form-control">
										</div>

										<div class="form-group">
											<label>Blood Group</label> <select id="bloodgroup"
												name="bloodgroup" class="form-control">
												<option value="O-">O-</option>
												<option value="O+">O+</option>
												<option value="A+">A+</option>
												<option value="A-">A-</option>
												<option value="B-">B-</option>
												<option value="B+">B+</option>
												<option value="AB+">AB+</option>
												<option value="AB-">AB-</option>

											</select>
										</div>
										<div class="form-group">
											<label>Disease</label> <select id="disease" name="disease"
												class="form-control">
												<option value="Common Cold">Common Cold</option>
												<option value="Anemia">Anemia</option>
												<option value="Hepatitis B">Hepatitis B</option>
												<option value="Periodontal Disease">Periodontal
													Disease</option>
												<option value="Lung Cancer">Lung Cancer</option>
												<option value="Diarrhea">Diarrhea</option>
												<option value="Strep Throat">Strep Throat</option>
												<option value="Sexually Transmitted Diseases">Sexually
													Transmitted Diseases</option>
												<option value="Heart Disease">Heart Disease</option>
												<option value="Type 2 Diabetes">Type 2 Diabetes</option>
											</select>
										</div>
										<div class="form-group">
											<label>Select Hopital</label> <select id="hospitalname"
												name="hospitalname" class="form-control">
												<option value="Hospital 1">Hospital 1</option>
												<option value="Hospital 2">Hospital 2</option>
												<option value="Hospital 3">Hospital 3</option>
												<option value="Hospital 4">Hospital 4</option>
												<option value="Hospital 5">Hospital 5</option>
											</select>
										</div>
									</div>
									<div class="col-lg-12 col-sm-12">
										<button type="submit" class="btn btn-primary">Save</button>
										<button type="reset" class="btn btn-success">Reset</button>
								</form>
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
