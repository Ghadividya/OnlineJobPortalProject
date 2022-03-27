<%@page import="in.co.job.portal.model.UserModel"%>
<%@page import="in.co.job.portal.util.DataUtility"%>
<%@page import="in.co.job.portal.model.JobModel"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="in.co.job.portal.bean.JobBean"%>
<%@page import="in.co.job.portal.controller.ApplayJobListCtl"%>
<%@page import="in.co.job.portal.util.ServletUtility"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Apply Job List</title>
</head>
<body>
<%@ include file="Header.jsp"%>
<main class="login-form">
	<div class="cotainer">
		<div class="row justify-content-center">
			<div class="col-md-12">
				<div class="card">
					<div class="card-header">
					Apply Job List
						
						<h6 style="color: red;"><%=ServletUtility.getErrorMessage(request)%></h6>
						<h6 style="color: green;"><%=ServletUtility.getSuccessMessage(request)%></h6>
						
					</div>

					<div class="card-body">

						<form action="<%=JPView.APPLY_LIST_CTL%>" method="post">
						
						<table class="table">
				<thead>
                    <tr>
                        <th><input type="text" class="form-control" placeholder="User Name" name="name" <%=ServletUtility.getParameter("name", request)%>></th>
                         <th><input style="background-color:#0b889c; color: white;" type="submit" class="form-control" name="operation" value="<%=ApplayJobListCtl.OP_SEARCH%>"></th>
                       
                    </tr>
                </thead>
						
						</table>
						
					 <table class="table">
               
                <thead>
                    <tr>
                    
                      
                        <th><b>S No.</b></th>
                        <th><b>Company Name</b></th>
                        <th><b>Language</b></th>
                        <%if(userBean.getRoleId()==2){ %>
                        <th><b>User Name</b></th>
                        <%} %>
                        <th><b>Description</b></th>
                        <th><b>ContectNo</b></th>
                        <th><b>Apply Date</b></th>
                        <%if(userBean.getRoleId()==2){ %>
                        <th><b>Click To SendMail</b></th>
                        <%} %>
                        <th><b>Resume</b></th>
                        <%if(userBean.getRoleId()==3){ %>
                        <th><b>Action</b></th>
                        <%} %>
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
                       <% JobModel jModel=new JobModel();
                       		JobBean	jBean= jModel.findByPK(bean.getJobId());
                       		UserModel uModel=new UserModel();
                       		UserBean uBean=uModel.findByPK(bean.getUserId());
                       %>
                       <td><%=jBean.getCompanyName()%></td>
                      <td><%=jBean.getLanguage()%></td>
                      <%if(userBean.getRoleId()==2){ %>
                      <td><%=bean.getUserName()%></td>
                      <%} %>
                      <td align="center"><%=jBean.getDescription()%></td>
                      <td align="center"><%=uBean.getMobileNo()%></td>
                      <td align="center"><%=bean.getApplayDate()%></td>
                      <%if(userBean.getRoleId()==2){ %>
                      <td><a class="btn btn-primary" href="https://accounts.google.com/signin/v2/identifier?service=mail&passive=true&rm=false&continue=https%3A%2F%2Fmail.google.com%2Fmail%2F&ss=1&scc=1&ltmpl=default&ltmplcache=2&emr=1&osid=1&flowName=GlifWebSignIn&flowEntry=ServiceLogin">SendMail</a> </td>
                       <%}%>
                        <td><a target="blank" href="/JobPortal/file/<%=bean.getResumeFile()%>"><%=bean.getResumeFile()%></a></td>
                       
                    </tr>
                 
                </tbody>
                  <%
					}
				%>
            </table>
            
            <table class="table">
				<thead>
                    <tr>
                         <th><input style="background-color:#0b889c; color: white;" type="submit" class="form-control"  name="operation"value="<%=ApplayJobListCtl.OP_PREVIOUS%>"
						<%=(pageNo == 1) ? "disabled" : ""%>></th>
                         
						<%
						JobModel model = new JobModel();
					%>
                         <th><input style="background-color:#0b889c; color: white;" type="submit" class="form-control"  name="operation"
						value="<%=ApplayJobListCtl.OP_NEXT%>"
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