<%@page import="in.co.job.portal.controller.ApplayJobCtl"%>
<%@page import="in.co.job.portal.util.DataUtility"%>
<%@page import="in.co.job.portal.util.ServletUtility"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Applay Job</title>



</head>
<body>
<%@ include file="Header.jsp"%>
	<main class="login-form">
	<div class="cotainer">
		<div class="row justify-content-center">
			<div class="col-md-8">
				<div class="card">
					<div class="card-header">
						Apply ForJob
						<h6 style="color: red;"><%=ServletUtility.getErrorMessage(request)%></h6>
						<h6 style="color: green;"><%=ServletUtility.getSuccessMessage(request)%></h6>
					</div>

					<div class="card-body">

						<form action="<%=JPView.Apply_CTL%>" enctype="multipart/form-data" method="post">
						
						

							<jsp:useBean id="bean" class="in.co.job.portal.bean.JobBean"
								scope="request"></jsp:useBean>

							 <input	type="hidden" name="id" value="<%=bean.getId()%>">
							  <input	type="hidden" name="cName" value="<%=bean.getCompanyName()%>">
							   <input	type="hidden" name="language" value="<%=bean.getLanguage()%>">
							    <input	type="hidden" name="pDate" value="<%=DataUtility.getDateString(bean.getPostDate())%>">
							     <input	type="hidden" name="address" value="<%=bean.getAddress()%>">
							      <input	type="hidden" name="description" value="<%=bean.getDescription()%>">
							      <input	type="hidden" name="postById" value="<%=bean.getPostByRecId()%>">  

								
						<br>
							
							<div class="form-group row">
								<label for="email_address" 
									class="col-md-4 col-form-label text-md-right">Company Name:-</label>
								<div class="col-md-6">
									<p><%=DataUtility.getStringData(bean.getCompanyName())%></p>
								</div>
							</div>
							<div class="form-group row">
								<label for="email_address" 
									class="col-md-4 col-form-label text-md-right">Language:-</label>
								<div class="col-md-6">
									<p><%=DataUtility.getStringData(bean.getLanguage())%></p>
								</div>
							</div>
							
							<div class="form-group row">
								<label for="email_address" 
									class="col-md-4 col-form-label text-md-right">Post Date:-</label>
								<div class="col-md-6">
									<p><%=DataUtility.getDateString(bean.getPostDate())%></p>
								</div>
							</div>
							
							<div class="form-group row">
								<label for="email_address" 
									class="col-md-4 col-form-label text-md-right">Company Address:-</label>
								<div class="col-md-6">
									<p><%=DataUtility.getStringData(bean.getAddress())%></p>
								</div>
							</div>
							
							<div class="form-group row">
								<label for="email_address" 
									class="col-md-4 col-form-label text-md-right">Description:-</label>
								<div class="col-md-6">
									<p><%=DataUtility.getStringData(bean.getDescription())%></p>
								</div>
							</div>
				
							<div class="form-group row">
								<label for="email_address" 
									class="col-md-4 col-form-label text-md-right">Resume:-</label>
								<div class="col-md-6">
									<input type="file"  name="file" placeholder="Enter file here..." value="<%=DataUtility.getStringData(bean.getResumeFile())%>">
									<font color="red"><%=ServletUtility.getErrorMessage("file", request)%></font>
								</div>
							</div>
							
							<hr>
							<div class="col-md-6 offset-md-4">
								
								<input type="submit" class="btn btn-primary" name="operation" value="<%=ApplayJobCtl.OP_PROCESS%>">
								
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