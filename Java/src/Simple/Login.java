package Simple;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;

public class Login extends HttpServlet {
    private static final long serialVersionUID = 1L;
    Statement st, st2, stBanned,st3;
    Connection con;
    String query;
    String parola;
    String username;
    ResultSet rs, rsBanned, rsTime,rs2;
    PreparedStatement ps;
    String sql = "SELECT CURTIME()";
    String crt;

    public Login() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost/coders_ranking", "root", "");
            st = con.createStatement();
            stBanned = con.createStatement();
            st2 = con.createStatement();
            st3 = con.createStatement();
            ps = con.prepareStatement(sql);
            rsTime = ps.executeQuery();

            username = request.getParameter("user");
            query = "SELECT * FROM `user` WHERE `email`='"+ username +"'"+" AND `id`>2";
            parola = (String) request.getParameter("password");
            parola = Encryption.crypt(parola);
            rs = st.executeQuery(query);

            query = "SELECT * FROM `banned_users`";
            rsBanned = stBanned.executeQuery(query);
            if (rs.next()) {
                while (rsBanned.next()) {
                    if(username.equals(rsBanned.getString("email"))) {
                        while (rsTime.next()) {
                            crt = rsTime.getString(1);
                            query = "SELECT * FROM `banned_users` WHERE (SUBTIME(CURTIME(),`time`)>'00:15:00' OR CURTIME()<`time`)" +
                                    " AND `email`='"+username+"'";
                            rs2 = st3.executeQuery(query);
                            if (rs2.next()) {
                                query = "DELETE FROM `banned_users` WHERE `email` = '" + username +"'";
                                st2.executeUpdate(query);
                                if (rs.getString("password_hash").equals(parola)) {
                                    request.getRequestDispatcher("user_profile.jsp").forward(request, response);
                                    return;
                                }
                                else {
                                    request.getRequestDispatcher("index.jsp").forward(request, response);
                                    return;
                                }
                            }
                            else {
                                request.getRequestDispatcher("index.jsp").forward(request, response);
                                return;
                            }
                        }
                    }
                }

                if (rs.getString("password_hash").equals(parola)) {
                    request.getRequestDispatcher("user_profile.jsp").forward(request, response);
                }
                else {
                    request.getRequestDispatcher("index.jsp").forward(request, response);
                }
            }
            else {
                request.getRequestDispatcher("index.jsp").forward(request, response);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        PrintWriter p=response.getWriter();
        p.println("Success!");
        doGet(request,response);
    }

}
