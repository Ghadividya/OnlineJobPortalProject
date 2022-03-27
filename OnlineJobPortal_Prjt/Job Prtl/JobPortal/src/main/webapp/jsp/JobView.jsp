<%@page import="in.co.job.portal.controller.JobCtl"%>
<%@page import="in.co.job.portal.util.DataUtility"%>
<%@page import="in.co.job.portal.util.ServletUtility"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Job</title>
</head>
<body>
<%@ include file="Header.jsp"%>
	<main class="login-form">
	<div class="cotainer">
		<div class="row justify-content-center">
			<div class="col-md-8">
				<div class="card">
					<div class="card-header">
						Add Job
						<h6 style="color: red;"><%=ServletUtility.getErrorMessage(request)%></h6>
						<h6 style="color: green;"><%=ServletUtility.getSuccessMessage(request)%></h6>
					</div>

					<div class="card-body">

						<form action="<%=JPView.JOB_CTL%>" method="post">
						
						

							<jsp:useBean id="bean" class="in.co.job.portal.bean.JobBean"
								scope="request"></jsp:useBean>
							 <input
								type="hidden" name="id" value="<%=bean.getId()%>"> <input
								type="hidden" name="createdBy" value="<%=bean.getCreatedBy()%>">
							<input type="hidden" name="modifiedBy"
								value="<%=bean.getModifiedBy()%>"> <input type="hidden"
								name="createdDatetime"
								value="<%=DataUtility.getTimestamp(bean.getCreatedDatetime())%>">
							<input type="hidden" name="modifiedDatetime"
								value="<%=DataUtility.getTimestamp(bean.getModifiedDatetime())%>">

							<div class="form-group row">
								<label for="email_address" 
									class="col-md-4 col-form-label text-md-right">Company Name<font color="red">*</font></label>
								<div class="col-md-6">
									<input type="text" class="form-control" placeholder="Enter Company Name"
										name="cName" value="<%=DataUtility.getStringData(bean.getCompanyName())%>" >
										<font  color="red"><%=ServletUtility.getErrorMessage("cName", request)%></font>
								</div>
							</div>
							
							<div class="form-group row">
								<label for="email_address" 
									class="col-md-4 col-form-label text-md-right">Language<font color="red">*</font></label>
								<div class="col-md-6">
									<input type="text"   class="form-control" placeholder="Enter Language"
										name="language" value="<%=DataUtility.getStringData(bean.getLanguage())%>" >
										<font  color="red"><%=ServletUtility.getErrorMessage("language", request)%></font>
								</div>
							</div>

														
							<div class="form-group row">
								<label for="email_address" 
									class="col-md-4 col-form-label text-md-right">Date<font color="red">*</font></label>
								<div class="col-md-6">
									<input type="text" id="email_address"  class="form-control" placeholder="Enter Date"
										name="pDate" value="<%=DataUtility.getDateString(bean.getPostDate())%>" >
										<font  color="red"><%=ServletUtility.getErrorMessage("pDate", request)%></font>
								</div>
							</div>
							
							<div class="form-group row">
								<label for="email_address" 
									class="col-md-4 col-form-label text-md-right">Address<font color="red">*</font></label>
								<div class="col-md-6">
									<input type="text" id="email_address"  class="form-control" placeholder="Enter Address"
										name="address" value="<%=DataUtility.getStringData(bean.getAddress())%>" >
										<font  color="red"><%=ServletUtility.getErrorMessage("address", request)%></font>
								</div>
							</div>
							
							<div class="form-group row">
								<label for="email_address" 
									class="col-md-4 col-form-label text-md-right">Description<font color="red">*</font></label>
								<div class="col-md-6">
									<textarea rows="4" cols="50" class="form-control" name="description" placeholder="Enter Job Description">
										<%=DataUtility.getStringData(bean.getDescription())%>
										</textarea>
										<font  color="red"><%=ServletUtility.getErrorMessage("description", request)%></font>
								</div>
							</div>

							<div class="col-md-6 offset-md-4">
								<input type="submit" class="btn btn-primary" name="operation" value="<%=JobCtl.OP_SAVE%>">
								
							</div>
						</form>
					</div>

				</div>
			</div>
		</div>
	</div>
	</main>
	<div style="margin-top: 120px">
		<%@ include file="Footer.jsp"%>
	</div>
</body>
</html>