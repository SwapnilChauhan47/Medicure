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
    <a  href="<%=application.getContextPath() %>/jsp/Show_Reports.jsp">Show Reports</a>
  <a href="<%=application.getContextPath() %>/jsp/Show_Prescription.jsp">Show Prescription</a>
  <a class="active" href="<%=application.getContextPath() %>/jsp/Consulted_Doctors.jsp">Consulted Doctors</a>
  <a href="<%=application.getContextPath() %>/jsp/Add_Reports.jsp">Add Reports</a>
  <a  href="<%=application.getContextPath() %>/jsp/Add_Doctor.jsp">Add Doctor</a>
  <a href="<%=application.getContextPath() %>/jsp/Add_Prescription.jsp">Add Prescription</a>

  <a  href="<%=application.getContextPath() %>/jsp/Profile.jsp">Profile</a>
  <a href="<%=application.getContextPath() %>/jsp/Login.jsp">Logout</a>
</div>


<div class="container">
     <h2>Consulted Doctor Records</h2>
      <input class="form-control" id="myInput" type="text" placeholder="Search..">
  <table class="table table-striped">
    <thead>
      <tr>
        <th>Name</th>
        <th>WorkPlace Address</th>
        <th>Contact</th>
        <th>Educational Qualification</th>

      </tr>
    </thead>
    <tbody id="myTable">
        
        <%
            try{
             Connection con=(Connection)application.getAttribute("con");
    
    PreparedStatement pstmt=null,pstmt2=null,pstmt3=null,pstmt4=null;
    ResultSet rs=null,rs2=null,rs3=null;


String sql="select * from pat_doc_rel where patient_id="+(Integer)session.getAttribute("userid");

System.out.println("uid: "+session.getAttribute("userid"));

    pstmt=con.prepareStatement(sql);
    
   rs=pstmt.executeQuery();
   
   System.out.println(".........1...........");

  while(rs.next())
  {
      int did=rs.getInt("doctor_id");
      
      System.out.println(".........111...........");
      String sq="select * from doctor where id="+did;
      
      pstmt2=con.prepareStatement(sq);
      rs2=pstmt2.executeQuery();
      
      System.out.println(".........2...........");
     
    
          
      rs2.next();
      
      String work=rs2.getString("work_address");
      String edu=rs2.getString("edu_qul");
      
      System.out.println(".........3...........");
      
      String sq2="select * from user where id="+rs2.getInt("user_id");
      
       pstmt3=con.prepareStatement(sq2);
      rs3=pstmt3.executeQuery();
      
      System.out.println(".........4...........");
      
      rs3.next();
      
      
      String n=rs3.getString("fullname");
      String contact=rs3.getString("contact");
      
      System.out.println(".........5...........");
      %>
      
      
       <tr>
      <td><%= n %></td>
       <td><%=work %></td>
       <td><%=  contact %></td>
       <td><%= edu %></td>
      </tr>
      
      <%
      
      
  }
}catch(Exception e)
{
System.out.println("............................"+e.getMessage());
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
