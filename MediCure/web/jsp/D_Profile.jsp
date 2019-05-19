<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Date"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<style>
body {
  margin: 0;
  font-family: "Lato", sans-serif;
}

.sidebar {
  margin: 0;
  padding: 0;
  width: 200px;
  background-color: #f1f1f1;
  position: fixed;
  height: 100%;
  overflow: auto;
}

.sidebar a {
  display: block;
  color: black;
  padding: 16px;
  text-decoration: none;
}

.sidebar a.active {
  background-color: #4CAF50;
  color: white;
}

.sidebar a:hover:not(.active) {
  background-color: #555;
  color: white;
}

div.content {
  margin-left: 200px;
  padding: 1px 16px;
  height: 1000px;
}

@media screen and (max-width: 700px) {
  .sidebar {
    width: 100%;
    height: auto;
    position: relative;
  }
  .sidebar a {float: left;}
  div.content {margin-left: 0;}
}

@media screen and (max-width: 400px) {
  .sidebar a {
    text-align: center;
    float: none;
  }
}
</style>
</head>
<body>

<div class="sidebar">
  <a  href="<%=application.getContextPath() %>/jsp/Add_Patient.jsp">Add Patient</a>
  <a  href="<%=application.getContextPath() %>/jsp/Consulted_Patient.jsp">Consulted Patient</a>
  <a class="active" href="<%=application.getContextPath() %>/jsp/D_Profile.jsp">Profile</a>
  <a  href="<%=application.getContextPath() %>/jsp/Login.jsp">Logout</a>

</div>
<div class="container">
  <h2>Personal Details</h2>
            
  <table class="table table-striped">
    <tbody>
    
        <%
          
            
             Connection con=(Connection)application.getAttribute("con");
    
    PreparedStatement pstmt=null,pstmt2=null,pstmt3=null,pstmt4=null;
        ResultSet rs=null,rs2=null,rs3=null,rs4=null;
            
     String sql="select * from user where id="+(Integer)session.getAttribute("doctorid");


        pstmt=con.prepareStatement(sql);
        
        rs=pstmt.executeQuery();
        
          rs.next();
         
          int id=rs.getInt(1);
          String n=rs.getString(2);
          String add=rs.getString(3);
          String bg=rs.getString(4);
          Date dob=rs.getDate(5);
          String co=rs.getString(6);
          String role=rs.getString(7);
          String gender=rs.getString(8);
          String username=rs.getString(10);
            
            %>
        
        <tr>
            <td>Name</td>
            <td><%= n %></td>
            </tr>
        <tr>
            <td>Address</td>
            <td><%= add %></td>
            </tr>
        
            <tr>
            <td>Blood_Group</td>
            <td><%= bg %></td>
            </tr>
        
            
          <tr>
            <td>Date Of Birth</td>
            <td><%= dob %></td>
            </tr>  
            
            <tr>
            <td>Contact</td>
            <td><%= co %></td>
            </tr>
            
            <tr>
            <td>Role</td>
            <td><%=  role%></td>
            </tr>
            
            <tr>
            <td>Gender</td>
            <td><%= gender %></td>
            </tr>
            
            <tr>
            <td>UserName</td>
            <td><%= username %></td>
            </tr>
            
    </tbody>
  </table>
</div>
</body>
</html>
