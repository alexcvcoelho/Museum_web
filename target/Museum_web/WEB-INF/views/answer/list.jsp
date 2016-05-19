<%-- 
    Document   : list
    Created on : May 19, 2016, 5:27:15 PM
    Author     : filip_000
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Museu WEB</title>
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
                    Answer 
                    <button type="button" class="btn btn-success btn-sm" data-toggle="modal" data-target="#modalTheme">
                        <span class="glyphicon glyphicon-plus"></span>
                    </button>
                    <hr>
                </h3>

                <table class="table tablesorter table-striped sortable table-hover">
                    <thead>
                        <tr>
                            <th class="header">Correto</th>
                            <th class="header">Descrição</th>                           
                            <th class="header" id="td-acoes">Ações</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="cliente" items="">
                            <tr>
                                <td></td>
                                <td></td>                                                         
                                <td>
                                    <button type="button" class="btn btn-primary btn-sm">
                                        <span class="glyphicon glyphicon-edit"></span></button>
                                    <button type="button" class="btn btn-danger btn-sm"><span class="glyphicon glyphicon-trash"></span></button>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
        <div class="col-lg-1"></div>
        
        <!--Start Modal-->
        <div id="modalTheme" class="modal fade in">
            <div class="modal-dialog">
                <div class="modal-content">
                    <form action="actions/SaveAnswer" method="POST">
                        <div class="modal-header">
                            <button type="reset" class="close" data-dismiss="modal" aria-hidden="true">×</button> 
                            <h4>
                                <label>Answer</label>
                            </h4>                    
                        </div>
                        <div class="modal-body">
                            <input type="hidden" name="id" id="input-id" value="0"/>

                            <label>Correto</label>
                            <div class="form-group-sm">
                                <input class="span5 form-control " placeholder="false" type="checkbox" name="description" />                                         
                            </div>	

                            <label>Descrição</label>
                            <div class="form-group-sm">
                                <input class="span5 form-control " placeholder="Descrição" type="text" name="description" />   
                                 
                                
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
    </body>
</html>
