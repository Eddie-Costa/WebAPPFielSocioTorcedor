<%-- 
    Document   : registrar
    Created on : 4 de out. de 2024, 15:25:35
    Author     : eddie
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.Socio"%>
<%@page import="model.dao.SocioDAO"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registro</title>
    </head>
    <body>
        <h1>Registro</h1>
        <%         
        //Entrada
        String nome = request.getParameter("nome");
        String data_nasc = request.getParameter("data");
        String cpf = request.getParameter("cpf");
        String telefone = request.getParameter("telefone");
        String email = request.getParameter("email");
        String senha = request.getParameter("senha");
        String plano = request.getParameter("plano");
        
        // Instância e atrib de valor
        Socio socio = new Socio();
        socio.setNome(nome);
        socio.setData_nasc(data_nasc);
        socio.setCpf(cpf);
        socio.setTelefone(telefone);
        socio.setEmail(email);
        socio.setSenha(senha);
        socio.setPlano(plano);
        
        SocioDAO socioDAO = new SocioDAO();
        if(socioDAO.insSocio(socio)){
            out.println("Registro inserido com sucesso!");
        }else{
            out.println("Erro! Registro não inserido!!!");
        }


        %>
    </body>
</html>