
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>













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
  <a class="active" href="Consulted_Patient.jsp">Consulted Patient</a>
  <a  href="<%=application.getContextPath() %>/jsp/D_Profile.jsp">Profile</a>
  <a  href="<%=application.getContextPath() %>/jsp/Login.jsp">Logout</a>

</div>


<div class="container">
  <h2>Patient Record</h2>
   <input class="form-control" id="myInput" type="text" placeholder="Search..">
  <table class="table table-striped">
    <thead>
      <tr>
        <th>Name</th>
        <th>Address</th>
        <th>Contact</th>
        <th>Disease</th>
        <th>Allergies</th>
        <th>Reports</th>
        <th>Prescription</th>
      </tr>
    </thead>
    <tbody id="myTable">

     <% 

    Connection con=(Connection)application.getAttribute("con");
    
    PreparedStatement pstmt=null,pstmt2=null,pstmt3=null,pstmt4=null;
    ResultSet rs=null,rs2=null,rs3=null;
    
   String role="patient";
     String sql="select * from user where role='"+role+"'";

 //   String sql2="select * from report";

  
     pstmt=con.prepareStatement(sql);
     rs=pstmt.executeQuery();


//
//    pstmt3=con.prepareStatement(sql2);
//     rs3=pstmt3.executeQuery();


      while(rs.next())
      {
        
          
          
          String n=rs.getString("fullname");
          String address=rs.getString("address");
          String contact=rs.getString("contact");
          
          
          String sq="select * from patient where user_id="+rs.getInt("id");
          
          pstmt2=con.prepareStatement(sq);
           rs2=pstmt2.executeQuery();
          
          rs2.next();
          
          String dis=rs2.getString("disease");
          String aller=rs2.getString("allergies");
          
  %>
  
  
  <tr>
      <td><%= n %></td>
       <td><%=address %></td>
       <td><%=  contact %></td>
       <td><%= dis %></td>
       <td><%= aller %></td>
       <td><a href="<%= application.getContextPath() %>/jsp/SR.jsp" >View</a></td>
        <td><a href="<%=application.getContextPath() %>/jsp/SP.jsp" >View</a></td>
      </tr>
  
  <%
          
      }




%>   
        
        
        
        
        
        
    </tbody>
  </table>
</div>
  
  
  
  
  
  <script>
$(document).ready(function(){
  $("#myInput").on("keyup", function() {
    var value = $(this).val().toLowerCase();
    $("#myTable tr").filter(function() {
      $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
    });
  });
});
</script>


</body>
</html>
