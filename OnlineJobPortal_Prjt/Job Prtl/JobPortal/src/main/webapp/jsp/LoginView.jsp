<%@page import="in.co.job.portal.util.DataUtility"%>
<%@page import="in.co.job.portal.util.ServletUtility"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Login</title>
</head>
<body>
	<%@ include file="Header.jsp"%>
	<main class="login-form">
	<div class="cotainer">
		<div class="row justify-content-center">
			<div class="col-md-8">
				<div class="card">
					<div class="card-header">
						Login 
						<h6 style="color: red;"><%=ServletUtility.getErrorMessage(request)%></h6>
						<h6 style="color: green;"><%=ServletUtility.getSuccessMessage(request)%></h6>
					</div>

					<div class="card-body">

						<form action="<%=JPView.LOGIN_CTL%>" method="post">

							<jsp:useBean id="bean" class="in.co.job.portal.bean.UserBean"
								scope="request"></jsp:useBean>

							<%
								String uri = (String) request.getAttribute("uri");
							%>
							<input type="hidden" name="uri" value="<%=uri%>"> <input
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
									class="col-md-4 col-form-label text-md-right">Login Id<font color="red">*</font></label>
								<div class="col-md-6">
									<input type="text" id="email_address"  class="form-control" placeholder="Enter Login Id"
										name="login" value="<%=DataUtility.getStringData(bean.getLogin())%>" >
										<font  color="red"><%=ServletUtility.getErrorMessage("login", request)%></font>
								</div>
							</div>

							<div class="form-group row">
								<label for="password"
									class="col-md-4 col-form-label text-md-right">Password<font color="red">*</font></label>
								<div class="col-md-6">
									<input type="password" id="password" class="form-control" placeholder="Enter Password"
										name="password" value="<%=DataUtility.getStringData(bean.getPassword()) %>" >
										<font color="red"> <%=ServletUtility.getErrorMessage("password", request)%></font>
								</div>
							</div>



							<div class="col-md-6 offset-md-4">
								<input type="submit" class="btn btn-primary" name="operation" value="<%=LoginCtl.OP_SIGN_IN %>">
								<a href="<%=JPView.FORGET_PASSWORD_CTL%>" class="btn btn-link"> Forgot Your Password? </a>
							</div>
						</form>
					</div>

				</div>
			</div>
		</div>
	</div>
	</main>
	<div style="margin-top: 170px">
		<%@ include file="Footer.jsp"%>
	</div>
</body>
</html>