<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>Coders Ranking</title>
    <link rel="stylesheet" type="text/css" href="/assets/stylesheets/bootstrap.css">
  </head>
  <body>
  <%!
      Statement st;
      Connection con;
      String query;
      ResultSet rs;
  %>
    <%--userul cu id-ul 1 este userul curent, iar cel cu id-ul 2 este userul a carui pagina o vizualizam--%>
  <%
      Class.forName("com.mysql.jdbc.Driver");
      con = DriverManager.getConnection("jdbc:mysql://localhost/coders_ranking", "root", "");

      st = con.createStatement();
      query = "SELECT * FROM `user` WHERE `id`='1'";
      rs = st.executeQuery(query);
      if(!rs.next()) {
          query = "INSERT INTO `user` VALUES(1, 'default', 'default', 'default', 'default', 'default')";
          st.executeUpdate(query);
      }

      query = "SELECT * FROM `user` WHERE `id`='2'";
      rs = st.executeQuery(query);
      if(!rs.next()) {
          query = "INSERT INTO `user` VALUES(2, 'default', 'defaul' , 'default', 'default', 'default')";
          st.executeUpdate(query);
      }
  %>
  <%--afisarea imaginii de pe pagina principala--%>
  <div style="position:absolute; float:left ; width:45%"> <img src="/assets/images/back.png" style="width: 100%"></div>
  <div class="span12" style="float:right ; width:53%">
      <%--afisarea logoului--%>
      <div class="row">
          <a href='' style="float: left; left: 10%">
              <span>Coders Ranking</span>
          </a>
      </div>

      <div class='row' style="float:left; width:40%">
          <div class="span "id='signin'>
              <%--sectiunea linkurilor rapide catre alte site-uri cu informatii despre programatorii dintr-o anumita retea--%>
              <section class='panel sign-up-panel'>
                  <header>
                      <br />
                      <h1>Sign in</h1>
                  </header>
                  <div class='inside-panel'>
                      <div class = "row">
                          <br />
                          <div class="span3">

                              <a  class='button' href='http://www.github.com/login' >
                                  <img src='/assets/images/index.jpeg' style="height:40px; width:40px" />Sign in via Github
                              </a>

                          </div>
                      </div>
                      <div class = "row">
                          <br />
                          <div class="span3">
                              <a class='button' href='http://www.linkedin.com/'>
                                  <div class='signin linkedin'></div>
                                  <img src='/assets/images/Linkedin.png' style="height:40px; width:40px" />Sign in via Linkedin
                              </a>
                          </div>
                      </div>

                      <div class = "row">
                          <br />
                          <div class="span3">
                              <a class='button' href='http://stackoverflow.com/users/login'>
                                  <div class='signin stackoverflow'></div>
                                  <img src='/assets/images/stackoverflow-logo-250.png' style="height:40px; width:40px" />Sign in via Stack Overflow
                              </a>
                          </div>
                      </div>


                  </div>
              </section>

          </div>
      </div>
      <div style="float : right; width:60%">
          <br/>
          <br/>
          <%--formularul de sign in--%>
          <p> Or, you can sign in with your Coders Ranking account</p>
          <%--Clasa Login folosita pentru a testa userul si parola si pentru a-l redirectiona la pagina de profil sau la index--%>
          <%--Userul e redirectat la index daca a folosit unul din cuvinte "banned" si nu i-a experiat ban-ul sau are parola gresita--%>
          <%--In caz contrar userul e redirectat la profil--%>
          <form action="Login" method="GET">
              Username: <input type="text" name="user" value= ${user} >
              <br />
              Password: <input type="password" name="password" value= ${password}>
              <br />
              <input type="submit" value="Submit" />

          </form>

          <br />
          <%--forumlarul de sign up--%>
          <p class=''>
              Don't have an account?
              <a href="http://localhost:8080/sign_up.jsp">Join Coders Ranking</a>.
          </p>
          <%--dictionarul englez-roman--%>
          <p>
              Don't know the words?
              <a href="http://localhost:8080/traduc.jsp">Search for a word</a>.
          </p>
      </div>


  </div>
  </body>
</html>