<%@ page import="java.io.*,java.util.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<%@include file="header.jsp"%>
<html>

<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Patient Details</title>
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
<script src="../assets/scripts/patientdetails.js"></script>

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



			<!-- Modal -->
			<div id="reaction" class="modal fade" role="dialog">
				<div class="modal-dialog">

					<!-- Modal content-->
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal">&times;</button>
							<h4 class="modal-title">Medicine Reaction Report</h4>
						</div>
						<div id="rbody" class="modal-body"></div>
						<div class="modal-footer">
							<button type="button" class="btn btn-default"
								data-dismiss="modal">Close</button>
						</div>
					</div>

				</div>
			</div>


			<div class="row">
				<!-- Page Header -->
				<div class="col-lg-12">
					<h1 class="page-header">Patient Medical History</h1>
				</div>
				<!--End Page Header -->

			</div>
			<div class="row">
				<%@include file="../connection/connection.jsp"%>

				<div class="col-lg-12">
					<!-- Form Elements -->
					<div class="panel panel-default" style="min-height: 500px">
						<div class="panel-heading">Patient's Medical History</div>
						<div class="panel-body">
							<div id="topmsg"></div>
							<div class="row">
								<%
									stmt = con.createStatement();
									String sql;
									if (request.getParameter("id") != null) {
										sql = "SELECT * FROM patient_details where id=" + request.getParameter("id");
										ResultSet rs = stmt.executeQuery(sql);
										if (rs.next()) {
											int id = rs.getInt("id");
											String pname = rs.getString("patient_name");
											String dob = rs.getString("dob");
											String bloodgroup = rs.getString("bloodgroup");
											String gender = rs.getString("gender");
								%>
								<Div class="col-sm-12">
									Patient ID:
									<%
									out.print(id);
								%>
									<br>Patient Name:<%
										out.print(pname);
									%>
									<br>Date of Birth:<%
										out.print(dob);
									%>
									<br>Blood Group:<%
										out.print(bloodgroup);
									%>
									<br>Gender:<%
										out.print(gender);
									%>
								</DIV>
								<Div class="col-sm-12">
									<button id="addnew" class="btn btn-primary">Add New
										Record</button>
								</Div>
								<Div class="col-sm-12">
									<div id="midmsg"></div>
									<%
										if (session.getAttribute("msg") == null) {
												} else {
									%>

									<div class='alert alert-success fade in'>
										<a href='#' class='close' data-dismiss='alert'
											aria-label='close'>&times;</a>
										<%
											out.print(session.getAttribute("msg"));
										%>
									</div>
									<%
										session.removeAttribute("msg");
												}
									%>

								</Div>
								<Div class="col-sm-12">
									<form role="form" style="display: none" id="medform"
										name="medform" onSubmit="return false" method="post">
										<div class="col-lg-6 col-sm-6">
											<input type="hidden" id="patientid" name="patientid"
												value="<%out.print(id);%>">
											<div class="form-group">
												<label>Date : </label> <input id="visit_date"
													name="visit_date" class="form-control">
											</div>
											<div class="form-group">
												<label>Severity</label> <select id="severity"
													name="severity" class="form-control">
													<option value="Very Critical">Very Critical</option>
													<option value="Critical">Critical</option>
													<option value="Moderate">Moderate</option>
													<option value="Low">Low</option>
													<option value="Very Low">Very Low</option>
												</select>
											</div>
											<%
												sql = "SELECT * FROM Medicine";
														ResultSet rs2 = stmt.executeQuery(sql);
											%>
											<div class="form-group">
												<label>Select Medicine</label> <select id="medicinename"
													name="medicinename" class="form-control">
													<%
														while (rs2.next()) {
																	int medid = rs2.getInt("id");
																	String medname = rs2.getString("medicinename");
													%>
													<option value="<%out.print(medname);%>">
														<%
															out.print(medname);
														%>
													</option>
													<%
														}
													%>
												</select>
											</div>
										</div>
										<div class="col-lg-6 col-sm-6">

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
											<button id="canceladd" class="btn btn-warning">Cancel</button>
									</form>
								</div>
								<Div class="col-sm-12" style="margin-top: 10px;">
									<%
										sql = "SELECT * FROM medical_history where patientid=" + request.getParameter("id");
												ResultSet rs3 = stmt.executeQuery(sql);
									%>
									<div class="col-sm-12 hidden-xs "
										style="padding-top: 1em; background-color: #9CF; font-size: 12px;">
										<div class="col-sm-2">Date</div>
										<div class="col-sm-2">Disease</div>
										<div class="col-sm-2">Severity</div>
										<div class="col-sm-3">Medicine</div>
										<div class="col-sm-3">Hospital</div>

									</div>

									<%
										while (rs3.next()) {
													int medid = rs3.getInt("id");
													String medname = rs3.getString("medicinename");
													String visit_date = rs3.getString("visit_date");
													String disease = rs3.getString("disease");
													String severity = rs3.getString("severity");
													String hospital = rs3.getString("hospital");
									%>
									<div class="col-sm-2">
										<%
											out.print(visit_date);
										%>
									</div>
									<div class="col-sm-2">
										<%
											out.print(disease);
										%>
									</div>
									<div class="col-sm-2">
										<%
											out.print(severity);
										%>
									</div>
									<div class="col-sm-3">
										<%
											out.print(medname);
										%>
									</div>
									<div class="col-sm-3">
										<%
											out.print(hospital);
										%>
									</div>

									<%
										}
									%>
								</Div>

								<%
									} else {
								%>
								<Div class="col-sm-12">
									<H2>Patient Id is invalid</H2>
								</Div>
								<%
									}
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
