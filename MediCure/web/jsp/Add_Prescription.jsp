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
  <a href="<%=application.getContextPath() %>/jsp/Consulted_Doctors.jsp">Consulted Doctors</a>
  <a href="<%=application.getContextPath() %>/jsp/Add_Reports.jsp">Add Reports</a>
  <a  href="<%=application.getContextPath() %>/jsp/Add_Doctor.jsp">Add Doctor</a>
  <a class="active" href="<%=application.getContextPath() %>/jsp/Add_Prescription.jsp">Add Prescription</a>

  <a  href="<%=application.getContextPath() %>/jsp/Profile.jsp">Profile</a>
  <a href="<%=application.getContextPath() %>/jsp/Login.jsp">Logout</a>
</div>




<%
    try{
          if(request.getParameter("submit")!=null)
          {
             Connection con=(Connection)application.getAttribute("con");
    
    PreparedStatement pstmt=null,pstmt2=null,pstmt3=null,pstmt4=null;
        ResultSet rs=null,rs2=null,rs3=null;
    
    String sql="insert into report(prescription_image,patient_id,doctor_id) values(?,?,?)";
    
    
    pstmt=con.prepareStatement(sql);
    
      pstmt.setString(1, request.getParameter("file"));
      pstmt.setInt(2,(Integer)session.getAttribute("userid"));
      pstmt.setInt(3, Integer.parseInt(request.getParameter("doctor_id")));
    
       pstmt.executeUpdate();
       System.out.println("prescription inserted");
    

          }
    }catch(Exception ex) {
            System.out.println("error.............."+ex.getMessage());
        }

%>


<div class="container">
  <h2>Add Prescription</h2>
  <form action="<%= application.getContextPath() %>/jsp/Add_Prescription.jsp" method="post">
    <div class="form-group">
      <label for="email">Consulted Doctor's Name</label>
      <input type="text" class="form-control" id="doctor_name" placeholder="Enter Doctor Name" name="doctor_name">
    </div>
    <div class="form-group">
      <label for="pwd">Consulted Doctor's Id</label>
      <input type="text" class="form-control" id="doctor_id" placeholder="Enter Id Of Doctor" name="doctor_id">
    </div>
    <div class="form-group">
      <label for="file">Select file:</label>
      <input type="file" name="file" id="file" accept="image/*">
    </div>
    <button type="submit" class="btn btn-success" name="submit" id="submit">Add</button>
  </form>
</div>

</body>
</html>
