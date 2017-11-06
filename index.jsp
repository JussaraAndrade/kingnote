<%@ page contentType="text/html" %>
<%@ page pageEncoding="UTF-8" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="pt-br">

    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Notas - KingNote</title>
        <link href="assets/css/bootstrap.min.css" rel="stylesheet">
        <link href="assets/css/custom.css" rel="stylesheet">
        <link href="assets/css/ie10-viewport-bug-workaround.css" rel="stylesheet">
        <!--[if lt IE 9]><script src="assets/js/ie8-responsive-file-warning.js"></script><![endif]-->
        <script src="assets/js/ie-emulation-modes-warning.js"></script>
        <!--[if lt IE 9]>
            <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
            <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
          <![endif]-->
        <link rel="icon" type="image/ico" sizes="32x32" href="assets/img/logo/Modelo4.3.png">
    </head>

    <body>


        <nav class="navbar navbar-inverse navbar-static-top">
            <div class="container">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false"
                            aria-controls="navbar">
                        <span class="sr-only">Alterar navegação</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" href="index.jsp"><img src="assets/img/logo/Modelo4.3.png" alt="#"></a>
                </div>
                <div id="navbar" class="navbar-collapse collapse">
                    <ul class="nav navbar-nav">
                        <li class="active"><a href="index.jsp">Notas<span class="sr-only">(current)</span></a></li>
                        <!-- 
                        <li><a href="lembretes.html">Lembretes<span class="sr-only">(current)</span></a></li>
                        <li><a href="pesquisa.html">Pesquisa</a></li> 
                        -->
                        <li><a href="sobre.jsp">Sobre</a></li>

                    </ul>
                </div>
            </div>
        </nav>

        <!-- INICIO CONTEUDO -->
        <div class="container">
            <div class="page-header">
                <h1>Notas</h1>
            </div>

            <div class="row">

                <div class="col-md-3" id="notepad">
                    <form action="KingNoteServlet" method="POST" >
                        <input type="hidden" name="operacao" value="cad"/>
                        <div class="row" id="top">
                            <input type="text" name="title" id="title" autocomplete="off" onkeyup="noteChanged()" onfocus="$(this).css('backgroundPosition', '0 -29px')"
                                   onblur="$(this).css('backgroundPosition', '0 0')" style="background-position: 0px 0px;">
                            <div id="note-buttons">
                                <button class="btn btn-success btn-md" type="submit" onclick= "validar()"  title="Salvar" >
                                    <span class="glyphicon glyphicon-floppy-disk"></span> 
                                </button>
                                
                                <!-- VALIDAÇÃO DIFICULDADE EM CHAMAR NO CAMPO JÁ CRIADO  (WEB/ASSETS/ALERT.JS)   -->
                                <script>
                                     function validar() {
                                        alert('Por favor, digite o titulo da nota.'); 
                                       
                                    }

                                </script>
                                
                                
                            </div>
                             
                        </div>
                        <div class="row" id="body-container">
                            <div class="col-md-12">
                                <textarea id="body" name="text" onkeyup="noteChanged()" style="height: 250px;"></textarea>
                            </div>
                        </div>
                    </form>
                </div>

                <c:if test="${sessionScope.kingnote.getNotes() != null}">
                    <c:forEach items="${sessionScope.kingnote.getNotes()}" var="note">
                        <div class="col-md-3" id="notepad">
                            <div class="row" id="top">
                                <input type="hidden" id="noteId" value="${note.getId()}" />
                                <input type="text" name="title" id="title" autocomplete="off" value="${note.getTitle()}" onkeyup="noteChanged()" onfocus="$(this).css('backgroundPosition', '0 -29px')"onblur="$(this).css('backgroundPosition', '0 0')" style="background-position: 0px 0px;" >
                                <div id="note-buttons">
                                    <a href="saveNota.jsp?id=" title="Salvar"  class="btn btn-success btn-md" > <span class="glyphicon glyphicon-floppy-disk" ></span>   </a>
                                    <a href="addLembrete.jsp?id=" title="Lembrete"class="btn btn-default btn-md"> <span class="glyphicon glyphicon-time"></span>          </a>
                                    <a href="addCategoria.jsp?id=" title="Categoria" class="btn btn-warning btn-md" > <span class="glyphicon glyphicon-tags"></span>          </a>
                                    <a href="delNota.jsp?id=" title="Excluir" class="btn btn-danger btn-md"> <span class="glyphicon glyphicon-trash"></span>        </a>
                                </div>
                            </div>
                            <div class="row" id="body-container">
                                <div class="col-md-12">
                                    <textarea id="body" onkeyup="noteChanged()" style="height: 250px;">${note.getText()}</textarea>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </c:if>
                <c:if test="${sessionScope.kingnote.getNotes() == null}">
                    Não há notas a exibir
                </c:if>
            </div>
            <br>
            <br>

           <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><footer>  
    <hr class="featurette-divider">
        <center><h4>&copy; KingNote </h4></center>
    </footer>

            <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
            <script src="assets/js/bootstrap.min.js"></script>
    </body>

</html>
