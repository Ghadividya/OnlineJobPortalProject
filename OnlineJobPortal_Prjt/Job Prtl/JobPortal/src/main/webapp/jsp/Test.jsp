<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%@ include file="Header.jsp"%>
<main class="login-form">
	<div class="cotainer">
		<div class="row justify-content-center">
			<div class="col-md-8">
				<div class="card">
					<div class="card-header">
						My Profile
						
					</div>

					<div class="card-body">

						<form action="<%=JPView.MY_PROFILE_CTL%>" method="post">
						
						<table class="table">
				<thead>
                    <tr>
                        <th><input type="text" class="form-control" placeholder="First Name"></th>
                         <th><input style="background-color:#0b889c; color: white;" type="submit" class="form-control" value="Search"></th>
                       
                    </tr>
                </thead>
						
						</table>
						
					 <table class="table">
               
                <thead>
                    <tr>
                        <th><b>ID</b></th>
                        <th><b>First Name</b></th>
                        <th><b>Last Name</b></th>
                        <th><b>HHHHH</b></th>
                         <th><b>HHHHH</b></th>
                          <th><b>HHHHH</b></th>
                           <th><b>HHHHH</b></th>
                            <th><b>HHHHH</b></th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>1</td>
                        <td>Mark</td>
                        <td>Otto</td>
                        <td>@mdo</td>
                         <td>@mdo</td>
                          <td>@mdo</td>
                    </tr>
                    <tr>
                        <td>2</td>
                        <td>Jacob</td>
                        <td>Thornton</td>
                        <td>@fat</td>
                         <td>@mdo</td>
                          <td>@mdo</td>
                    </tr>
                    <tr>
                        <td>3</td>
                        <td>Larry</td>
                        <td>the Bird</td>
                        <td>@twitter</td>
                         <td>@mdo</td>
                          <td>@mdo</td>
                    </tr>
                     <tr>
                        <td>3</td>
                        <td>Larry</td>
                        <td>the Bird</td>
                        <td>@twitter</td>
                         <td>@mdo</td>
                          <td>@mdo</td>
                    </tr>
                     <tr>
                        <td>3</td>
                        <td>Larry</td>
                        <td>the Bird</td>
                        <td>@twitter</td>
                         <td>@mdo</td>
                          <td>@mdo</td>
                    </tr>
                     <tr>
                        <td>3</td>
                        <td>Larry</td>
                        <td>the Bird</td>
                        <td>@twitter</td>
                         <td>@mdo</td>
                          <td>@mdo</td>
                    </tr>
                </tbody>
            </table>
            
            <table class="table">
				<thead>
                    <tr>
                         <th><input style="background-color:#0b889c; color: white;" type="submit" class="form-control" value="Search"></th>
                         <th><input style="background-color:#0b889c; color: white;" type="submit" class="form-control" value="Search"></th>
                         <th><input style="background-color:#0b889c; color: white;" type="submit" class="form-control" value="Search"></th>
                        <th><input style="background-color:#0b889c; color: white;" type="submit" class="form-control" value="Search"></th>
                    </tr>
                </thead>
						
						</table>

							
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