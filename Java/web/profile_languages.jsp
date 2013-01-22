<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Profile Languages</title>
</head>
<body>
    <%!
        Statement st, st2;
        Connection con;
        String query;
        ResultSet rs;
    %>

    <form action="Language" method="GET">
        <%
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost/coders_ranking", "root", "");

            st = con.createStatement();
            st2 = con.createStatement();


            if(request.getParameter("lang") != null) {
                query = "INSERT INTO `progr_languages` VALUES(NULL, '"+ request.getParameter("lang") + "')";
                st.executeUpdate(query);
            }

            query = "SELECT * FROM `progr_languages`";
            rs = st2.executeQuery(query);
            while (rs.next()) { %>
                <button name="<% out.write(rs.getString("name")); %>" data-mini="true" data-role="button">
                    <% out.write(rs.getString("name")); %>
                </button>

          <%  }
        %>
    </form>

    <%--da userului posibilitatea de a adauga un nou limbaj preferat--%>
    <form action="profile_languages.jsp" method="GET">
        Programming Language: <input type="text" name="lang">
        <input type="submit" value="Add Language" />

    </form>

</body>
</html>