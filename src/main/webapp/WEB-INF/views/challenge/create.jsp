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
                    Challenge
                    <a type="button" class="btn btn-success btn-sm" data-toggle="modal" data-target="#modalAnswer">
                        <span class="glyphicon glyphicon-plus"></span>
                    </a>
                    <hr>
                </h3>
                
                
                <form action="actions/saveChallenge" method="POST">
                        
                    <input type="hidden" name="id" id="id" value="${challenge.getChallengeId()}" />

                    <label>Descrição</label>
                    <div class="form-group-sm">
                        <input class="span5 form-control " placeholder="Descrição" type="text" id="description" name="description" value="${challenge.getDescription()}"/>                                 
                    </div>    

                    <div class="btn-group" style="margin-top: 5px;">
                        <button type="submit" class="btn btn-primary"><span class="glyphicon glyphicon-check" ></span> Salvar</button>
                    </div>
                </form>
                    <c:set var="desc" value="${'#description'}"/>
                        <c:if test='${desc!=""}'>
                            <div class="form-group-sm">
                                <table class="table tablesorter table-striped sortable table- table-bordered" style="margin-top: 10px">
                                    <thead>
                                        <tr>
                                            <th class="header">Id</th> 
                                            <th class="header">Correto</th>
                                            <th class="header">Descrição</th>                           
                                            <th class="header" id="td-acoes">Ações</th>
                                        </tr>
                                    </thead>

                                    <tbody>
                                        
                                        <c:forEach var="ans" items="${challenge.getAnswers()}">
                                            <tr>
                                                <td>
                                                    ${ans.id}
                                                </td>
                                                <td>
                                                    ${ans.isCorrect()}
                                                </td>
                                                <td>
                                                    ${ans.description}  
                                                </td>                                                         
                                                <td>
                                                    <a  class="btn btn-primary btn-sm" href="#" onclick="alterar('${ans.id}','${ans.isCorrect()}','${ans.description}')">
                                                        <span class="glyphicon glyphicon-edit"></span></a>
                                                    <a class="btn btn-danger btn-sm" onclick="href='actions/removeAnswer/${ans.id}'"><span class="glyphicon glyphicon-trash"></span></a>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </div>     
                        
                            Adicionar
                            <div class="form-group-sm" >
                                <div class="col-sm-10">
                                    <select  class="span5 form-control col-sm-10" id ="answer" >
                                        <option value="-1">
                                                selecione;
                                        </option>
                                        <c:forEach var="ans" items="${allAnswers}">
                                            <option value="${ans.id}">
                                                ${ans.description};${ans.isCorrect()} 
                                            </option>
                                        </c:forEach>
                                    </select>
                                </div>
                                
                                <div class="col-sm-2">
                                    <a type="button" class="btn btn-success btn-sm" onclick="addAnswer()">
                                        <span class="glyphicon glyphicon-plus"></span>
                                    </a>
                                </div>
                            </div>
                            
                            <hr>
                     </c:if>  
                            <div class="btn-group">
                                <a type="button"  class="btn btn-danger " href='challenge'><span class="glyphicon glyphicon-remove"></span> Cancel</a>
                                
                            </div>
                       
                 
                
                
            </div>
        </div>
        
        
        
            
    <script src="resources/js/jquery-min.js"></script>
    <script src="resources/js/jquery.tablesorter.min.js"></script>
    <script src="resources/js/jquery.tablesorter.pager.js"></script>
    <script src="resources/js/bootstrap.js"></script>
    <script>
        window.onload = function(){
            var s = document.getElementsByTagName('SELECT')[0].options, 
                l = 0, 
                d = '';
            for(i = 0; i < s.length; i++){
              if(s[i].text.length > l) l = s[i].text.length; 
            }
            for(i = 0; i < s.length; i++){
              d = '';  
              line = s[i].text.split(';');
              l1 = (l - line[0].length);
              for(j = 0; j < l1; j++){
                d += '\u00a0'; 
              }
              s[i].text = line[0] + d + line[1];
            }  
          };
          
        var a;
        
        $('#answer').change( function(){
        a = $(this).find("option:selected").val();
        });
          
        function addAnswer()
        {
            window.location.href = "actions/addAnswer/" + a ;
        }
    
          
    </script>
    </body>
</html>
