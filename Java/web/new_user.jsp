<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="Simple.Encryption" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>User Added</title>
</head>
<%-- Contine partea de cod pentru adaugarea in baza de date a unui nou user--%>
<%-- Vom folosi pentru aceasta HTTPRequestServlet standard denumit in cele ce urmeaza request--%>
<body>
<%!
    String password;
    Statement st,st2;
    Connection con;
    String query;
%>
<div> <img src="/assets/images/smile.jpg" style="height: 80% ; width:60%; margin-left:20%"></div>
<div style="top: 50%; text-align: center">
    <% out.print("The following user was added: " + request.getParameter("Email"));%>
</div>
<div style="top:60%; margin-left: 47%">
    <button name="index">
        <a href="index.jsp"> Home </a>
    </button>
</div>
<%
    Class.forName("com.mysql.jdbc.Driver");
    con = DriverManager.getConnection("jdbc:mysql://localhost/coders_ranking", "root", "");

    st = con.createStatement();
    st2 =  con.createStatement();
    /*parola va fi encriptata folosind algoritmul md5*/
    password = request.getParameter("Passwd");
    try {
        password = Encryption.crypt(password);
    } catch (Exception e) {}
    query = "INSERT INTO `user` VALUES(NULL, '"+ request.getParameter("FirstName") +"','" + request.getParameter("LastName")+"','"
            + request.getParameter("Email") +"','" + request.getParameter("BirthDay")+
            request.getParameter("BirthMonth")+ request.getParameter("BirthYear")+"','" + password + "')";
    st.executeUpdate(query);
    query = "INSERT INTO `user_info` VALUES (NULL, '"+ request.getParameter("Email") +"', -1, -1, -1, -1)";
    st2.executeUpdate(query);
    con.close();
%>
</body>
</html>