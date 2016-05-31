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
            <div class="panel">
                <h3>
                    Museum
                    <button type="button" class="btn btn-success btn-sm" data-toggle="modal" data-target="#modalMuseum">
                        <span class="glyphicon glyphicon-plus"></span>
                    </button>
                    <hr>
                </h3>

                <table class="table tablesorter table-striped sortable table-hover">
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
        <div class="col-lg-1"></div>
        <!--Start Modal-->
        <div id="modalMuseum" class="modal fade in">
            <div class="modal-dialog">
                <div class="modal-content">
                    <form action="actions/SaveMuseum" method="POST" role="form">
                        <div class="modal-header">
                            <button type="reset" class="close" data-dismiss="modal" aria-hidden="true">×</button> 
                            <h4>
                                <label>Museu</label>
                            </h4>                    
                        </div>
                        <div class="modal-body">
                            <input type="hidden" name="id" id="input-id" value="0"/>                                                     	
                            <div class="form-group">
                                <label>Nome</label>
                                <input type="text" class="form-control" name="name" placeholder="Nome do museu"/>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <div class="btn-group">
                                <button type="reset" class="btn btn-danger btn-modal" data-dismiss="modal"><span class="glyphicon glyphicon-remove"></span> Cancelar</button>
                                <button type="submit" class="btn btn-primary btn-modal"><span class="glyphicon glyphicon-check"></span> Salvar</button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>

        <script src="resources/js/jquery-min.js"></script>
        <script src="resources/js/jquery.tablesorter.min.js"></script>
        <script src="resources/js/jquery.tablesorter.pager.js"></script>
        <script src="resources/js/bootstrap.js"></script>
    </body>