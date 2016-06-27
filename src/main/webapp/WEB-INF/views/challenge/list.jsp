<%-- 
    Document   : list
    Created on : Jun 17, 2016, 1:06:50 PM
    Author     : filip_000
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Museu WEB - Challenge</title>
         <link href="resources/css/bootstrap.min.css" rel="stylesheet"> 
        <link href="resources/css/table-sorter.css" rel="stylesheet"> 
        <link href="resources/css/tablesorter.pager.css" rel="stylesheet">  
        <link href="resources/css/dataTables.bootstrap.css" rel="stylesheet"> 
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
       
    </head>
    <body>
        <div class="col-lg-1"></div>
        <div class="col-lg-10 div-branca">
            <div class="panel">
                <h3>
                    Challenge 
                    <a type="button" class="btn btn-success btn-sm" onclick="href='challengeCreate?id=-1'">
                        <span class="glyphicon glyphicon-plus"></span>
                    </a>
                    <hr>
                </h3>
               
               
                <table class="table tablesorter table-striped sortable table- table-bordered">
                    <thead>
                        <tr>
                            <th class="header">Id</th> 
                            <th class="header">Descrição</th>                           
                            <th class="header" id="td-acoes">Ações</th>
                        </tr>
                    </thead>
                    
                    <tbody>
                        <c:forEach var="cha" items="${lista}">
                            <tr>
                                <td>
                                    ${cha.challengeId}
                                </td>
                                <td>
                                    ${cha.description}  
                                </td>                                                         
                                <td>
                                    <a  class="btn btn-primary btn-sm" href="#" onclick="alterar('${cha.challengeId}')">
                                        <span class="glyphicon glyphicon-edit"></span></a>
                                    <a type="button" class="btn btn-danger btn-sm" onclick="href='actions/deleteChallenge?challengeId=${cha.challengeId}' "><span class="glyphicon glyphicon-trash"></span></a>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
                <hr>
                <div class="btn-group" >
                    <a type="button"  class="btn btn-info " href='home'><span class="glyphicon glyphicon-circle-arrow-left"></span> Voltar</a>              
                </div>
            </div>
        </div>
               
        <div class="col-lg-1"></div>
       
        
        
    <script src="resources/js/jquery-min.js"></script>
    <script src="resources/js/jquery.tablesorter.min.js"></script>
    <script src="resources/js/jquery.tablesorter.pager.js"></script>
    <script src="resources/js/bootstrap.js"></script>
    <script type="text/javascript">    
        function alterar(id) 
        {
            window.location.href='challengeCreate?id='+id;
        };
        
    </script>
    
    </body>
</html>

