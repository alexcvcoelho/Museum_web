<%-- 
    Document   : create
    Created on : Jun 17, 2016, 3:33:49 PM
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
                    Answer 
                    <a type="button" class="btn btn-success btn-sm" data-toggle="modal" data-target="#modalAnswer">
                        <span class="glyphicon glyphicon-plus"></span>
                    </a>
                    <hr>
                </h3>
                
                
                <form action="actions/SaveChallenge" method="POST">
                        
                            <input type="hidden" name="id" id="id" value="0"/>

                            <label>Correto</label>
                            <div class="form-group-sm">
                                <input class="span5 form-control " placeholder="false" type="checkbox" id ="correct" name="correct" />                                         
                            </div>	

                            <label>Descrição</label>
                            <div class="form-group-sm">
                                <input class="span5 form-control " placeholder="Descrição" type="text" id="description" name="description" />   
                                 
                                
                            </div>                           	

                        
                       
                            <div class="btn-group">
                                <button type="button"  class="btn btn-danger btn-modal" data-dismiss="modal"><span class="glyphicon glyphicon-remove"></span> Cancel</button>
                                <button type="submit" class="btn btn-primary btn-modal"><span class="glyphicon glyphicon-check"></span> Salvar</button>
                            </div>
                       
                    </form>
                
                
            </div>
        </div>
        
        <div class="col-lg-1"></div>
        <div id="modalAnswer" class="modal fade in">
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
                            <input type="hidden" name="id" id="id" value="0"/>

                            <label>Correto</label>
                            <div class="form-group-sm">
                                <input class="span5 form-control " placeholder="false" type="checkbox" id ="correct" name="correct" />                                         
                            </div>	

                            <label>Descrição</label>
                            <div class="form-group-sm">
                                <input class="span5 form-control " placeholder="Descrição" type="text" id="description" name="description" />   
                                 
                                
                            </div>                           	

                        </div>
                        <div class="modal-footer">
                            <div class="btn-group">
                                <button type="button"  class="btn btn-danger btn-modal" data-dismiss="modal"><span class="glyphicon glyphicon-remove"></span> Cancel</button>
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
