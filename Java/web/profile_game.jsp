<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title> My Favorite Game </title>
</head>
<body>
    <%--insiruire a unor nume de jocuri celebre--%>
    Which one's your favorite?
    <form action="Game" method="GET">
        <button name="Fifa" data-mini="true" data-role="button">
            Fifa
        </button>

        <button name="Football Manager" data-mini="true" data-role="button">
            Football Manager
        </button>

        <button name="Sims" data-mini="true" data-role="button">
            Sims
        </button>

        <button name="None of the above :)" data-mini="true" data-role="button">
            None of the above :)
        </button>

        <button name="Sorry, I only play outside :P" data-mini="true" data-role="button">
            Sorry, I only play outside :P
        </button>

    </form>
</body>
</html>