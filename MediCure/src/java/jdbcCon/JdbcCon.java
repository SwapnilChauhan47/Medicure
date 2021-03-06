
package jdbcCon;

/**
 *
 * @author bhargavpatel
 */
import java.sql.*;
import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;



public class JdbcCon  implements ServletContextListener {

    
   
   
	public void contextDestroyed(ServletContextEvent arg0) {
           
        ServletContext ctx;
         Connection con;
           try {
                   ctx=arg0.getServletContext();
                   con=(Connection)ctx.getAttribute("con");
                   con.close();
               
               
               } catch (Exception cnfe) {
            System.out.println(cnfe.getMessage());
        }
	}

        //Run this before web application is started
	
	public void contextInitialized(ServletContextEvent arg0) {
		 ServletContext ctx;
             String url, driver, un, up;
             Connection con;
	    System.out.println("ServletContextListener initialzed");
            ctx=arg0.getServletContext();
            driver = ctx.getInitParameter("driver");
            url = ctx.getInitParameter("url");
            un = ctx.getInitParameter("username");
            up = ctx.getInitParameter("password");

        try {
            Class.forName(driver);
            System.out.println("Driver is loaded");

            con = DriverManager.getConnection(url, un, up);
              System.out.println("Connected"+con);
            ctx.setAttribute("con",con);
           

        } catch (ClassNotFoundException cnfe) {
            System.out.println(cnfe.getMessage()+" .........................error");
        } catch (SQLException sqle) {
            System.out.println(sqle.getMessage()+" .........................error");
        } catch (Exception cnfe) {
            System.out.println(cnfe.getMessage()+" .........................error");
        }
        
        
	}
   
}
