<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title> Find Common Interests </title>
</head>
<body>
<%!
    Statement st,st2,st3, st4, st5, st6, st7;
    Connection con;
    String query, query2;
    ResultSet rs,rs2,rs3, rs4, rs5, rs6, rs7;
    String currentUser;
%>
<div class="ui-controlgroup-controls">
    <form action="find_interests.jsp" method="GET">
    Who has the same
    <div class="ui-checkbox"><input type="checkbox" name="id_image" id="checkbox-1a" class="custom"><label for="checkbox-1a" data-corners="true" data-shadow="false" data-iconshadow="true" data-wrapperels="span" data-icon="checkbox-off" data-theme="b" class="ui-btn ui-btn-icon-left ui-corner-top ui-checkbox-on ui-btn-up-b"><span class="ui-btn-inner ui-corner-top"><span class="ui-btn-text">profile picture</span><span class="ui-icon ui-icon-shadow ui-icon-checkbox-on">&nbsp;</span></span></label></div>
    <div class="ui-checkbox"><input type="checkbox" name="id_lang" id="checkbox-2a" class="custom"><label for="checkbox-2a" data-corners="true" data-shadow="false" data-iconshadow="true" data-wrapperels="span" data-icon="checkbox-off" data-theme="b" class="ui-btn ui-btn-icon-left ui-checkbox-on ui-btn-up-b"><span class="ui-btn-inner"><span class="ui-btn-text">favorite language</span><span class="ui-icon ui-icon-shadow ui-icon-checkbox-on">&nbsp;</span></span></label></div>
    <div class="ui-checkbox"><input type="checkbox" name="id_amazon" id="checkbox-3a" class="custom"><label for="checkbox-3a" data-corners="true" data-shadow="false" data-iconshadow="true" data-wrapperels="span" data-icon="checkbox-off" data-theme="b" class="ui-btn ui-btn-icon-left ui-checkbox-on ui-btn-up-b"><span class="ui-btn-inner"><span class="ui-btn-text">favorite book</span><span class="ui-icon ui-icon-shadow ui-icon-checkbox-on">&nbsp;</span></span></label></div>
    <div class="ui-checkbox"><input type="checkbox" name="id_game" id="checkbox-4a" class="custom"><label for="checkbox-4a" data-corners="true" data-shadow="false" data-iconshadow="true" data-wrapperels="span" data-icon="checkbox-off" data-theme="b" class="ui-btn ui-btn-icon-left ui-corner-bottom ui-controlgroup-last ui-checkbox-on ui-btn-up-b"><span class="ui-btn-inner ui-corner-bottom ui-controlgroup-last"><span class="ui-btn-text">favorite game</span><span class="ui-icon ui-icon-shadow ui-icon-checkbox-on">&nbsp;</span></span></label></div>
    I do?

    <input type="submit" value="Search">
    </form>
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

        query = "SELECT * FROM `user` WHERE `id`=1";
        rs = st.executeQuery(query);

        if(rs.next() && (request.getParameter("id_lang")!=null||request.getParameter("id_amazon")!=null
        ||request.getParameter("id_image")!=null||request.getParameter("id_game")!=null)) {
//            preiau emailul userului curent
            currentUser = rs.getString("email");
            %> My perfect match has to have: <br/> <%
            query = "SELECT * FROM `user_info` WHERE `email`='"+currentUser+"'";
            rs2 = st2.executeQuery(query);
            if (rs2.next()) {
                /*preluarea tuturor conditiilor*/
                query ="SELECT * FROM `user_info`, `games`, `books`, `progr_languages` , `images` WHERE " +
                        "`id_lang`=`progr_languages`.`id` AND `id_amazon`=`books`.`id` AND `id_game`=`games`.`id` AND" +
                        "`images`.`id`=`user_info`.`id_image` AND `user_info`.`id`!='"+rs2.getString("id")+"'";
                if (request.getParameter("id_lang")!=null){
                    query += "AND `user_info`.`id_lang`='"+rs2.getInt("id_lang")+"'";
                    query2 ="SELECT * FROM `progr_languages` WHERE `id`='" + rs2.getInt("id_lang") +"'";
                    rs5 = st5.executeQuery(query2);
                    if(rs5.next()) {
                    %> <li> his/her most prolific language similar to: <% out.write(rs5.getString("name"));%> </li> <%}
                }
                if (request.getParameter("id_image")!=null){
                    query += "AND `user_info`.`id_image`='"+rs2.getInt("id_image")+"'";
                    query2 ="SELECT * FROM `images` WHERE `id`='" + rs2.getInt("id_image") +"'";
                    rs4 = st4.executeQuery(query2);
                    if(rs4.next()) {
                    %><li> this image  <img src='<% out.print(rs4.getString("location")); %>' style="height:100px; width:100px" /></li> <% }
                }
                if (request.getParameter("id_amazon")!=null){
                    query += "AND `user_info`.`id_amazon`='"+rs2.getInt("id_amazon")+"'";
                    query2 ="SELECT * FROM `books` WHERE `id`='" + rs2.getInt("id_amazon") +"'";
                    rs6 = st6.executeQuery(query2);
                    if(rs6.next()) {
                    %> <li> this favourite book: <% out.write(rs6.getString("name"));%></li><% }
                }
                if (request.getParameter("id_game")!=null){
                    query += "AND `user_info`.`id_game`='"+rs2.getInt("id_game")+"'";
                    query2 ="SELECT * FROM `games` WHERE `id`='" + rs2.getInt("id_game") +"'";
                    rs7 = st7.executeQuery(query2);
                    if(rs7.next()) {
                        %> <li>this favorite game: <% out.write(rs7.getString("name"));%></li><% }
                }
            }
        }
        rs3 = st3.executeQuery(query); %>
        <form action="user_profile.jsp" method="GET">
        <% while (rs3.next())  {
    %>
            Your perfect match is:
            <button name="userpage<%out.print(rs3.getString("email")); %>" data-role="button">
                <%out.print(rs3.getString("email")); %>
            </button>
    <%}%>

    </form>
</div>
</body>
</html>