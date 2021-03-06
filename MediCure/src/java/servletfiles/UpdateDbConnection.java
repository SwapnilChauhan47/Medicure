
package servletfiles;


import javax.servlet.ServletContext;
import javax.servlet.ServletRequestEvent;
import javax.servlet.ServletRequestListener;
import java.sql.*;

public class UpdateDbConnection implements ServletRequestListener {

    @Override
    public void requestDestroyed(ServletRequestEvent event) {

    }

//    @Override
    public void requestInitialized(ServletRequestEvent event) {
        System.out.println("inside requestInitialized");
        ServletContext ctx = event.getServletContext();
        Connection con = (Connection) ctx.getAttribute("con");
        String url, driver, un, up;
        try {
            driver = ctx.getInitParameter("driver");
            url = ctx.getInitParameter("url");
            un = ctx.getInitParameter("username");
            up = ctx.getInitParameter("password");
            boolean flag = CheckDbConnection.isDbConnected(con);
            System.out.println("flag===="+flag);

            if (!flag) {
                Class.forName(driver);
                // System.out.println("Driver is loaded");

                con = DriverManager.getConnection(url, un, up);
                ctx.setAttribute("con", con);
                //System.out.println("Connected");
            }

        } catch (Exception e) {
            System.out.println("====="+e.getMessage());
        }

    }

}
