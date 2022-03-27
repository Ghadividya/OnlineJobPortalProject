<%@page import="in.co.job.portal.controller.SendMailCtl"%>
<%@page import="in.co.job.portal.util.DataUtility"%>
<%@page import="in.co.job.portal.util.ServletUtility"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Send Mail</title>
</head>
<body>
<%@ include file="Header.jsp"%>
	<main class="login-form">
	<div class="cotainer">
		<div class="row justify-content-center">
			<div class="col-md-8">
				<div class="card">
					<div class="card-header">
						Job Information And Mail
						<h6 style="color: red;"><%=ServletUtility.getErrorMessage(request)%></h6>
						<h6 style="color: green;"><%=ServletUtility.getSuccessMessage(request)%></h6>
					</div>

					<div class="card-body">

						<form action="<%=JPView.SEND_MAIL_CTL%>" method="post">
						
						

							<jsp:useBean id="bean" class="in.co.job.portal.bean.SendMailBean"
								scope="request"></jsp:useBean>

							 <input	type="hidden" name="id" value="<%=bean.getId()%>">
							   

							<div class="form-group row">
								<label for="email_address" 
									class="col-md-4 col-form-label text-md-right">Description<font color="red">*</font></label>
								<div class="col-md-6">
									<textarea rows="4" cols="50" class="form-control" name="description" placeholder="Enter Job Description">
										
										</textarea>
										<font  color="red"><%=ServletUtility.getErrorMessage("description", request)%></font>
								</div>
							</div>
							
							

						
							
							<div class="col-md-6 offset-md-4">
								<input type="submit" class="btn btn-primary" name="operation" value="<%=SendMailCtl.OP_SENDMAIL%>">
								
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