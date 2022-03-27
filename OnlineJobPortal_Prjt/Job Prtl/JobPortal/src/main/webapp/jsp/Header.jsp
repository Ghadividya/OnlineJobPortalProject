<%@page import="in.co.job.portal.controller.LoginCtl"%>
<%@page import="in.co.job.portal.controller.JPView"%>
<%@page import="in.co.job.portal.bean.UserBean"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <link href="https://mdbootstrap.com/previews/docs/latest/css/bootstrap.min.css" rel="stylesheet">
    
    <link rel="stylesheet" href="/JobPortal/css/style.css">

<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
 <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <link rel="stylesheet" href="/resources/demos/style.css">
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<style type="text/css">
    .whov:hover { background-color: #00695c!important; }
.view {
    background-position: center center;
    background-repeat: no-repeat;
    height: 500px;
}
.secondbase {
    background-color: rgba(255,255,255,.6); 
    margin-top: -90px;
}
.filterable {
    margin-top: 15px;
}
.filterable .panel-heading .pull-right {
    margin-top: -20px;
}
.filterable .filters input[disabled] {
    background-color: transparent;
    border: none;
    cursor: auto;
    box-shadow: none;
    padding: 0;
    height: auto;
}
.filterable .filters input[disabled]::-webkit-input-placeholder {
    color: #333;
}
.filterable .filters input[disabled]::-moz-placeholder {
    color: #333;
}
.filterable .filters input[disabled]:-ms-input-placeholder {
    color: #333;
}

</style>
</head>
<body>
<header>
<%
    UserBean userBean = (UserBean) session.getAttribute("user");

    boolean userLoggedIn = userBean != null;

    String welcomeMsg = "Hi, ";

    if (userLoggedIn) {
        String role = (String) session.getAttribute("role");
        welcomeMsg += userBean.getFirstName() + " (" + role + ")";
    } else {
        welcomeMsg += "Guest";
    }

%>
    <nav class="navbar navbar-expand-lg navbar-dark default-color-dark fixed-top">
        <a class="navbar-brand" href="<%=JPView.WELCOME_CTL%>">JOBPortal</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
            aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
        <div class="collapse navbar-collapse " id="navbarSupportedContent">
            <ul class="navbar-nav mr-auto">
              <%
        if (userLoggedIn) {
   			 %>
   			 
   			 <%if(userBean.getRoleId()==1){ %>
                <li class="nav-item active">
                    <a class="nav-link" href="<%=JPView.WELCOME_CTL%>">Home<span class="sr-only">(current)</span></a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="<%=JPView.USER_CTL%>">Add Recruiter</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="<%=JPView.RECRUITER_LIST_CTL%>">Recruiter List</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="<%=JPView.USER_LIST_CTL%>">User List</a>
                </li>
                 <li class="nav-item">
                    <a class="nav-link" href="<%=JPView.MY_PROFILE_CTL%>">My Profile</a>
                </li>
                 <li class="nav-item">
                    <a class="nav-link" href="<%=JPView.CHANGE_PASSWORD_CTL%>">Change Password</a>
                </li>
                <%} 
                	if(userBean.getRoleId()==2){
                %>
                <li class="nav-item active">
                    <a class="nav-link" href="<%=JPView.WELCOME_CTL%>">Home<span class="sr-only">(current)</span></a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="<%=JPView.JOB_CTL%>">Add Job</a>
                </li>
                 <li class="nav-item">
                    <a class="nav-link" href="<%=JPView.JOB_LIST_CTL%>">Job List</a>
                </li>
                 <li class="nav-item">
                    <a class="nav-link" href="<%=JPView.APPLY_LIST_CTL%>">Apply Job List</a>
                </li>
                 <li class="nav-item">
                    <a class="nav-link" href="<%=JPView.MY_PROFILE_CTL%>">My Profile</a>
                </li>
                 <li class="nav-item">
                    <a class="nav-link" href="<%=JPView.CHANGE_PASSWORD_CTL%>">Change Password</a>
                </li>
                
                <%} 
                if(userBean.getRoleId()==3){%>
                <li class="nav-item active">
                    <a class="nav-link" href="<%=JPView.WELCOME_CTL%>">Home<span class="sr-only">(current)</span></a>
                </li>
                
                <li class="nav-item">
                    <a class="nav-link" href="<%=JPView.JOB_LIST_CTL%>">Job List</a>
                </li>
                
                <li class="nav-item">
                    <a class="nav-link" href="<%=JPView.APPLY_LIST_CTL%>">Apply Job List</a>
                </li>
                
             
                 <li class="nav-item">
                    <a class="nav-link" href="<%=JPView.MY_PROFILE_CTL%>">My Profile</a>
                </li>
                 <li class="nav-item">
                    <a class="nav-link" href="<%=JPView.CHANGE_PASSWORD_CTL%>">Change Password</a>
                </li>
                
                <%}} %>
                
            </ul>
             <ul class="navbar-nav ml-auto nav-flex-icons">
               <li class="nav-item">
                    <b><a class="nav-link" href="#"><%=welcomeMsg%></a></b>
                </li>
               
                 <%
				if (userLoggedIn) {
				 %> 
                <li class="nav-item">
                    <a class="nav-link" href="<%=JPView.LOGIN_CTL%>?operation=<%=LoginCtl.OP_LOG_OUT%>">LogOut</a>
                </li>
                <%
					} else {
				%>
				 <li class="nav-item">
                    <a class="nav-link" href="<%=JPView.LOGIN_CTL%>">Login</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="<%=JPView.USER_REGISTRATION_CTL%>">SignUp</a>
                </li>
				<%
             }
             %>
            </ul>
        </div>
    </nav>
    </header>
    <br>
    <br>
    <br>
    
    <hr>
   
</body>
</html>