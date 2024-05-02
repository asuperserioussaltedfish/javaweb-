package web;

import dao.impl.UserDaoImpl;
import po.User;
import utils.UserThreadLocal;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/loginCheck")
public class LoginServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        request.getSession().removeAttribute("Message");
        String account = request.getParameter("account");
        String password = request.getParameter("password");
        try {
            boolean isMatch = new UserDaoImpl().hasMatchUser(account, password);
            if (isMatch){
                //放入用户线程池中
                UserThreadLocal.put(new User());
                // 登录成功
                request.getSession().setAttribute("Message", "LoginSuccess");
                response.sendRedirect(request.getContextPath() + "/home/Home.jsp");
            } else if (!new UserDaoImpl().findUserByAccount(account)){
                // 用户不存在
                // 设置错误信息请求转发到登录页
                request.setAttribute("Message", "AccountError");
                request.getRequestDispatcher("/login/Login.jsp").forward(request, response);
            }else{
                // 密码错误
                // 设置错误信息请求转发到登录页
                request.setAttribute("Message", "PasswordError");
                request.getRequestDispatcher("/login/Login.jsp").forward(request, response);
            }
        } catch (Exception e) {
            System.out.println(e);
            // 异常处理
            request.setAttribute("Message", "Exception");
            request.getRequestDispatcher("/login/Login.jsp").forward(request, response);

        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        doPost(request, response);
    }
}