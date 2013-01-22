<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="Simple.Encryption" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Create an Account</title>
    <link rel="stylesheet" type="text/css" href="/assets/stylesheets/bootstrap.css">
</head>
<body>
<%-- Afisarea field-urilor care urmeaza sa fie completate de noul utilizator --%>
<div style="float: left; margin-left: 20%">
<form action="new_user.jsp" method="GET">     <%--La crearea utilizatorului se va afisa o noua pagina--%>
<div class="row">
    <legend><strong>New Account</strong></legend>
    <label id="firstname-label" class="firstname">
        <strong>First name</strong>
        <input type="text" value="" name="FirstName" id="FirstName" value="" spellcheck="false">
    </label>
    <label id="lastname-label" class="lastname">
        <strong>Last name</strong>
        <input type="text" value="" name="LastName" id="LastName" value="" spellcheck="false">
    </label>
    </fieldset>
</div>

<div class="row">
    <label id="email-label">
        <strong>Email</strong>
        <input type="text" name="Email" id="Email" >
    </label>
</div>

<div class="row" id="password">
    <label id="password-label">
        <strong>Password</strong>
        <input type="password" name="Passwd" id="Passwd" >
    </label>
</div>

<div class="row" id="confirm-password">
    <label id="confirm-password-label">
        <strong>Confirm password</strong>
        <input type="password" name="PasswdC" id="PasswdC" >
    </label>
</div>

<div class="row" id="birthday">
    <legend><strong id="BirthdayLabel">Birthday [Optional]</strong></legend>

    <label id="day-label" class="day">
        <strong>Day</strong>
        <input type="text" maxlength="2" value="" name="BirthDay" id="BirthDay" value="">
    </label>

    <label id="month-label" class="month">
        <strong>Month</strong>
        <input type="text" maxlength="2" value="" name="BirthMonth" id="BirthMonth" value="">
    </label>

    <label id="year-label" class="year">
        <strong>Year</strong>
        <input type="text" maxlength="4" value="" name="BirthYear" id="BirthYear" value="">
    </label>

    <input type="submit" value="Sign Up" />
    <br />

</form>
</div>
</div>
</body>
</html>