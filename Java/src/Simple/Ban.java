package Simple;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import java.util.ArrayList;

public class Ban extends HttpServlet {
    private static final long serialVersionUID = 1L;
    Statement st, st2;
    Connection con;
    String query;
    ResultSet rs, rsTime;
    PreparedStatement ps;
    ArrayList<String> bannedWords = new ArrayList<String>();
    String sql = "SELECT CURTIME()";
    String crt;

    public Ban() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost/coders_ranking", "root", "");
            st = con.createStatement();
            st2 = con.createStatement();
            ps = con.prepareStatement(sql);
            rsTime = ps.executeQuery();

            query = "SELECT * FROM `banned_words`";
            rs = st.executeQuery(query);
            while (rs.next()) {
                bannedWords.add(rs.getString("word"));
            }
            /* Valoarea boolean redirect pentru a vedea daca s-a realizat redirect la index | Am avut cuvant banat */
            Boolean redirect = false;
            for(int i=0; i<bannedWords.size(); i++) {
                if(request.getParameter("title").contains(bannedWords.get(i))) {
                    query = "SELECT * FROM `user` WHERE `id`=1";
                    rs = st.executeQuery(query);
                    if (rs.next()) {
                        while (rsTime.next()) {
                            crt = rsTime.getString(1);
                            query = "INSERT INTO `banned_users` VALUES (NULL,'"+ rs.getString("email") +"','"+ crt +"')";
                            redirect = true;
                            st.executeUpdate(query);
                            request.getRequestDispatcher("index.jsp").forward(request, response);
                        }
                    }
                }
                if(request.getParameter("message").contains(bannedWords.get(i))) {
                    query = "SELECT * FROM `user` WHERE `id`=1";
                    rs = st.executeQuery(query);
                    if (rs.next()) {
                        while (rsTime.next()) {
                            crt = rsTime.getString(1);
                            query = "INSERT INTO `banned_users` VALUES (NULL,'"+ rs.getString("email") +"','"+ crt +"')";
                            redirect = true;
                            st.executeUpdate(query);
                            request.getRequestDispatcher("index.jsp").forward(request, response);
                        }
                    }
                }

            }
            if (!redirect) {
                request.getRequestDispatcher("user_profile.jsp").forward(request, response);
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
