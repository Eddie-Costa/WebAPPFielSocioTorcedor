<%-- 
    Document   : consultaReg
    Created on : 30 de out. de 2024, 21:25:47
    Author     : alunocmc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.PesquisaSatisfacao"%>
<%@page import="model.dao.PesquisaSatisfacaoDAO"%>
<%@page import="java.text.*"%>
<%@page import="java.util.Date"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Alterar (Consulta)</title>
    </head>
    <body>
        <%
        //Entrada/Receber
        String email = request.getParameter("email");
            
        // Instância e atrib de valor
        PesquisaSatisfacao pesq = new PesquisaSatisfacao();
        pesq.setEmail(email);
        
         //Select
        PesquisaSatisfacaoDAO pesqDAO = new PesquisaSatisfacaoDAO();
        if(pesqDAO.consPesqEmail(pesq) != null){
                out.println("<h2>Pesquisa de Satisfação</h2> <br>");
        %>                          
        <form name="frmPesq" method="post" action="updatePesq.jsp">
            Protocolo: <input type="text" name="protocolo" value="<%= pesq.getProtocolo()%>" readonly="true"> <p>
            Nome: <input type="text" name="nome" value="<%= pesq.getNome() %>" minlength="3" maxlength="10"> <p>
            E-mail: <input type="email" name="email" value="<%= pesq.getEmail()%>"> <p>                
            1. Como você classifica nosso atendimento? 
            <input type="text" name="r1" value="<%= pesq.getQ1()%>"><p>
            2. Como você avalia a pontualidade do técnico que lhe atendeu? 
            <input type="text" name="r2" value="<%= pesq.getQ2()%>"><p>             
            3. Como você avalia o tempo de atendimento?
            <input type="text" name="r3" value="<%= pesq.getQ3()%>"><p>                         
            4. Você recomendaria nossa empresa para outro cliente?
            <input type="text" name="r4" value="<%= pesq.getQ4()%>"><p> 
            Data da Pesquisa: 
            <input type="date" name="dt_pesq" value="<%= pesq.getDt() %>"><p> 
            <input type="submit" value="Salvar">
        </form>                 
        <%        
                out.println("<br><br> <b> Legenda:</b> <br> <img src='../imagens/escala.jpg' alt=''/>");                             
        }else{
               out.println("Registro não encontrado!!!");
        }        
        %>
    </body>
</html>
