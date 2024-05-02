package web;

import dao.UserDao;
import dao.impl.UserDaoImpl;
import po.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/registerCheck")
public class RegisterServlet extends HttpServlet {



    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String account = request.getParameter("account");
        String password = request.getParameter("password");
        UserDao userDao = new UserDaoImpl();

        try {
            User user = new User();
            user.setAccount(account);
            user.setPassword(password);
            User userSuccess = userDao.registerUser(user.getAccount(),user.getPassword());

            if (userSuccess != null) {
                //注册成功
                request.setAttribute("Message", "RegisterSuccess");
                request.getRequestDispatcher("/register/Register.jsp").forward(request, response);
            } else {
                //注册失败
                request.setAttribute("Message", "RegisterError");
                request.getRequestDispatcher("/register/Register.jsp").forward(request, response);
            }
        } catch (Exception e) {
            System.out.println(e);
            request.setAttribute("Message", "Exception");
            request.getRequestDispatcher("/register/Register.jsp").forward(request, response);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        doPost(request, response);
    }
}
