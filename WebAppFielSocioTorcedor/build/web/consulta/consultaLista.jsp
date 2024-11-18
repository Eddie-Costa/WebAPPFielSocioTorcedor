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
    </head>
    <body>
        <%                  
        
            //Select "Lista"

            PesquisaSatisfacaoDAO pesqDAO = new PesquisaSatisfacaoDAO();
            
            List<PesquisaSatisfacao> lista = new ArrayList<>();
            lista = pesqDAO.consPesqLista();
            
            int n_reg = 0 ;
            out.println("<br><br> <img src='../imagens/logo.jpg' alt=''/>");
            out.println("<br> <b>Pesquisa de Satisfação - Registros</b>");
            
            for( int i = 0; i <= lista.size()-1; i++){            
                out.println("<br><br> #: " + i);                
                out.println("<br> Data: " + lista.get(i).getDt());
                out.println("<br> <b>Nome:</b> " + lista.get(i).getNome());
                out.println("<br> E-mail: " + lista.get(i).getEmail());
                out.println("<br> Questão 1: " + lista.get(i).getQ1());
                out.println("<br> Questão 2: " + lista.get(i).getQ2());
                out.println("<br> Questão 3: " + lista.get(i).getQ3());
                out.println("<br> Questão 4: " + lista.get(i).getQ4());                            
                n_reg++;                           
            }
            out.println("<br><br> <b>Registros: </b>" + n_reg + "<br>");
           out.println("<br><br> <b> Legenda:</b> <br> <img src='../imagens/escala.jpg' alt=''/>");

        
        %>
    </body>
</html>
