<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.PesquisaSatisfacao"%>
<%@page import="model.dao.PesquisaSatisfacaoDAO"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="EstiloExcluir2.css">
        <title>JSP Page</title>
    </head>
    <body>
        <header>
            <nav>
                <a href="../index.html"><img src="../assets/2000.png" alt="" class="homebtn"/></a>
                <ul class="nav-list">
                    <li><a href="../Autenticação/IndexRegistro.html">Registrar</a></li>
                    <li><a href="../PesquisaSatisfacao/IndexPesquisa.html">Pesquisa</a></li>
                    <li><a href="../consulta/IndexConsulta.html">Consultar(Nome)</a></li>
                    <li><a href="../consultaId/IndexConsultaId.html">Consultar(Email)</a></li>
                    <li><a href="../ConsultaTabela/ConsultaTab.jsp">Consultar(Tabela)</a></li>
                    <li><a href="../Excluir/IndexExcluir.html">Excluir</a></li>
                    <li><a href="../alterar/IndexAlterar.html">Alterar</a></li>
                </ul>
            </nav>
        </header>
        <%
        //Entrada/Receber
        int protocolo = Integer.parseInt( request.getParameter("protocolo") );
            
        // Instância e atrib de valor
        PesquisaSatisfacao pesq = new PesquisaSatisfacao();
        pesq.setProtocolo(protocolo);
        
        
        PesquisaSatisfacaoDAO pesqDAO = new PesquisaSatisfacaoDAO();
        if(pesqDAO.exPesqId(pesq)){
            out.println("<br> <b>Registro excluído com sucesso!</b> <br>");
        }else{
            out.println("Registro não excluído!!!");
        }

        
        %>
    </body>
</html>
