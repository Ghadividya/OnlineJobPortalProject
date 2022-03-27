<%@page import="in.co.job.portal.model.UserModel"%>
<%@page import="in.co.job.portal.util.DataUtility"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="in.co.job.portal.bean.UserBean"%>
<%@page import="in.co.job.portal.controller.UserListCtl"%>
<%@page import="in.co.job.portal.util.ServletUtility"%>
<%@page import="in.co.job.portal.controller.JPView"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>User List</title>

<script language="javascript">
	$(function() {
		$("#selectall").click(function() {
			$('.case').attr('checked', this.checked);
		});
		$(".case").click(function() {

			if ($(".case").length == $(".case:checked").length) {
				$("#selectall").attr("checked", "checked");
			} else {
				$("#selectall").removeAttr("checked");
			}

		});
	});
</script>
</head>
<body>
<%@ include file="Header.jsp"%>
<main class="login-form">
	<div class="cotainer">
		<div class="row justify-content-center">
			<div class="col-md-12">
				<div class="card">
					<div class="card-header">
						Recruiter List
						
						<h6 style="color: red;"><%=ServletUtility.getErrorMessage(request)%></h6>
						<h6 style="color: green;"><%=ServletUtility.getSuccessMessage(request)%></h6>
						
					</div>

					<div class="card-body">

						<form action="<%=JPView.RECRUITER_LIST_CTL%>" method="post">
						
						<table class="table">
				<thead>
                    <tr>
                        <th><input type="text" class="form-control" placeholder="First Name" name="firstName" <%=ServletUtility.getParameter("firstName", request)%>></th>
                         <th><input style="background-color:#0b889c; color: white;" type="submit" class="form-control" name="operation" value="<%=UserListCtl.OP_SEARCH%>"></th>
                       
                    </tr>
                </thead>
						
						</table>
						
					 <table class="table">
               
                <thead>
                    <tr>
                        
                        <th><b>S No.</b></th>
                        <th><b>First Name</b></th>
                        <th><b>Last Name</b></th>
                        <th><b>Login Id</b></th>
                         <th><b>Mobile No</b></th>
                          <th><b>Gender</b></th>
                           <th><b>Date Of Birth</b></th>
                            <th><b>Edit</b></th>
                    </tr>
                </thead>
                
                <%
					int pageNo = ServletUtility.getPageNo(request);
					int pageSize = ServletUtility.getPageSize(request);
					int index = ((pageNo - 1) * pageSize) + 1;
					
					
					UserBean bean = null;
					
					List list = ServletUtility.getList(request);
					
					Iterator<UserBean> it = list.iterator();
					
					while (it.hasNext()) {
						bean = it.next();
				%>
                <tbody>
                    <tr>
                       
                       <td align="center"><%=index++%></td>
                       <td><%=bean.getFirstName()%></td>
                      <td><%=bean.getLastName()%></td>
                       <td><%=bean.getLogin()%></td>
                         <td align="center"><%=bean.getMobileNo()%></td>
                         <td align="center"><%=bean.getGender()%></td>
                         <td align="center"><%=DataUtility.getDateString(bean.getDob())%></td>
                          <td><a class="form-control" href="UserCtl?id=<%=bean.getId()%>">Edit</a>
                           <a href="RecruiterListCtl?ids=<%=bean.getId()%>"  class="btn btn-danger" >DELETE</a> </td>
                        
                    </tr>
                 
                </tbody>
                  <%
					}
				%>
            </table>
            
            <table class="table">
				<thead>
                    <tr>
                         <th><input style="background-color:#0b889c; color: white;" type="submit" class="form-control"  name="operation"value="<%=UserListCtl.OP_PREVIOUS%>"
						<%=(pageNo == 1) ? "disabled" : ""%>></th>
                        
						<%
						UserModel model = new UserModel();
					%>
                         <th><input style="background-color:#0b889c; color: white;" type="submit" class="form-control"  name="operation"
						value="<%=UserListCtl.OP_NEXT%>"
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