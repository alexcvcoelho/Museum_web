<%-- 
    Document   : index
    Created on : 19/05/2016, 15:55:39
    Author     : Alex Coelho
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home</title>
        <link href="resources/css/bootstrap.min.css" rel="stylesheet"> 
        <link href="resources/css/table-sorter.css" rel="stylesheet"> 
        <link href="resources/css/tablesorter.pager.css" rel="stylesheet">  
        <link href="resources/css/dataTables.bootstrap.css" rel="stylesheet"> 
    </head>
    <body>
        <div class="container-fluid"> 
            <h2>Museu Virtual</h2>
            <div class="col-lg-4 div-branca">
                <div class="list-group">
                    <div class="list-group-item active">Controllers</div>
                    <a class="list-group-item" href="museum">Museum</a>
                    <a class="list-group-item" href="theme">Theme</a>
                    <a class="list-group-item" href="answer">Answer</a>
                    <a class="list-group-item" href="museological">Museological</a>
                    <a class="list-group-item" href="scenario">Scenario</a>
                </div>
            </div>
        </div>
        <script src="resources/js/jquery-min.js"></script>
        <script src="resources/js/jquery.tablesorter.min.js"></script>
        <script src="resources/js/jquery.tablesorter.pager.js"></script>
        <script src="resources/js/bootstrap.js"></script>
    </body>
</html>

