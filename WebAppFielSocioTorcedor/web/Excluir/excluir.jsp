<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.PesquisaSatisfacao"%>
<%@page import="model.dao.PesquisaSatisfacaoDAO"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
        //Entrada/Receber
        int protocolo = Integer.parseInt( request.getParameter("protocolo") );
            
        // Instância e atrib de valor
        PesquisaSatisfacao pesq = new PesquisaSatisfacao();
        pesq.setProtocolo(protocolo);
        
         //Select
        PesquisaSatisfacaoDAO pesqDAO = new PesquisaSatisfacaoDAO();
        if(pesqDAO.exPesqId(pesq)){
            out.println("<br> <b>Registro excluído com sucesso!</b> <br>");
        }else{
            out.println("Registro não excluído!!!");
        }

        
        %>
    </body>
</html>
