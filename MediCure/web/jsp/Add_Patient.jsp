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
  <a   class="active" href="<%=application.getContextPath() %>/jsp/Add_Patient.jsp">Add Patient</a>
  <a  href="<%=application.getContextPath() %>/jsp/Consulted_Patient.jsp">Consulted Patient</a>
  <a  href="<%=application.getContextPath() %>/jsp/D_Profile.jsp">Profile</a>
  <a  href="<%=application.getContextPath() %>/jsp/Login.jsp">Logout</a>

</div>

  
  <%
    if(request.getParameter("submit")!=null)
    {
        
        Connection con=(Connection)application.getAttribute("con");
    
    PreparedStatement pstmt=null,pstmt2=null,pstmt3=null,pstmt4=null;
        ResultSet rs=null,rs2=null,rs3=null,rs4=null;
        
        
        int pid=Integer.parseInt(request.getParameter("pid"));
        int uid=(Integer)session.getAttribute("doctorid");
        
        
        String sq="select * from doctor where user_id="+uid;
        
        pstmt2=con.prepareStatement(sq);
        rs=pstmt2.executeQuery();
        
        rs.next();
        
       int did=rs.getInt("id");
        
        
        String sql="insert into pat_doc_rel(patient_id,doctor_id) values(?,?)";
        
        
        pstmt=con.prepareStatement(sql);
        
        pstmt.setInt(1, pid);
        pstmt.setInt(2, did);
        pstmt.executeUpdate();
        
        System.out.println("data inserted into pat_doc_rel");
        
    }
    
    
    %>
  
  
  
<div class="container">
  <h2>Add Patient</h2>
  <form action="<%= application.getContextPath() %>/jsp/Add_Patient.jsp" method="post">
    <div class="form-group">
      <label for="name">Name</label>
      <input type="text" class="form-control" id="name" placeholder="Enter Patient Name" name="name">
    </div>
    <div class="form-group">
      <label for="pid">Id</label>
      <input type="text" class="form-control" id="pid" placeholder="Enter Id Of Patient" name="pid">
    </div>
    <button type="submit" class="btn btn-success" name="submit" id="submit">Add</button>
  </form>
</div>

</body>
</html>
