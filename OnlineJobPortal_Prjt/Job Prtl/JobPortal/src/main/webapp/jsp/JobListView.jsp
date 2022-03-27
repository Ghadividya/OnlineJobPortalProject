<%@page import="in.co.job.portal.model.JobModel"%>
<%@page import="in.co.job.portal.util.DataUtility"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="in.co.job.portal.bean.JobBean"%>
<%@page import="in.co.job.portal.controller.JobListCtl"%>
<%@page import="in.co.job.portal.util.ServletUtility"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Job List</title>



<!-- <style type="text/css">
body {
	font-family: Arial, Helvetica, sans-serif;
}

/* Full-width input fields */

/* Set a style for all buttons */
button {
	background-color: #4CAF50;
	color: white;
	padding: 14px 20px;
	margin: 8px 0;
	border: none;
	cursor: pointer;
	width: 20%;
}

button:hover {
	opacity: 0.8;
}

/* Extra styles for the cancel button */
.container {
	padding: 16px;
}

span.psw {
	float: right;
	padding-top: 16px;
}

/* The Modal (background) */
.modal {
	display: none; /* Hidden by default */
	position: fixed; /* Stay in place */
	z-index: 1; /* Sit on top */
	left: 0;
	top: 0;
	width: 100%; /* Full width */
	height: 100%; /* Full height */
	overflow: auto; /* Enable scroll if needed */
	background-color: rgb(0, 0, 0); /* Fallback color */
	background-color: rgba(0, 0, 0, 0.4); /* Black w/ opacity */
	padding-top: 60px;
}

/* Modal Content/Box */
.modal-content {
	background-color: #fefefe;
	margin: 5% auto 15% auto;
	/* 5% from the top, 15% from the bottom and centered */
	border: 1px solid #888;
	width: 80%; /* Could be more or less, depending on screen size */
}

/* Add Zoom Animation */
.animate {
	-webkit-animation: animatezoom 0.6s;
	animation: animatezoom 0.6s
}

@
-webkit-keyframes animatezoom {
	from {-webkit-transform: scale(0)
}

to {
	-webkit-transform: scale(1)
}

}
@
keyframes animatezoom {
	from {transform: scale(0)
}

to {
	transform: scale(1)
}

}

/* Change styles for span and cancel button on extra small screens */
@media screen and (max-width: 300px) {
	span.psw {
		display: block;
		float: none;
	}
	.cancelbtn {
		width: 100%;
	}
}
</style> -->

<!-- <script>	
	function NewFunction() {
			var rIId=document.getElementsByName("rid");
			var mUrl=document.getElementById("mUrl").value;
			//alert(mUrl);
			var aUrl=document.getElementById("aUrl").value;
			//alert(aUrl);
			var r1=document.getElementById("r1").checked;
			alert(r1);
			
				 	if(r1==true) {
	        			location.href =mUrl;
	                }else{
        				location.href =aUrl;
        			}
	         
	}
</script> -->
</head>
<body>
	<%@ include file="Header.jsp"%>
	<main class="login-form">

<div class="cotainer">

							<!-- <div id="id01" class="modal">
								
								<div class="modal-content animate">
									<div class="container">
										<br>
										<h3>Do you want to continue with your resume or want to
											fill manually</h3>
										<br> <br>
										<label><input type="radio" name="rid" id="r1" value="Continue without resume"/>&nbsp;&nbsp;&nbsp;Continue
										without resume <br> <br> </label>
										<label><input type="radio"  name="rid" id="r1"  value="Continue with resume"/>&nbsp;&nbsp;&nbsp;Continue
										with resume <br> <br></label>
										<input class="form-control" onclick="NewFunction()"  type="button" value="Submit">

									</div>
								</div>
								
							</div>
							
						</div> -->
	<div class="row justify-content-center">
		<div class="col-md-12">
			<div class="card">
				<div class="card-header">
					Job List

					<h6 style="color: red;"><%=ServletUtility.getErrorMessage(request)%></h6>
					<h6 style="color: green;"><%=ServletUtility.getSuccessMessage(request)%></h6>

				</div>

				<div class="card-body">

					<form action="<%=JPView.JOB_LIST_CTL%>" method="post">

						<table class="table">
							<thead>
								<tr>
									<th><input type="text" class="form-control"
										placeholder="Company Name" name="cName"
										<%=ServletUtility.getParameter("cName", request)%>></th>
									<th><input type="text" class="form-control"
										placeholder="Language" name="language"
										<%=ServletUtility.getParameter("language", request)%>></th>
									<th><input
										style="background-color: #0b889c; color: white;" type="submit"
										class="form-control" name="operation"
										value="<%=JobListCtl.OP_SEARCH%>"></th>

								</tr>
							</thead>

						</table>

						
							
						
						<table class="table">

							<thead>
								<tr>


									<th><b>S No.</b></th>
									<th><b>Company Name</b></th>
									<th><b>Language</b></th>
									<th><b>Post Date</b></th>
									<th><b>Post By</b></th>
									<th><b>Description</b></th>
									<th><b>Address</b></th>
									<%
										UserBean uBean = (UserBean) session.getAttribute("user");
										if (uBean.getRoleId() == 2) {
									%>
									<th><b>Edit</b></th>
									<%
										} else {
									%>
									<th><b>Action</b></th>
									<%
										}
									%>
								</tr>
							</thead>

							<%
								int pageNo = ServletUtility.getPageNo(request);
								int pageSize = ServletUtility.getPageSize(request);
								int index = ((pageNo - 1) * pageSize) + 1;

								JobBean bean = null;

								List list = ServletUtility.getList(request);

								Iterator<JobBean> it = list.iterator();

								while (it.hasNext()) {
									bean = it.next();
							%>
							
							<tbody>
								<tr>

									<td align="center"><%=index++%></td>
									<td><%=bean.getCompanyName()%></td>
									<td><%=bean.getLanguage()%></td>
									<td align="center"><%=DataUtility.getDateString(bean.getPostDate())%></td>
									<td><%=bean.getPostByRecId()%></td>
									<td align="center"><%=bean.getDescription()%></td>
									<td align="center"><%=bean.getAddress()%></td>
									
									<%
										if (uBean.getRoleId() == 2) {
									%>
									<td><a class="form-control"
										href="JobCtl?id=<%=bean.getId()%>">Edit</a> <a
										href="JobListCtl?ids=<%=bean.getId()%>" class="btn btn-danger">DELETE</a></td>
										
									<%
										} else {
									%>
									<%-- <input type="hidden" id="mUrl" value="/JobPortal/ctl/MakeResumeCtl?jId=<%=bean.getId()%>">
										<input type="hidden" id="aUrl" value="/JobPortal/ctl/ApplayJobCtl?jId=<%=bean.getId()%>"> --%>
									<td><!-- <a class="btn btn-primary"
										onclick="document.getElementById('id01').style.display='block'"
										href="#">Apply</a> -->
										<a class="btn btn-primary" style="margin-bottom: 5px;" href="/JobPortal/ctl/ApplayJobCtl?id=<%=bean.getId()%>">Apply With Resume</a>
										&nbsp;&nbsp;
										<a class="btn btn-primary" href="/JobPortal/ctl/MakeResumeCtl?jId=<%=bean.getId()%>">Apply Without Resume</a>
										</td>
									<%
										}
									%>
								</tr>

							</tbody>
							<%
								}
							%>
						</table>

						<table class="table">
							<thead>
								<tr>
									<th><input
										style="background-color: #0b889c; color: white;" type="submit"
										class="form-control" name="operation"
										value="<%=JobListCtl.OP_PREVIOUS%>"
										<%=(pageNo == 1) ? "disabled" : ""%>></th>
									<%
										if (uBean.getRoleId() == 2) {
									%>
									<th><input
										style="background-color: #0b889c; color: white;" type="submit"
										class="form-control" name="operation"
										value="<%=JobListCtl.OP_DELETE%>"
										<%=(list.size() == 0) ? "disabled" : ""%>></th>
									<%
										}
									%>
									<%
										JobModel model = new JobModel();
									%>
									<th><input
										style="background-color: #0b889c; color: white;" type="submit"
										class="form-control" name="operation"
										value="<%=JobListCtl.OP_NEXT%>"
										<%=((list.size() < pageSize) || model.nextPK() - 1 == bean.getId()) ? "disabled" : ""%>></th>
								</tr>
							</thead>

						</table>
						<input type="hidden" name="pageNo" value="<%=pageNo%>"> <input
							type="hidden" name="pageSize" value="<%=pageSize%>">

					</form>
				</div>

			</div>
		</div>
	</div>
	</div>
	</main>



	<%@ include file="Footer.jsp"%>
</body>
</html>