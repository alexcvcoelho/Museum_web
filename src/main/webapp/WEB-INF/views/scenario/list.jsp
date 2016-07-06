<%-- 
    Document   : list
    Created on : 20/06/2016, 13:40:21
    Author     : Alex
--%>

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
        <div class="col-lg-1"></div>
        <div class="container-fluid col-xs-10">
            <h3>
                Scenario
                <button type="button" class="btn btn-success btn-sm" id="novo">
                    <span class="glyphicon glyphicon-plus"></span>
                </button>
                <hr>
            </h3>
            <div id="form" style="${sc.getId() == null ? "display: none" : ""}">
                <form method="POST" action="actions/saveScenario" role="form">
                    <input type="hidden" name="id" id="id" value="${sc.getId() == null ? "0":sc.getId()}"/> 
                    <div class="form-group">
                        <label>Nome</label>
                        <input type="text" class="form-control" name="name" id="name" placeholder="Nome do cenário" value="${sc.getName() == "" ? "":sc.getName()}"/>
                    </div>
                    <div class="form-group">
                        <label>Museum</label>
                        <select name="idMuseum" class="form-control">
                            <c:forEach items="${museums}" var="item">
                                <option value="${item.getId()}" ${sc.getIdMuseum() == item.getId() ? "selected":""}>${item.getName()}</option>
                            </c:forEach>
                        </select>                       
                    </div>                    
                    <div class="form-group">
                        <label>Theme</label>
                        <select name="idTheme" class="form-control">
                            <c:forEach items="${themes}" var="item">
                                <option value="${item.getId()}" ${sc.getTheme().getId() == item.getId() ? "selected" : ""}>${item.getTitle()}</option>
                            </c:forEach>
                        </select>
                    </div>
                    <div class="form-group">
                        <div class="col-lg-6">
                            <label>Challenges</label>
                            <ul class="list-group">
                                <c:forEach items="${challenges}" var="item">
                                    <label class="list-group-item"><input ${ch.contains(item)} type="checkbox" name="Challenge" value="${item.getChallengeId()}"/> ${item.getDescription()}</label>
                                    </c:forEach>
                            </ul>
                        </div>
                        <div class="col-lg-6">
                            <label>Objects</label>
                            <ul class="list-group">
                                <c:forEach items="${objects}" var="item">
                                    <label class="list-group-item"><input ${ob.contains(item) ? "checked" : ""} type="checkbox" name="Object" value="${item.getId()}"/> ${item.getName()}</label>
                                    </c:forEach>
                            </ul>
                        </div>
                    </div>
                    <button type="submit" class="btn btn-success">Salvar</button>
                </form>
            </div>
            <table class="table tablesorter table-striped sortable table-hover">
                <thead>
                    <tr> 
                        <th class="header">Id</th>
                        <th class="header">Name</th>
                        <th class="header">Museum</th>
                        <th class="header">Theme</th>
                        <th class="header">Ações</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${scenarios}" var="item">
                        <tr>
                            <td>${item.getId()}</td>
                            <td>${item.getName()}</td>
                            <td>${item.getIdMuseum()}</td>
                            <td>${item.getTheme().getTitle()}</td>
                            <td>
                                <a href="actions/editScenario?id=${item.getId()}&idTheme=${item.getTheme().getId()}" class="btn btn-primary btn-sm"><i class="glyphicon glyphicon-edit"></i></a>
                                <a type="button" class="btn btn-danger btn-sm" href="actions/deleteScenario?id=${item.getId()}"><span class="glyphicon glyphicon-trash"></span></a>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
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
        $(document).ready(function () {
            $('#novo').click(function () {
                $('#form').toggle('slow');
            });
        });
    </script>
</body>