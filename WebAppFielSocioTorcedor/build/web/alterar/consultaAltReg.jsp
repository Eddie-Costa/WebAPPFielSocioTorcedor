<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.PesquisaSatisfacao"%>
<%@page import="model.dao.PesquisaSatisfacaoDAO"%>
<%@page import="java.text.*"%>
<%@page import="java.util.Date"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="EstiloAlterar2.css">
        <title>Alterar (Consulta)</title>
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
        String email = request.getParameter("email");
            
        // Instância e atrib de valor
        PesquisaSatisfacao pesq = new PesquisaSatisfacao();
        pesq.setEmail(email);
        
         //Select
        PesquisaSatisfacaoDAO pesqDAO = new PesquisaSatisfacaoDAO();
        if(pesqDAO.consPesqEmail(pesq) != null){
                out.println("<h2>Pesquisa de Satisfação</h2> <br>");
        %>
        <div class="form-container">
            <form name="frmPesq" method="post" action="updatePesq.jsp">
                <p>Protocolo:</p>
                <input type="text" name="protocolo" value="<%= pesq.getProtocolo()%>" readonly="true">
                <p>Nome:</p> 
                <input type="text" name="nome" value="<%= pesq.getNome() %>">
                <p>E-mail:</p>
                <input type="email" name="email" value="<%= pesq.getEmail()%>">                
                <p>1. Como você classifica nosso Sistema?</p>
                <input type="text" name="r1" value="<%= pesq.getQ1()%>"><p>
                <p>2. 2. O quão necessario são as funções do site?</p> 
                <input type="text" name="r2" value="<%= pesq.getQ2()%>"><p>             
                <p>3. A interação com o site foi fácil?</p>
                <input type="text" name="r3" value="<%= pesq.getQ3()%>"><p>                         
                <p>4. Você recomendaria nossa empresa para outro cliente?</p>
                <input type="text" name="r4" value="<%= pesq.getQ4()%>"><p> 
                <p>Data da Pesquisa:</p> 
                <input type="date" name="dt_pesq" value="<%= pesq.getDt() %>"><p> 
                <input type="submit" value="Salvar">
            </form>                 
        </div>
        <%        
                                                
        }else{
            out.println("Registro não encontrado!!!");
        }        
        %>
    </body>
</html>
