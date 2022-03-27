<%@page import="in.co.job.portal.controller.ChangePasswordCtl"%>
<%@page import="in.co.job.portal.util.DataUtility"%>
<%@page import="in.co.job.portal.util.ServletUtility"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Change Password</title>
</head>
<body>
<%@ include file="Header.jsp"%>
	<main class="login-form">
	<div class="cotainer">
		<div class="row justify-content-center">
			<div class="col-md-8">
				<div class="card">
					<div class="card-header">
						Change Password
						<h6 style="color: red;"><%=ServletUtility.getErrorMessage(request)%></h6>
						<h6 style="color: green;"><%=ServletUtility.getSuccessMessage(request)%></h6>
					</div>

					<div class="card-body">

						<form action="<%=JPView.CHANGE_PASSWORD_CTL%>" method="post">
						
						

							<jsp:useBean id="bean" class="in.co.job.portal.bean.UserBean"
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
								<label for="password"
									class="col-md-4 col-form-label text-md-right">Old Password<font color="red">*</font></label>
								<div class="col-md-6">
									<input type="password" id="password" class="form-control" placeholder="Enter Old Password"
										name="oldPassword" value=<%=DataUtility
                    .getString(request.getParameter("oldPassword") == null ? ""
                            : DataUtility.getString(request
                                    .getParameter("oldPassword")))%> >
										<font color="red"> <%=ServletUtility.getErrorMessage("oldPassword", request)%></font>
								</div>
							</div>
							

							<div class="form-group row">
								<label for="password"
									class="col-md-4 col-form-label text-md-right">New Password<font color="red">*</font></label>
								<div class="col-md-6">
									<input type="password" id="password" class="form-control" placeholder="Enter New Password"
										name="newPassword"value=<%=DataUtility.getString(request.getParameter("newPassword") == null ? ""
                            : DataUtility.getString(request.getParameter("newPassword")))%>>
										<font color="red"> <%=ServletUtility.getErrorMessage("newPassword", request)%></font>
								</div>
							</div>
							
							<div class="form-group row">
								<label for="password"
									class="col-md-4 col-form-label text-md-right">Confirm Password<font color="red">*</font></label>
								<div class="col-md-6">
									<input type="password" id="password" class="form-control" placeholder="Enter Confirm Password"
										name="confirmPassword" value=<%=DataUtility.getString(request
                    .getParameter("confirmPassword") == null ? "" : DataUtility
                    .getString(request.getParameter("confirmPassword")))%> >
										<font color="red"> <%=ServletUtility.getErrorMessage("confirmPassword", request)%></font>
								</div>
							</div>
							
							

							<div class="col-md-6 offset-md-4">
								<input type="submit" class="btn btn-primary" name="operation" value="<%=ChangePasswordCtl.OP_SAVE%>">
								
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