<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
    <head>
        <title>Museu WEB</title>
        <link href="resources/css/bootstrap.min.css" rel="stylesheet"> 
        <link href="resources/css/table-sorter.css" rel="stylesheet"> 
        <link href="resources/css/tablesorter.pager.css" rel="stylesheet">  
        <link href="resources/css/dataTables.bootstrap.css" rel="stylesheet"> 
    </head>
    <body>
        <div class="container-fluid col-xs-10">
            <h2>Museum - List</h2>
            <div class="col-lg-2 div-branca">
                <div class="list-group">                    
                    <div class="list-group-item active">List</div>
                    <a class="list-group-item" href="museum/create">Create</a>
                </div>
            </div>
            <div class="col-lg-10">
                <table id="tbField" class="table table-bordered">
                    <thead>
                        <tr> 
                            <th class="header">Id</th>
                            <th class="header">Name</th>
                            <th class="header">Scenarios</th>
                            <th class="header">Delete</th>
                            <th class="header">Edit</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${list}" var="museum">
                            <tr>
                                <td><a href="museum/edit?id=${museum.getId()}">${museum.getId()}</a></td>
                                <td>${museum.getName()}</td>
                                <td><c:forEach items="${museum.getScenarios()}" var="sce">
                                        ${sce.getId()} - ${sce.getName()}
                                        <br />
                                    </c:forEach></td>
                                <td><a href="museum/delete?id=${museum.getId()}">Delete</a></td>
                                <td><a href="museum/edit?id=${museum.getId()}">Edit</a></td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>

        <script src="resources/js/jquery-min.js"></script>
        <script src="resources/js/jquery.tablesorter.min.js"></script>
        <script src="resources/js/jquery.tablesorter.pager.js"></script>
        <script src="resources/js/bootstrap.js"></script>
    </body>