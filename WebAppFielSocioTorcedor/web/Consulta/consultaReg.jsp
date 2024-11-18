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
        String nome = request.getParameter("nome");
            
        // Instância e atrib de valor
        PesquisaSatisfacao pesq = new PesquisaSatisfacao();
        pesq.setNome(nome);
        
         //Select
        PesquisaSatisfacaoDAO pesqDAO = new PesquisaSatisfacaoDAO();
        if(pesqDAO.consPesqReg(pesq) != null){
                out.println("<br> <b>Pesquisa de Satisfação</b> <br>");
                out.println("<br> Data: " + pesq.getDt());
                out.println("<br> Nome: " + pesq.getNome());
                out.println("<br> E-mail: " + pesq.getEmail());
                out.println("<br> Questão 1: " + pesq.getQ1());
                out.println("<br> Questão 2: " + pesq.getQ2());
                out.println("<br> Questão 3: " + pesq.getQ3());
                out.println("<br> Questão 4: " + pesq.getQ4());                                                     
        }else{
               out.println("Registro não encontrado!!!");
        }

        
        %>
    </body>
</html>
