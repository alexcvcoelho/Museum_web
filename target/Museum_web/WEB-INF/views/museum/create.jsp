<%-- 
    Document   : create
    Created on : 30/05/2016, 14:27:58
    Author     : Alex
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Museum Create</title>
        <link href="resources/css/bootstrap.min.css" rel="stylesheet"> 
        <link href="resources/css/table-sorter.css" rel="stylesheet"> 
        <link href="resources/css/tablesorter.pager.css" rel="stylesheet">  
        <link href="resources/css/dataTables.bootstrap.css" rel="stylesheet"> 
    </head>
    <body>
        <div class="container-fluid">
            <h2>Museum - Create</h2>
            <div class="col-lg-2">
                <div class="list-group">                      
                    <a class="list-group-item" href="/">List</a>
                    <div class="list-group-item active">Create</div>
                </div>
            </div>
            <div class="col-lg-10">
                <form role="form" method="POST">
                    <div class="form-group">
                        <label for="nome">Nome:</label>
                        <input type="text" class="form-control" name="nome"/>
                    </div>
                    <input type="submit" class="btn btn-success" value="Salvar"/>
                </form>
            </div>
        </div>
    </body>
</html>
