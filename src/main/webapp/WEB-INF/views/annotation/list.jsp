<%-- 
    Document   : list
    Created on : Jun 29, 2016, 2:06:31 PM
    Author     : filip_000
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Museu WEB - Annotation</title>
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
                    Annotation 
                    <a type="button" class="btn btn-success btn-sm" data-toggle="modal" data-target="#modalAnnotation">
                        <span class="glyphicon glyphicon-plus"></span>
                    </a>
                    
                    <table class="table tablesorter table-striped sortable table-hover">
                        <thead>
                            <tr>
                                <th class="header">Id</th> 
                                <th class="header">Autor</th>
                                <th class="header">Title</th>      
                                <th class="header">Content</th> 
                                <th class="header" id="td-acoes">Ações</th>
                            </tr>
                        </thead>

                        <tbody>
                            <c:forEach var="ann" items="${lista}">
                                <tr>
                                    <td>
                                        ${ann.id}
                                    </td>
                                    <td>
                                        ${ann.author}
                                    </td>
                                    <td>
                                        ${ann.title}
                                    </td>
                                    <td>
                                        ${ann.content}  
                                    </td>                                                         
                                    <td>
                                        <a  class="btn btn-primary btn-sm" href="#" onclick="alterar('${ann.id}','${ann.author}','${ann.title}','${ann.content}')">
                                            <span class="glyphicon glyphicon-edit"></span></a>
                                        <a class="btn btn-danger btn-sm" onclick="href='actions/DeleteAnnotation/${ann.id}'"><span class="glyphicon glyphicon-trash"></span></a>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                    
                    <hr>
                    <a type="button"  class="btn btn-info " href='home'><span class="glyphicon glyphicon-circle-arrow-left"></span> Voltar</a>
                                
                </h3>
            </div>
        </div>
        <div class="col-lg-1"></div>
        
        <!--Start Modal-->
        <div id="modalAnnotation" class="modal fade in">
            <div class="modal-dialog">
                <div class="modal-content">
                    <form action="actions/SaveAnnotation" method="POST">
                        <div class="modal-header">
                            <button type="reset" class="close" data-dismiss="modal" aria-hidden="true">×</button> 
                            <h4>
                                <label>Annotation</label>
                            </h4>                    
                        </div>
                        <div class="modal-body">
                            <input type="hidden" name="id" id="id" value="0"/>

                            
                            <div class="form-group-sm">
                                <label>Autor</label>
                                <input class="span5 form-control " placeholder="Autor" type="text" id="autor" name="author" />
                            </div>    

                            
                            <div class="form-group-sm">
                                <label>Titulo</label>
                                <input class="span5 form-control " placeholder="Titulo" type="text" id="titulo" name="title" />
                            </div>
                            
                            
                            <div class="form-group-sm">
                                <label>Conteudo</label>
                                <textarea class="form-control " placeholder="Conteudo" type="text" id="conteudo" name="content" >
                                </textarea>
                            </div>  

                            <div class="form-group">
                                <label>Museum</label>
                                <select name="idMuseum" class="form-control">
                                    <c:forEach items="${museums}" var="item">
                                        <option value="${item.getId()}">${item.getName()}</option>
                                    </c:forEach>
                                </select>                       
                            </div>
                            
                            <div class="form-group">
                                <label>Object</label>
                                <select name="idObject" class="form-control">
                                    <c:forEach items="${objects}" var="item">
                                        <option value="${item.getId()}">${item.getName()}</option>
                                    </c:forEach>
                                </select>                       
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
         <script type="text/javascript">    
            function alterar(id, autor, title, content) 
            {
                $('#id').val(id);
                $('#autor').val(autor);
                $('#titulo').val(title);
                $('#conteudo').val(content);
            };
        </script>
    </body>
</html>
