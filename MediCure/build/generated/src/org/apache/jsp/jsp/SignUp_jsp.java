package org.apache.jsp.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.ResultSet;
import java.sql.PreparedStatement;
import java.sql.Connection;

public final class SignUp_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");

    
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


      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<html lang=\"en\">\n");
      out.write("<head>\n");
      out.write("  <title>Sign Up Page</title>\n");
      out.write("  <meta charset=\"utf-8\">\n");
      out.write("  <meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">\n");
      out.write("  <link rel=\"stylesheet\" href=\"https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css\">\n");
      out.write("  <script src=\"https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js\"></script>\n");
      out.write("  <script src=\"https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js\"></script>\n");
      out.write("  \n");
      out.write("  \n");
      out.write("  <script>\n");
      out.write("      $(document).ready(function(){\n");
      out.write("          \n");
      out.write("          $(\"#patient\").click(function(){\n");
      out.write("          \n");
      out.write("        \n");
      out.write("           $(\"#dis\").removeClass(\"hidden\");\n");
      out.write("           \n");
      out.write("           $(\"#aller\").removeClass(\"hidden\");\n");
      out.write("           \n");
      out.write("           \n");
      out.write("           $(\"#eq\").addClass(\"hidden\");\n");
      out.write("           \n");
      out.write("           $(\"#wa\").addClass(\"hidden\");\n");
      out.write("           \n");
      out.write("           \n");
      out.write("       });\n");
      out.write("       \n");
      out.write("       \n");
      out.write("        $(\"#doctor\").click(function(){\n");
      out.write("          \n");
      out.write("        \n");
      out.write("           $(\"#eq\").removeClass(\"hidden\");\n");
      out.write("           \n");
      out.write("           $(\"#wa\").removeClass(\"hidden\");\n");
      out.write("           \n");
      out.write("             $(\"#dis\").addClass(\"hidden\");\n");
      out.write("           \n");
      out.write("           $(\"#aller\").addClass(\"hidden\");\n");
      out.write("           \n");
      out.write("           \n");
      out.write("       });\n");
      out.write("       \n");
      out.write("       \n");
      out.write("       \n");
      out.write("       \n");
      out.write("          \n");
      out.write("      });\n");
      out.write("      \n");
      out.write("     \n");
      out.write("      \n");
      out.write("      </script>\n");
      out.write("      \n");
      out.write("      \n");
      out.write("      <style>\n");
      out.write("          body{\n");
      out.write("  background-image: url(http://www.joburgchiropractor.co.za/images/background.jpg);\n");
      out.write("}\n");
      out.write("\n");
      out.write("          </style>\n");
      out.write("\n");
      out.write("  \n");
      out.write("</head>\n");
      out.write("<body>\n");
      out.write("<div class=\"container\">\n");
      out.write("  <h2 class=\"text-center\">Sign Up Page</h2>\n");
      out.write("  <form class=\"form-horizontal\" action=\"");
      out.print( application.getContextPath());
      out.write("/jsp/SignUp.jsp\" method=\"post\">\n");
      out.write("    <div class=\"form-group\">\n");
      out.write("      <label class=\"control-label col-sm-2\" for=\"name\">Name:</label>\n");
      out.write("      <div class=\"col-sm-10\">\n");
      out.write("          <input type=\"text\" class=\"form-control\" id=\"name\" placeholder=\"Enter name: \" name=\"name\" required>\n");
      out.write("      </div>\n");
      out.write("    </div>\n");
      out.write("      \n");
      out.write("       <div class=\"form-group\">\n");
      out.write("      <label class=\"control-label col-sm-2\" for=\"address\">Address:</label>\n");
      out.write("      <div class=\"col-sm-10\">\n");
      out.write("        <input type=\"text\" class=\"form-control\" id=\"address\" placeholder=\"Enter address: \" name=\"address\" required>\n");
      out.write("      </div>\n");
      out.write("    </div>\n");
      out.write("      \n");
      out.write("      \n");
      out.write("       <div class=\"form-group\">\n");
      out.write("      <label class=\"control-label col-sm-2\" for=\"bg\">Blood Group:</label>\n");
      out.write("      <div class=\"col-sm-10\">\n");
      out.write("        <input type=\"text\" class=\"form-control\" id=\"bg\" placeholder=\"Enter Blood Group \" name=\"bg\" required>\n");
      out.write("      </div>\n");
      out.write("    </div>\n");
      out.write("      \n");
      out.write("      \n");
      out.write("       <div class=\"form-group\">\n");
      out.write("      <label class=\"control-label col-sm-2\" for=\"dob\">DOB:</label>\n");
      out.write("      <div class=\"col-sm-10\">\n");
      out.write("        <input type=\"date\" class=\"form-control\" id=\"dob\"  name=\"dob\" required/>\n");
      out.write("      </div>\n");
      out.write("    </div>\n");
      out.write("      \n");
      out.write("      \n");
      out.write("      \n");
      out.write("       <div class=\"form-group\">\n");
      out.write("      <label class=\"control-label col-sm-2\" for=\"contact\">Contact: </label>\n");
      out.write("      <div class=\"col-sm-10\">\n");
      out.write("        <input type=\"text\" class=\"form-control\" id=\"contact\" placeholder=\"Enter mobile no: \" name=\"contact\" required>\n");
      out.write("      </div>\n");
      out.write("    </div>\n");
      out.write("      \n");
      out.write("      \n");
      out.write("      <div class=\"form-group\">\n");
      out.write("      <label class=\"control-label col-sm-2\" for=\"gender\">Gender: </label>\n");
      out.write("      <div class=\"col-sm-10\">\n");
      out.write("          \n");
      out.write("         <div class=\"form-check radio-inline\">\n");
      out.write("  <input type=\"radio\" class=\"form-check-input\" id=\"male\" name=\"gender\" value=\"male\">\n");
      out.write("  <label class=\"form-check-label\" for=\"male\">Male</label>\n");
      out.write("</div>\n");
      out.write("          \n");
      out.write("          <div class=\"form-check radio-inline\">\n");
      out.write("  <input type=\"radio\" class=\"form-check-input\" id=\"female\" name=\"gender\" value=\"female\">\n");
      out.write("  <label class=\"form-check-label\" for=\"female\">Female</label>\n");
      out.write("</div>\n");
      out.write("      </div>\n");
      out.write("    </div>\n");
      out.write("     \n");
      out.write("    \n");
      out.write("      \n");
      out.write("          \n");
      out.write("       \n");
      out.write("       <div class=\"form-group\">\n");
      out.write("      <label class=\"control-label col-sm-2\" for=\"contact\">Role: </label>\n");
      out.write("      <div class=\"col-sm-10\">\n");
      out.write("            <div class=\"form-check radio-inline\">\n");
      out.write("  <input type=\"radio\" class=\"form-check-input\" id=\"patient\" name=\"role\" value=\"patient\">\n");
      out.write("  <label class=\"form-check-label\" for=\"patient\">Patient</label>\n");
      out.write("</div>\n");
      out.write("      \n");
      out.write("         <div class=\"form-check radio-inline\">\n");
      out.write("  <input type=\"radio\" class=\"form-check-input\" id=\"doctor\" name=\"role\" value=\"doctor\">\n");
      out.write("  <label class=\"form-check-label\" for=\"doctor\">Doctor</label>\n");
      out.write("</div>\n");
      out.write("          \n");
      out.write("      </div>\n");
      out.write("    </div>\n");
      out.write("            \n");
      out.write(" \n");
      out.write("      \n");
      out.write("      \n");
      out.write("  \n");
      out.write("      \n");
      out.write("      \n");
      out.write("      \n");
      out.write("      \n");
      out.write("      <div class=\"form-group hidden\" id=\"aller\">\n");
      out.write("      <label class=\" control-label col-sm-2\" for=\"allergies\" >Allergies: </label>\n");
      out.write("      <div class=\"col-sm-10\">\n");
      out.write("        <input type=\"text\" class=\"form-control\" id=\"allergies\" placeholder=\"enter allergies\" name=\"allergies\" >\n");
      out.write("      </div>\n");
      out.write("    </div>\n");
      out.write("      \n");
      out.write("      <div class=\"form-group hidden\" id=\"dis\">\n");
      out.write("      <label class=\"control-label col-sm-2\" for=\"disease\">Disease: </label>\n");
      out.write("      <div class=\"col-sm-10\">\n");
      out.write("        <input type=\"text\" class=\"form-control\" id=\"disease\" placeholder=\"Enter Disease: \" name=\"disease\" >\n");
      out.write("      </div>\n");
      out.write("    </div>\n");
      out.write("      \n");
      out.write("      \n");
      out.write("      \n");
      out.write("       <div class=\"form-group hidden\" id=\"eq\">\n");
      out.write("      <label class=\"control-label col-sm-2\" for=\"edu\">Eductional_Qualification: </label>\n");
      out.write("      <div class=\"col-sm-10\">\n");
      out.write("        <input type=\"text\" class=\"form-control\" id=\"edu\" placeholder=\"Enter Degree: \" name=\"edu\">\n");
      out.write("      </div>\n");
      out.write("    </div>\n");
      out.write("      \n");
      out.write("      \n");
      out.write("       <div class=\"form-group hidden\" id=\"wa\">\n");
      out.write("      <label class=\"control-label col-sm-2\" for=\"work\">Workplace_Address: </label>\n");
      out.write("      <div class=\"col-sm-10\">\n");
      out.write("        <input type=\"text\" class=\"form-control\" id=\"work\" placeholder=\"Enter address \" name=\"work\">\n");
      out.write("      </div>\n");
      out.write("    </div>\n");
      out.write("      \n");
      out.write("      \n");
      out.write("      \n");
      out.write("       <div class=\"form-group\">\n");
      out.write("      <label class=\"control-label col-sm-2\" for=\"pwd\">User Name:</label>\n");
      out.write("      <div class=\"col-sm-10\">          \n");
      out.write("        <input type=\"text\" class=\"form-control\" id=\"un\" placeholder=\"Enter user name\" name=\"un\" required>\n");
      out.write("      </div>\n");
      out.write("    </div>\n");
      out.write("      \n");
      out.write("    <div class=\"form-group\">\n");
      out.write("      <label class=\"control-label col-sm-2\" for=\"pwd\">Password:</label>\n");
      out.write("      <div class=\"col-sm-10\">          \n");
      out.write("        <input type=\"password\" class=\"form-control\" id=\"pwd\" placeholder=\"Enter password\" name=\"pwd\" required>\n");
      out.write("      </div>\n");
      out.write("    </div>\n");
      out.write("    <div class=\"form-group\">        \n");
      out.write("      <div class=\"col-sm-offset-2 col-sm-10\">\n");
      out.write("        <div class=\"checkbox\">\n");
      out.write("          <label><input type=\"checkbox\" name=\"remember\"> Remember me</label>\n");
      out.write("        </div>\n");
      out.write("      </div>\n");
      out.write("    </div>\n");
      out.write("      \n");
      out.write("    <div class=\"form-group\">        \n");
      out.write("      <div class=\"col-sm-offset-2 col-sm-10\">\n");
      out.write("        <button type=\"submit\" class=\"btn btn-success\" id=\"submit\" name=\"submit\">Register</button>\n");
      out.write("      </div>\n");
      out.write("    </div>\n");
      out.write("      \n");
      out.write("      <div class=\"form-group\">        \n");
      out.write("      <div class=\"col-sm-offset-2 col-sm-10\">\n");
      out.write("          <button type=\"submit\" class=\"btn btn-info\"><a href=\"");
      out.print(  application.getContextPath() );
      out.write("/jsp/Login.jsp\" style=\"color:white\">Login</a></button>\n");
      out.write("      </div>\n");
      out.write("    </div>\n");
      out.write("      \n");
      out.write("      \n");
      out.write("  </form>\n");
      out.write("</div>\n");
      out.write("\n");
      out.write("    \n");
      out.write("    \n");
      out.write("\n");
      out.write("    \n");
      out.write("</body>\n");
      out.write("</html>\n");
      out.write("\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
