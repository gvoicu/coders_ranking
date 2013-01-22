<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Traducator online</title>
    <style>
        .imagine {
            float: left;
            width: 65%;
        }
        .translator {
            float: right;
            top: 10%;
            width: 30%;
        }

    </style>
</head>
<body>
    <%!

    Statement st;
    Connection con;
    String query;
    ResultSet rs;
    String romana;

    %>
    <div class="imagine">
        <img src='/assets/images/Miniature_DNF_Dictionary_055_ubt.JPG' style="width:100%" />
    </div>
    <div class="translator">
        <form method="GET">
            english word: <input type="text" name="english">   <%--Introducerea cuvantului in engleza--%>
            <br />
            <input type="submit" value="Search" />
            <br />

          <%

            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost/coders_ranking", "root", "");

            st = con.createStatement();
            query = "SELECT * FROM `dictionar` WHERE `english`='" + request.getParameter("english") +"'";
            rs = st.executeQuery(query);
            while(rs.next()) {
                romana = rs.getString("roman");
            }

            con.close();
            %>
            cuvantul romanesc: <output type="text" name="roman" ><% out.write(romana); %></output>
            <%-- Afisarea cuvantului corespunzator in limba romana din baza de date--%>
            <br />
        </form>
    </div>
</body>
</html>