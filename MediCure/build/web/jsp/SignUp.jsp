<%-- 
    Document   : SignUp
    Created on : 11 Apr, 2019, 10:56:23 PM
    Author     : bhargavpatel
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>



<%
    
    try{
        
        
        
    if(request.getParameter("submit")!=null)
    {
        String n=request.getParameter("name");
        String p=request.getParameter("pwd");
          String address=request.getParameter("address");
            String bg=request.getParameter("bg");
              String dob=request.getParameter("dob");
            
          String mo=request.getParameter("contact");
        String gender=request.getParameter("gender");
        
        String role=request.getParameter("role");
        
        String aler=request.getParameter("allergies");
        System.out.println("....1......");
        String dis=request.getParameter("disease");
          System.out.println("....2......");
        String edu=request.getParameter("edu");
          System.out.println("....3......");
        String work=request.getParameter("work");
          System.out.println("....3......");
        String un=request.getParameter("un");
          System.out.println("....4......");
      
          Connection con=(Connection)application.getAttribute("con");
        
        
        
          
          
          
          
      
       
        String sql="insert into user(fullname,address,blood_group,dob,contact,role,gender,password,username) values(?,?,?,?,?,?,?,?,?)";
     
        PreparedStatement pstmt=con.prepareStatement(sql);
        
           pstmt.setString(1, n);
           pstmt.setString(2, address);
           pstmt.setString(3, bg);
           pstmt.setString(4, dob);
           pstmt.setString(5, mo);
           pstmt.setString(6, role);
           pstmt.setString(7, gender);
           pstmt.setString(8, p);
           pstmt.setString(9, un);
          int row=pstmt.executeUpdate();
    
          
          System.out.println("data inserted into user table.");
          
         if(row!=0)
         { 
           if(role.equals("patient"))
           {
               int uid;
               String sql3="select * from user";
               
              PreparedStatement ps=con.prepareStatement(sql3);
              
              ResultSet rs=ps.executeQuery(sql3);
              
             while(rs.next())
             {
                 String un1=rs.getString("username");
                  String p1=rs.getString("password");
                 
                  
                 
                   
                   
                  if(un1.equals(un) && p1.equals(p))
                  { 
                      uid=rs.getInt("id");
                      
                        String sql2="insert into patient(allergies,disease,user_id)  values(?,?,?)";
               
               PreparedStatement pstmt2=con.prepareStatement(sql2);
               pstmt2.setString(1, aler);
               pstmt2.setString(2, dis);
               pstmt2.setInt(3, uid);
               pstmt2.executeUpdate();
               
               
                System.out.println("data inserted into patient");
               
               response.sendRedirect(application.getContextPath()+"/jsp/Profile.jsp");
          
              
                  }
             }
              
              
               
               
             
               
           }
           
           
           
              if(role.equals("doctor"))
           {
               String sql4="select * from user";
               
              PreparedStatement ps2=con.prepareStatement(sql4);
              
               
              
              
              
         
              ResultSet rs=ps2.executeQuery(sql4);
           
              int uid;
              
             
              
              while(rs.next())
              {
                  String un1=rs.getString("username");
                  String p1=rs.getString("password");
                 
                  
                 
                   
                   
                  if(un1.equals(un) && p1.equals(p))
                  { 
                      uid=rs.getInt("id");
                  
                  System.out.println("uid: "+uid);
                  
                
               String sql2="insert into doctor(edu_qul,work_address,user_id) values(?,?,?)";
               
               PreparedStatement pstmt2=con.prepareStatement(sql2);
               
               pstmt2.setString(1, edu);
               pstmt2.setString(2, work);
               pstmt2.setInt(3, uid);
               pstmt2.executeUpdate();
            
                
               System.out.println("data inserted into doctor.");
               
             
           
               response.sendRedirect(application.getContextPath()+"/jsp/D_Profile.jsp");
                  
                  
                  }
              }
              
              
              
              
               
            
           }
           
           
         } 
       
        
    }//outer if
    }catch (Exception ex) {
            System.out.println("error......."+ex.getMessage());
        }

%>
























<html lang="en">
<head>
  <title>Sign Up Page</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
  
  
  <script>
      $(document).ready(function(){
          
          $("#patient").click(function(){
          
        
           $("#dis").removeClass("hidden");
           
           $("#aller").removeClass("hidden");
           
           
           $("#eq").addClass("hidden");
           
           $("#wa").addClass("hidden");
           
           
       });
       
       
        $("#doctor").click(function(){
          
        
           $("#eq").removeClass("hidden");
           
           $("#wa").removeClass("hidden");
           
             $("#dis").addClass("hidden");
           
           $("#aller").addClass("hidden");
           
           
       });
       
       
       
       
          
      });
      
     
      
      </script>
      
      
      <style>
          body{
  background-image: url(http://www.joburgchiropractor.co.za/images/background.jpg);
}

          </style>

  
</head>
<body>
<div class="container">
  <h2 class="text-center">Sign Up Page</h2>
  <form class="form-horizontal" action="<%= application.getContextPath()%>/jsp/SignUp.jsp" method="post">
    <div class="form-group">
      <label class="control-label col-sm-2" for="name">Name:</label>
      <div class="col-sm-10">
          <input type="text" class="form-control" id="name" placeholder="Enter name: " name="name" required>
      </div>
    </div>
      
       <div class="form-group">
      <label class="control-label col-sm-2" for="address">Address:</label>
      <div class="col-sm-10">
        <input type="text" class="form-control" id="address" placeholder="Enter address: " name="address" required>
      </div>
    </div>
      
      
       <div class="form-group">
      <label class="control-label col-sm-2" for="bg">Blood Group:</label>
      <div class="col-sm-10">
        <input type="text" class="form-control" id="bg" placeholder="Enter Blood Group " name="bg" required>
      </div>
    </div>
      
      
       <div class="form-group">
      <label class="control-label col-sm-2" for="dob">DOB:</label>
      <div class="col-sm-10">
        <input type="date" class="form-control" id="dob"  name="dob" required/>
      </div>
    </div>
      
      
      
       <div class="form-group">
      <label class="control-label col-sm-2" for="contact">Contact: </label>
      <div class="col-sm-10">
        <input type="text" class="form-control" id="contact" placeholder="Enter mobile no: " name="contact" required>
      </div>
    </div>
      
      
      <div class="form-group">
      <label class="control-label col-sm-2" for="gender">Gender: </label>
      <div class="col-sm-10">
          
         <div class="form-check radio-inline">
  <input type="radio" class="form-check-input" id="male" name="gender" value="male">
  <label class="form-check-label" for="male">Male</label>
</div>
          
          <div class="form-check radio-inline">
  <input type="radio" class="form-check-input" id="female" name="gender" value="female">
  <label class="form-check-label" for="female">Female</label>
</div>
      </div>
    </div>
     
    
      
          
       
       <div class="form-group">
      <label class="control-label col-sm-2" for="contact">Role: </label>
      <div class="col-sm-10">
            <div class="form-check radio-inline">
  <input type="radio" class="form-check-input" id="patient" name="role" value="patient">
  <label class="form-check-label" for="patient">Patient</label>
</div>
      
         <div class="form-check radio-inline">
  <input type="radio" class="form-check-input" id="doctor" name="role" value="doctor">
  <label class="form-check-label" for="doctor">Doctor</label>
</div>
          
      </div>
    </div>
            
 
      
      
  
      
      
      
      
      <div class="form-group hidden" id="aller">
      <label class=" control-label col-sm-2" for="allergies" >Allergies: </label>
      <div class="col-sm-10">
        <input type="text" class="form-control" id="allergies" placeholder="enter allergies" name="allergies" >
      </div>
    </div>
      
      <div class="form-group hidden" id="dis">
      <label class="control-label col-sm-2" for="disease">Disease: </label>
      <div class="col-sm-10">
        <input type="text" class="form-control" id="disease" placeholder="Enter Disease: " name="disease" >
      </div>
    </div>
      
      
      
       <div class="form-group hidden" id="eq">
      <label class="control-label col-sm-2" for="edu">Eductional_Qualification: </label>
      <div class="col-sm-10">
        <input type="text" class="form-control" id="edu" placeholder="Enter Degree: " name="edu">
      </div>
    </div>
      
      
       <div class="form-group hidden" id="wa">
      <label class="control-label col-sm-2" for="work">Workplace_Address: </label>
      <div class="col-sm-10">
        <input type="text" class="form-control" id="work" placeholder="Enter address " name="work">
      </div>
    </div>
      
      
      
       <div class="form-group">
      <label class="control-label col-sm-2" for="pwd">User Name:</label>
      <div class="col-sm-10">          
        <input type="text" class="form-control" id="un" placeholder="Enter user name" name="un" required>
      </div>
    </div>
      
    <div class="form-group">
      <label class="control-label col-sm-2" for="pwd">Password:</label>
      <div class="col-sm-10">          
        <input type="password" class="form-control" id="pwd" placeholder="Enter password" name="pwd" required>
      </div>
    </div>
    <div class="form-group">        
      <div class="col-sm-offset-2 col-sm-10">
        <div class="checkbox">
          <label><input type="checkbox" name="remember"> Remember me</label>
        </div>
      </div>
    </div>
      
    <div class="form-group">        
      <div class="col-sm-offset-2 col-sm-10">
        <button type="submit" class="btn btn-success" id="submit" name="submit">Register</button>
      </div>
    </div>
      
      <div class="form-group">        
      <div class="col-sm-offset-2 col-sm-10">
          <button type="submit" class="btn btn-info"><a href="<%=  application.getContextPath() %>/jsp/Login.jsp" style="color:white">Login</a></button>
      </div>
    </div>
      
      
  </form>
</div>

    
    

    
</body>
</html>

