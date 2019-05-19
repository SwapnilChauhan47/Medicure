


<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>




<!DOCTYPE html>
<html lang="en">
<head>
  <title>Login Page</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>


  <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!------ Include the above in your HEAD tag ---------->
  
  
  
<style type="text/css">

body{
  background-image: url(http://www.joburgchiropractor.co.za/images/background.jpg);
}







</style>



</head>
<body>

<!-- if you want to create login page and register page together in one page ...you have to only chnage his name...that's it...                 -->
<div class="container" style="margin-top: 5%;">
  <div class="row">
    <div class="col-sm-4"> </div>
<div class="col-md-4">

<h1 class="text-center text-success"> Login page</h1>
<br/>

<div class="col-sm-12">

  <ul class="nav nav-pills" >



    <li class="" style="width:50%"><a class="btn btn-lg btn-default" data-toggle="tab" href="#home">Doctor</a></li>

    <li class=" " style="width:48%"><a class=" btn btn-lg btn-default" data-toggle="tab" href="#menu1">patient</a></li>



  </ul>

<br/>


<%
if(request.getParameter("submit")!=null)
{
    String n=request.getParameter("name");
    String p=request.getParameter("pwd");
    
    Connection con=(Connection)application.getAttribute("con");
    
    
    int uid;
    
     String sql3="select * from user";
               
              PreparedStatement ps=con.prepareStatement(sql3);
              
              ResultSet rs=ps.executeQuery(sql3);
              
             while(rs.next())
             {
                 String un1=rs.getString("username");
                  String p1=rs.getString("password");
                 String role=rs.getString("role");
                  
                 
                   
                   
                  if(un1.equals(n) && p1.equals(p) && role.equals("doctor"))
                  { 
                      
                           session.setAttribute("doctorid",rs.getInt("id"));
                      
                       response.sendRedirect(application.getContextPath()+"/jsp/D_Profile.jsp");
                  }
             }
              
    
    
}

if(request.getParameter("dbtn")!=null)
{
    String n=request.getParameter("uname");
    String p=request.getParameter("upwd");
    
    Connection con=(Connection)application.getAttribute("con");
    
    
    int uid;
    
     String sql3="select * from user";
               
              PreparedStatement ps=con.prepareStatement(sql3);
              
              ResultSet rs=ps.executeQuery(sql3);
              
             while(rs.next())
             {
                 String un1=rs.getString("username");
                  String p1=rs.getString("password");
                 
                    String role=rs.getString("role");
                 
                   
                   
                  if(un1.equals(n) && p1.equals(p) && role.equals("patient"))
                  { 
                         session.setAttribute("userid",rs.getInt("id"));
                         
                       response.sendRedirect(application.getContextPath()+"/jsp/Profile.jsp");
                  }
             }
              
    
    
}


%>


  <div class="tab-content">
    <div id="home" class="tab-pane fade in active">

        <form action="<%= application.getContextPath() %>/jsp/Login.jsp">

  <div class="form-group">
    <label for="UserName">Doctor-name</label>
    <input type="text" class="form-control" id="name" name="name" required>
  </div>

 

  <div class="form-group">
    <label for="pwd">Password:</label>
    <input type="password" class="form-control" id="pwd" name="pwd" required>
  </div>





  <button type="submit" class="btn btn-info btn-lg" id="submit" name="submit">Login</button>
    <button type="submit" class=" pull-right btn-link"><a href="<%=  application.getContextPath() %>/jsp/SignUp.jsp">create new account</a></button>

</form>




    </div>

    <div id="menu1" class="tab-pane fade">

<form action="<%= application.getContextPath() %>/jsp/Login.jsp">

  <div class="form-group">
    <label for="UserName">UserName</label>
    <input type="text" class="form-control" id="uname" name="uname" required>
  </div>

 
  <div class="form-group">
    <label for="pwd">Password:</label>
    <input type="password" class="form-control" id="upwd" name="upwd" required>
  </div>

 



  <button type="submit" class="btn btn-info" id="dbtn" name="dbtn" >Login</button>


  
  <button type="submit" class=" pull-right btn-link"><a href="<%=  application.getContextPath() %>/jsp/SignUp.jsp">create new account</a></button>

</form>








    </div>
   </div>
  </div>
</div>
</div>

</body>
</html>
