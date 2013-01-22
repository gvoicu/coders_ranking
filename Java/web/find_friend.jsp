<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Find a friend</title>
</head>
<body>
    <%!
        Statement st;
        Connection con;
        String query;
        ResultSet rs;
    %>
    <div style="float:left">
        <img src='/assets/images/friend-yahoo-profiles-800x800.jpg' style="height: 45% ; width:100%; "/>
        <form action="find_friend.jsp">
            Friend's most prolific language: <input type="text" name="pr_lang">
            Friend's preferred book: <input type="text" name="pr_book">
            Friend's favourite game: <input type="text" name="pr_game">
            <br/>
            Friend's maximum age: <input type="text" name="pr_age">
            <input type="submit" value="Search">
        </form>
    </div>

    <%
      if(request.getParameter("pr_lang")!=null || request.getParameter("pr_book")!=null || request.getParameter("pr_game")!=null ||
              request.getParameter("pr_age")!=null) {     %>
        <div style="float:right; width: 50%; margin-right: 15%">
            <%
                Class.forName("com.mysql.jdbc.Driver");
                con = DriverManager.getConnection("jdbc:mysql://localhost/coders_ranking", "root", "");
                st = con.createStatement();
                /* Select de baza + request-urile*/
                query ="SELECT * FROM `user`, `user_info`, `games`, `books`, `progr_languages` WHERE " +
                        "`id_lang`=`progr_languages`.`id` AND `id_amazon`=`books`.`id` AND `id_game`=`games`.`id` AND" +
                        "`user`.`email`=`user_info`.`email` AND `user`.`id`>2";
                if (!request.getParameter("pr_lang").equals("")) {
                    query += " AND `progr_languages`.`name`='"+request.getParameter("pr_lang")+
                            "'";
                }
                if (!request.getParameter("pr_book").equals("")) {
                    query += " AND `books`.`name`='"+request.getParameter("pr_book")+
                            "'";
                }
                if (!request.getParameter("pr_game").equals("")) {
                    query += " AND `games`.`name`='"+request.getParameter("pr_game")+
                            "'";
                }
                if (!request.getParameter("pr_age").equals("")) {
                    query += " AND 2013-CONVERT(SUBSTRING(`birthday`,-4),UNSIGNED INTEGER)<'"+request.getParameter("pr_age")+
                            "'";
                }
                rs = st.executeQuery(query);
                %>  <form action="user_profile.jsp" method="GET">
                   <%
                    while (rs.next()) {
                   %>
                    <button name="userpage<%out.print(rs.getString("email")); %>" data-role="button">
                            <%out.print(rs.getString("email")); %>
                    </button>
                    <%
                }
                   %>
                     </form>
        </div>
      <%}
    %>

</body>
</html>