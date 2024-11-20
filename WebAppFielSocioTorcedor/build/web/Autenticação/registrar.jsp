<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.Socio"%>
<%@page import="model.dao.SocioDAO"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="EstiloRegistrar.css">
        <title>Registro</title>
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
    </body>
</html>