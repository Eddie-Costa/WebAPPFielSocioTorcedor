<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.PesquisaSatisfacao"%>
<%@page import="model.dao.PesquisaSatisfacaoDAO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="EstiloConsultaTabela.css">
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
        <main>
            <%        
            PesquisaSatisfacaoDAO pesqDAO = new PesquisaSatisfacaoDAO();
            
            List<PesquisaSatisfacao> lista = new ArrayList<>();
            lista = pesqDAO.consPesqLista();
            
            int n_reg = 0 ;
            out.println("<br> <b>Pesquisa de Satisfação - Registros</b>");
            %>

            <!-- HTML -->
            <table border="1">
                    <tr>
                        <th>#</th>
                        <th>Protocolo</th>
                        <th>Data</th>
                        <th>Nome</th>
                        <th>E-mail</th>
                        <th>Resp. 1</th>
                        <th>Resp. 2</th>
                        <th>Resp. 3</th>
                        <th>Resp. 4</th>
                    </tr>            
            <%
               for( int i = 0; i <= lista.size()-1; i++){  
            %>                                                        
                    <tr>
                        <td><%= i+1%></td>
                        <td><%= lista.get(i).getProtocolo() %></td>
                        <td><%= lista.get(i).getDt()%></td>
                        <td><%= lista.get(i).getNome()%></td>
                        <td><%= lista.get(i).getEmail()%></td>
                        <td><%= lista.get(i).getQ1()%></td>
                        <td><%= lista.get(i).getQ2()%></td>
                        <td><%= lista.get(i).getQ3()%></td>
                        <td><%= lista.get(i).getQ4()%></td>
                    </tr>                
            <%
                   n_reg++;                           
               }
            %>
             </table>
            <%
                out.println("<br><br> <b>Registros: </b>" + n_reg + "<br>");      
            %>
        </main>
    </body>
</html>
