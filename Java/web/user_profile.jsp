<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title> My Profile </title>
    <script src="http://code.jquery.com/jquery-1.8.2.min.js"></script>
    <link rel="stylesheet" href="http://code.jquery.com/mobile/1.2.0/jquery.mobile-1.2.0.min.css" />
    <script src="http://code.jquery.com/mobile/1.2.0/jquery.mobile-1.2.0.min.js"></script>
</head>
<body>
<%!
    Statement st,st2,st3,st4, st5, st6, st7, st8, st10, st11;
    Connection con;
    String query;
    String currentUser;
    String currentUserPage;
    String temp;
    ResultSet rs,rs2,rs3, rs5, rs6, rs7, rs8, rs10, rs11;
%>

<div>
    <form action="http://localhost:8080/index.jsp" method="GET">
        <a href="http://localhost:8080/index.jsp"> Sign out </a>
    </form>
</div>

<div style="float: left; width: 30%;">
    <h3> POSTS </h3>
    <%
        Class.forName("com.mysql.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost/coders_ranking", "root", "");

        st = con.createStatement();
        st2 = con.createStatement();
        st3 = con.createStatement();
        st4 = con.createStatement();
        st5 = con.createStatement();
        st6 = con.createStatement();
        st7 = con.createStatement();
        st8 = con.createStatement();
        st10 = con.createStatement();
        st11 = con.createStatement();
        /* preluarea userului curent si a userului pe a carui profile suntem*/
        /* Daca acum ne-am logat userul curent e acelasi cu al paginii si facem update-urile necesare in baza de date*/
        /* La venirea pe profilul altui user se preia acest user utilizand parametrul din request */
        /* In rest cei doi useri se preiau din baza de date*/
        temp = (String) request.getParameterNames().nextElement();
        if (temp.contains("userpage")){
            currentUserPage = temp.substring(8);
            query = "UPDATE `user` SET `email`='"+ currentUserPage +"' WHERE `id`=2";
            st.executeUpdate(query);
        }
        if (request.getParameter("user") != null) {
            currentUser = request.getParameter("user");
            currentUserPage = request.getParameter("user");
            query = "UPDATE `user` SET `email`='"+ currentUser +"' WHERE `id`=1";
            st.executeUpdate(query);
            query = "UPDATE `user` SET `email`='"+ currentUserPage +"' WHERE `id`=2";
            st.executeUpdate(query);
        } else {
            query = "SELECT * FROM `user` WHERE `id`=1";
            rs = st.executeQuery(query);
            if (rs.next()) {
                currentUser = rs.getString("email");
            }
            query = "SELECT * FROM `user` WHERE `id`=2";
            rs = st.executeQuery(query);
            if (rs.next()) {
                currentUserPage = rs.getString("email");
            }
        }

    %>
    <h6><% out.write(currentUserPage); %>  </h6> <br/>
    <div style="float: left; width: 30%;">
        <form action="http://localhost:8080/profile_pictures.jsp" method="GET">   <%--selectie avatar--%>
            <a href="http://localhost:8080/profile_pictures.jsp"> Choose your profile picture </a>
            <%
                query = "SELECT * FROM `user_info` WHERE `email`='" + currentUserPage +"'";
                rs5 = st5.executeQuery(query);
                if (rs5.next()) {
                    if(rs5.getInt("id_image") != -1) {
                        query = "SELECT * FROM `images` WHERE `id`='"+ rs5.getInt("id_image") +"'";
                        rs6 = st.executeQuery(query);
                        if(rs6.next()) {
                            %>
                           <img src='<% out.print(rs6.getString("location")); %>' style="height:100px; width:100px" />
                        <% }
                    }
                }
            %>
        </form>

        <form action="http://localhost:8080/find_friend.jsp" method="GET">  <%--Alegerea unui user cu anumite caracteristici--%>
            <a href="http://localhost:8080/find_friend.jsp"> Find a friend </a>
        </form>

        <form action="http://localhost:8080/find_interests.jsp" method="GET"> <%--Alegerea unui user cu carasterici comenue cu mine--%>
            <a href="http://localhost:8080/find_interests.jsp"> Who shares the same interests? </a>
        </form>
    </div>

    <div style="float: left; width: 70%">


        <h3>About Me</h3>

        <form action="http://localhost:8080/profile_languages.jsp" method="GET">   <%--Alegerea celui mai indragit limbaj--%>
            <a href="http://localhost:8080/profile_languages.jsp"> Choose your most prolific language</a> <br />
            <%
                query = "SELECT * FROM `user_info` WHERE `email`='" + currentUserPage +"'";
                rs7 = st7.executeQuery(query);
                if (rs7.next()) {
                    if(rs7.getInt("id_lang") != -1) {
                        query = "SELECT * FROM `progr_languages` WHERE `id`='"+ rs7.getInt("id_lang") +"'";
                        rs8 = st8.executeQuery(query);
                        if(rs8.next()) {
            %>
            I rock in:<% out.print(rs8.getString("name")); %>
            <% }
            }
            }
            %>
        </form>

        <form action="http://localhost:8080/profile_books.jsp" method="GET">      <%--Alegerea cartii favorite--%>
            <a href="http://localhost:8080/profile_books.jsp"> If you could choose a book, what would it be?</a> <br />
            <%
                if(rs7.getInt("id_amazon") != -1) {
                    query = "SELECT * FROM `books` WHERE `id`='"+ rs7.getInt("id_amazon") +"'";
                    rs10 = st10.executeQuery(query);
                    if(rs10.next()) {

            %>
            Please buy me  <% out.print(rs10.getString("name")); %> from this
            <a href="http://www.amazon.com/">  site </a>
            <%
            }
            }
            %>
        </form>

        <form action="http://localhost:8080/profile_game.jsp" method="GET">     <%--Alegerea jocului favorit--%>
            <a href="http://localhost:8080/profile_game.jsp"> Do you play games? </a> <br />
            <%
                if(rs7.getInt("id_game") != -1) {
                    query = "SELECT * FROM `games` WHERE `id`='"+ rs7.getInt("id_game") +"'";
                    rs11 = st11.executeQuery(query);
                    if(rs11.next()) {

            %>
            Let's play...  <% out.print(rs11.getString("name")); %>
            <%
                    }
                }
            %>
        </form>

        <h3>New Post</h3>
        <%--Postarea unui nou mesaj--%>
        <%-- Acesta e verificat de clasa Ban pentru a nu contine mesaje din clasa celor neautorizate--%>
        <form action="Ban" method="GET">
            Title: <input type="text" name="title" value= ${title} >
            <br />
            Message: <input type="text" name="message" value= ${message} >
            <br />
            <input type="submit" value="Post" />

            <%
                /*adaugare mesaj in baza de date*/
                if(request.getParameter("title")!=null) {
                    query = "INSERT INTO `posts` VALUES(NULL, '"+ currentUser +"','"+ request.getParameter("title") +"','" + request.getParameter("message")+"')";
                    st.executeUpdate(query);
                }
            %>
        </form>

    </div>
</div>

<div style="float: right; width: 70%;">         <%--Afisarea mesajelor si comenturilor; Posibilitatea de a comenta--%>
    <ul>
        <ul data-role="listview" style="resize: both;">
        <%
                query = "SELECT * FROM `posts` WHERE `email`='"+ currentUserPage +"'";
                rs = st.executeQuery(query);
                while (rs.next()) { %>
                    <li data-role="list-divider" role="heading">Post</li>
                    <li>Title:      <% out.write(rs.getString("title")); %></li>
                    <li>Message:    <% out.write(rs.getString("message")); %></li>
                    <li data-role="list-divider" role="heading">Comments</li>

                 <% query = "SELECT * FROM  `rel_posts_comments` , `comments` WHERE  `comments`.`id` =  `id_comments` " +
                         "AND `id_posts` = '"+ rs.getInt("id")+"'" ;
                    rs2 = st2.executeQuery(query);
                    while (rs2.next()) { %>
                        <li><% out.write(rs2.getString("email")); %>  said: <%out.write(rs2.getString("message")); %></li>
                    <%} %>
                    <li data-role="list-divider" role="heading">Your Comment</li>
                    <li>
                        <form action="BanComment" method="GET">   <%--Clasa pentru testare de cuvinte banned, dar e folosita
                        si pentru introducere commenturile in baza de date in caz de mesaj bun--%>
                        Message: <input type="text" name="comment<%out.write(rs.getString("id"));%>" value= ${comment} >
                        <br />
                        <input type="submit" value="Post" />
                            <%

                            %>
                        </form>
                    </li>
                    <li/>
               <%}
            %>
        </ul>
    </ul>
</div>
</body>
</html>