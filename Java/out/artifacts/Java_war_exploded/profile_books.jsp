<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Amazon Wishlist</title>
</head>
<body>
    You can either choose from our selection of books or you can complete your own wishlist. <br/>
    <%!
        Statement st, st2;
        Connection con;
        String query;
        ResultSet rs;
    %>

    <form action="Book" method="GET">
        <%
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost/coders_ranking", "root", "");

            st = con.createStatement();
            st2 = con.createStatement();

            if(request.getParameter("book") != null) {
                query = "INSERT INTO `books` VALUES(NULL, '"+ request.getParameter("book") + "')";
                st.executeUpdate(query);
            }

            query = "SELECT * FROM `books`";
            rs = st2.executeQuery(query);
            while (rs.next()) { %>
        <button name="<% out.write(rs.getString("name")); %>" data-mini="true" data-role="button">
            <% out.write(rs.getString("name")); %>
        </button>

        <%  }
        %>
    </form>

    <%--da userului posibilitatea de a adauga o noua carte in lista cu dorinte--%>
    <form action="profile_books.jsp" method="GET">
        [Hopefully] My new book: <input type="text" name="book">
        <input type="submit" value="Add preference" />

    </form>

</body>
</html>