package tdc7200.servlet;

import tddc7200.dao.DaydataDAO;
import tddc7200.dao.UserDAO;

import java.lang.reflect.Method;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;




public class BaseForeServlet extends HttpServlet{


    protected UserDAO userDAO = new UserDAO();
    protected DaydataDAO daydataDAO=new DaydataDAO();

    public void service(HttpServletRequest request, HttpServletResponse response) {
        try {

            int start= 0;
            int count = 10;






            String method = (String) request.getAttribute("method");

            Method m = this.getClass().getMethod(method, javax.servlet.http.HttpServletRequest.class,
                    javax.servlet.http.HttpServletResponse.class);

            String redirect = m.invoke(this,request, response).toString();

            if(redirect.startsWith("@"))
                response.sendRedirect(redirect.substring(1));
            else if(redirect.startsWith("%"))
                response.getWriter().print(redirect.substring(1));
            else
                request.getRequestDispatcher(redirect).forward(request, response);

        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
            throw new RuntimeException(e);
        }
    }
}