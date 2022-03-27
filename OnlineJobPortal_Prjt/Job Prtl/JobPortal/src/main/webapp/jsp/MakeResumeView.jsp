<%@page import="in.co.job.portal.controller.JobCtl"%>
<%@page import="in.co.job.portal.util.DataUtility"%>
<%@page import="in.co.job.portal.util.ServletUtility"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Make Resume</title>
</head>
<body>
<%@ include file="Header.jsp"%>
	<main class="login-form">
	<div class="cotainer">
		<div class="row justify-content-center">
			<div class="col-md-8">
				<div class="card">
					<div class="card-header">
					Application Form
						<h6 style="color: red;"><%=ServletUtility.getErrorMessage(request)%></h6>
						<h6 style="color: green;"><%=ServletUtility.getSuccessMessage(request)%></h6>
					</div>
					<div class="card-body">
						<form action="<%=JPView.MAKE_RESUME_CTL%>" method="post">

							<jsp:useBean id="bean" class="in.co.job.portal.bean.MakeResumeBean"
								scope="request"></jsp:useBean>
							 <input
								type="hidden" name="id" value="<%=bean.getId()%>">
							
							<div class="form-group row">
								<label for="email_address" 
									class="col-md-4 col-form-label text-md-right">Name<font color="red">*</font></label>
								<div class="col-md-6">
									<input type="text" class="form-control" placeholder="Enter Name"
										name="name" value="<%=DataUtility.getStringData(bean.getName())%>" >
										<font  color="red"><%=ServletUtility.getErrorMessage("name", request)%></font>
								</div>
							</div>
							
							<div class="form-group row">
								<label for="email_address" 
									class="col-md-4 col-form-label text-md-right">Email Id<font color="red">*</font></label>
								<div class="col-md-6">
									<input type="text"   class="form-control" placeholder="Enter Email Id"
										name="email" value="<%=DataUtility.getStringData(bean.getEmail())%>" >
										<font  color="red"><%=ServletUtility.getErrorMessage("email", request)%></font>
								</div>
							</div>
					
							<div class="form-group row">
								<label for="email_address" 
									class="col-md-4 col-form-label text-md-right">Mobile No<font color="red">*</font></label>
								<div class="col-md-6">
									<input type="text"   class="form-control" placeholder="Enter Mobile No."
										name="mobileNo" value="<%=DataUtility.getStringData(bean.getMobile())%>" >
										<font  color="red"><%=ServletUtility.getErrorMessage("mobileNo", request)%></font>
								</div>
							</div>
							
							<div class="form-group row">
								<label for="email_address" 
									class="col-md-4 col-form-label text-md-right">Objective<font color="red">*</font></label>
								<div class="col-md-6">
									<textarea  class="form-control" placeholder="Enter Objective.." rows="4" cols="5"
										name="objective" ><%=DataUtility.getStringData(bean.getObjective())%></textarea>
										<font  color="red"><%=ServletUtility.getErrorMessage("objective", request)%></font>
								</div>
							</div>
							
							<div class="form-group row">
							<div class="col-sm">
								<label for="email_address" >Graduation Course Name<font color="red">*</font></label>
									<input type="text"   class="form-control" placeholder="Enter Course Name"
										name="gCourseName" value="<%=DataUtility.getStringData(bean.getgCourceName())%>" >
										<font  color="red"><%=ServletUtility.getErrorMessage("gCourseName", request)%></font>
								</div>
								<div class="col-sm">
								<label for="email_address" 
									>Institute Name<font color="red">*</font></label>
									<input type="text"   class="form-control" placeholder="Enter Institute Name"
										name="gInsName" value="<%=DataUtility.getStringData(bean.getgInsName())%>" >
										<font  color="red"><%=ServletUtility.getErrorMessage("gInsName", request)%></font>
								</div>
								<div class="col-sm">
									<label for="email_address" 
									>Percentage<font color="red">*</font></label>
									<input type="text"   class="form-control" placeholder="Enter Percentage"
										name="gPer" value="<%=DataUtility.getStringData(bean.getgPercentage())%>" >
										<font  color="red"><%=ServletUtility.getErrorMessage("gPer", request)%></font>
								</div>
							</div>
							
							<div class="form-group row">
								<div class="col-sm">
								<label for="email_address" >Higher Secondary Course Name<font color="red">*</font></label>
									<input type="text"   class="form-control" placeholder="Enter Course Name"
										name="hCourseName" value="<%=DataUtility.getStringData(bean.gethCourceName())%>" >
										<font  color="red"><%=ServletUtility.getErrorMessage("hCourseName", request)%></font>
								</div>
								<div class="col-sm">
								<label for="email_address" 
									>Institute Name<font color="red">*</font></label>
									<input type="text"   class="form-control" placeholder="Enter Institute Name"
										name="hInsName" value="<%=DataUtility.getStringData(bean.gethInsName())%>" >
										<font  color="red"><%=ServletUtility.getErrorMessage("hInsName", request)%></font>
								</div>
								<div class="col-sm">
									<label for="email_address" 
									>Percentage<font color="red">*</font></label>
									<input type="text"   class="form-control" placeholder="Enter Percentage"
										name="hPer" value="<%=DataUtility.getStringData(bean.gethPercentage())%>" >
										<font  color="red"><%=ServletUtility.getErrorMessage("hPer", request)%></font>
								</div>
							</div>
							
							<div class="form-group row">
								<div class="col-sm">
								<label for="email_address" >Secondary Course Name<font color="red">*</font></label>
									<input type="text"   class="form-control" placeholder="Enter Course Name"
										name="sCourseName" value="<%=DataUtility.getStringData(bean.getsCourceName())%>" >
										<font  color="red"><%=ServletUtility.getErrorMessage("sCourseName", request)%></font>
								</div>
								<div class="col-sm">
								<label for="email_address" 
									>Institute Name<font color="red">*</font></label>
									<input type="text"   class="form-control" placeholder="Enter Institute Name"
										name="sInsName" value="<%=DataUtility.getStringData(bean.getsInsName())%>" >
										<font  color="red"><%=ServletUtility.getErrorMessage("sInsName", request)%></font>
								</div>
								<div class="col-sm">
									<label for="email_address" 
									>Percentage<font color="red">*</font></label>
									<input type="text"   class="form-control" placeholder="Enter Percentage"
										name="sPer" value="<%=DataUtility.getStringData(bean.getsPercentage())%>" >
										<font  color="red"><%=ServletUtility.getErrorMessage("sPer", request)%></font>
								</div>
							</div>
							<div class="form-group row">
								<label for="email_address" 
									class="col-md-4 col-form-label text-md-right">Skill<font color="red">*</font></label>
								<div class="col-md-6">
									<input type="text" class="form-control" placeholder="Enter Skill"
										name="skill" value="<%=DataUtility.getStringData(bean.getSkill())%>" >
										<font  color="red"><%=ServletUtility.getErrorMessage("skill", request)%></font>
								</div>
							</div>
							<div class="form-group row">
								<label for="email_address" 
									class="col-md-4 col-form-label text-md-right">Hobbies<font color="red">*</font></label>
								<div class="col-md-6">
									<input type="text" class="form-control" placeholder="Enter Hobbies"
										name="hobbies" value="<%=DataUtility.getStringData(bean.getHobbies())%>" >
										<font  color="red"><%=ServletUtility.getErrorMessage("hobbies", request)%></font>
								</div>
							</div>
							<div class="form-group row">
								<label for="email_address" 
									class="col-md-4 col-form-label text-md-right">Personal Detail<font color="red">*</font></label>
								<div class="col-md-6">
									<textarea  class="form-control" placeholder="Enter Personal Detail" rows="4" cols="5"
										name="pDetail" ><%=DataUtility.getStringData(bean.getpDetail())%></textarea>
										<font  color="red"><%=ServletUtility.getErrorMessage("pDetail", request)%></font>
								</div>
							</div>
							<div class="form-group row">
								<label for="email_address" 
									class="col-md-4 col-form-label text-md-right">Declaration<font color="red">*</font></label>
								<div class="col-md-6">
									<textarea  class="form-control" placeholder="Enter Declaration.." rows="4" cols="5"
										name="declaration" ><%=DataUtility.getStringData(bean.getDeclaration())%></textarea>
										<font  color="red"><%=ServletUtility.getErrorMessage("declaration", request)%></font>
								</div>
							</div>
							<div class="form-group row">
								<label for="email_address" 
									class="col-md-4 col-form-label text-md-right">Date<font color="red">*</font></label>
								<div class="col-md-6">
									<input type="text" id="email_address"  class="form-control" placeholder="Enter Date"
										name="date" value="<%=DataUtility.getDateString(bean.getDate())%>" >
										<font  color="red"><%=ServletUtility.getErrorMessage("date", request)%></font>
								</div>
							</div>
							<div class="form-group row">
								<label for="email_address" 
									class="col-md-4 col-form-label text-md-right">Place<font color="red">*</font></label>
								<div class="col-md-6">
									<input type="text"   class="form-control" placeholder="Enter Place Here..."
										name="place" value="<%=DataUtility.getStringData(bean.getPlace())%>" >
										<font  color="red"><%=ServletUtility.getErrorMessage("place", request)%></font>
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