package Simple;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

public class Game extends HttpServlet {
    private static final long serialVersionUID = 1L;
    Statement st, st2, st3, st4, st5;
    Connection con;
    String query;
    ResultSet rs, rs2, rs4;
    String game;
    int id_game;
    String email;

    public Game() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost/coders_ranking", "root", "");
            st = con.createStatement();
            st2 = con.createStatement();
            st3 = con.createStatement();
            st4 = con.createStatement();
            st5 = con.createStatement();

            query = "SELECT * FROM `user` WHERE `id`=1";
            rs = st.executeQuery(query);
            if (rs.next()) {
                // valoarea default pentru id este -1. Aceasta urmeaza a fi updatata
                game =(String) request.getParameterNames().nextElement();
                email = rs.getString("email");
                query = "SELECT * FROM `games` WHERE `name`='"+ game +"'";
                rs2 = st2.executeQuery(query);
                if(rs2.next()) {
                    id_game = rs2.getInt("id");
                }
                else {
                    query = "INSERT INTO `games` VALUES (NUll,'"+ game +"')";
                    st3.executeUpdate(query);
                    query = "SELECT * FROM `games` WHERE `name`='"+ game +"'";
                    rs4 = st4.executeQuery(query);
                    if(rs4.next()) {
                        id_game = rs4.getInt("id");
                    }
                }

                query = "UPDATE `user_info` SET `id_game`='"+ id_game +"' WHERE `email`='"+email+"'";
                st5.executeUpdate(query);
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
