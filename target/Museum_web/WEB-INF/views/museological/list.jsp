<%-- 
    Document   : list
    Created on : 02/06/2016, 16:33:20
    Author     : Alex
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html ng-app>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Museological</title>
        <link href="resources/css/bootstrap.min.css" rel="stylesheet"> 
        <link href="resources/css/table-sorter.css" rel="stylesheet"> 
        <link href="resources/css/tablesorter.pager.css" rel="stylesheet">  
        <link href="resources/css/dataTables.bootstrap.css" rel="stylesheet"> 
    </head>
    <body>
        <div class="col-lg-1"></div>
        <div class="col-lg-10 div-branca">
            <div class="panel">
                <h3>
                    Museological
                    <button type="button" class="btn btn-success btn-sm" data-toggle="modal" data-target="#modal">
                        <span class="glyphicon glyphicon-plus"></span>
                    </button>
                    <hr>
                </h3>
                <table class="table tablesorter table-striped sortable table-hover">
                    <thead>
                        <tr>
                            <th class="header">Id</th>  
                            <th class="header">Nome</th>
                            <th class="header">Data</th>
                            <th class="header">Tipo</th>
                            <th class="header" id="td-acoes">Ações</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="item" items="${list}">
                            <tr>
                                <td>${item.id}</td>
                                <td>${item.name}</td>
                                <td>${sdf.format(item.date.getTime())}</td>
                                <td>${item.objectType ? 'Texto':'Imagem'}</td>
                                <td>
                                    <button type="button" class="btn btn-primary btn-sm"  href="#" onclick="alterar('${item.id}', '${item.name}', '${sdf.format(item.date.getTime())}', '${item.objectType}');">
                                        <span class="glyphicon glyphicon-edit" ></span></button>
                                    <a type="button" class="btn btn-danger btn-sm" href="actions/deleteMuseological?id=${item.id}"><span class="glyphicon glyphicon-trash"></span></a>
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

        <div id="modal" class="modal fade in">
            <div class="modal-dialog">
                <div class="modal-content">
                    <form action="actions/saveMuseological" method="POST">
                        <div class="modal-header">
                            <button type="reset" class="close" data-dismiss="modal" aria-hidden="true">×</button> 
                            <h4>
                                <label>Museological</label>
                            </h4>                    
        <!--Start Modal-->
                        </div>
                        <div class="modal-body">
                            <input type="hidden" name="id" id="id" value="0"/>                           
                            <label>Nome</label>
                            <div class="form-group-sm">
                                <input class="form-control " placeholder="Nome" required="true" type="text" id="name" name="name"  maxlength="80"/>                                        
                            </div>
                            <label>Data</label>
                            <div class="form-group-sm">
                                <input class="span5 form-control " required="true" placeholder="Data" type="text" id="date" name="dateText" />                                        
                            </div> 
                            <label>Tipo</label>
                            <div class="form-group-sm">
                                <label><input id="img" type="radio" name="objectType" value="0" class="type" checked="" onclick="imagem()"/> Imagem</label>
                                <label><input id='txt' type="radio" name="objectType" value="1" class="type" onclick="texto()"/> Texto</label>
                            </div> 
                            <div id="divtype" class="form-group-sm">
                                <input class='form-control' type='text' placeholder='URL' name='urlAddress' />
                            </div>
                        </div>
                        <div class="modal-footer">
                            <div class="btn-group">
                                <button type="reset" class="btn btn-danger btn-modal" data-dismiss="modal"><span class="glyphicon glyphicon-remove"></span> Cancel</button>
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
        <script type="text/javascript">
                                    function alterar(id, name, date, type)
                                    {
                                        $('#id').val(id);
                                        $('#name').val(name);
                                        $('#date').val(date);
                                        if (type === "true") {
                                            $('#txt').prop('checked', true);
                                            texto();
                                        } else {
                                            $('#img').prop('checked', true);
                                            imagem();
                                        }
                                        $('#modal').modal('show');
                                    }
                                    ;
                                    function imagem() {
                                        $('#divtype').html("<input class='form-control' type='text' placeholder='URL' name='urlAddress' />");
                                    }
                                    ;
                                    function texto() {
                                        $('#divtype').html("<textarea class='form-control' name='text' placeholder='Texto'></textarea>");
                                    }
                                    ;

        </script>

    </body>
</html>
