<%@page import="model.Cliente"%>
<%@page import="model.DAO.ClienteDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Cadastro de Clientes</title>
        <link rel="stylesheet" href="resources/styles.css">

    </head>
    <body>
        <div class="container ">
            <h2>Cadastro de Clientes</h2>
            <div class="card">
                <div class="result-box">
                    <%
                        try {
                            // Criar objeto Cliente e setar parâmetros do formulário
                            Cliente cli = new Cliente();

                            cli.setNome(request.getParameter("nome"));
                            cli.setSobrenome(request.getParameter("sobrenome"));
                            cli.setEmailComercial(request.getParameter("emailComercial"));
                            cli.setTelefoneComercial(request.getParameter("telefoneComercial"));
                            cli.setFuncaoCargo(request.getParameter("funcaoCargo"));
                            cli.setAreaFuncionalDepartamento(request.getParameter("areaFuncionalDepartamento"));
                            cli.setNomeDeSuaOrganizacao(request.getParameter("nomeDeSuaOrganizacao"));
                            cli.setPaisRegiao(request.getParameter("paisRegiao"));
                            cli.setCepCodigoPostal(request.getParameter("cepCodigoPostal"));
                            cli.setInteressePrincipalProduto(request.getParameter("interessePrincipalProduto"));

                            // Mostrar dados enviados
                    %>
                            <h3>Dados Enviados</h3>
                            <ul class="data-list">
                                <li><strong>Nome:</strong> <%= cli.getNome() %> <%= cli.getSobrenome() %></li>
                                <li><strong>E-mail:</strong> <%= cli.getEmailComercial() %></li>
                                <li><strong>Telefone:</strong> <%= cli.getTelefoneComercial() %></li>
                                <li><strong>Função/Cargo:</strong> <%= cli.getFuncaoCargo() %></li>
                                <li><strong>Departamento:</strong> <%= cli.getAreaFuncionalDepartamento() %></li>
                                <li><strong>Organização:</strong> <%= cli.getNomeDeSuaOrganizacao() %></li>
                                <li><strong>País/Região:</strong> <%= cli.getPaisRegiao() %></li>
                                <li><strong>CEP:</strong> <%= cli.getCepCodigoPostal() %></li>
                                <li><strong>Interesse:</strong> <%= cli.getInteressePrincipalProduto() %></li>
                            </ul>

                            <div class="status-message">
                                <%
                                    // Salvar no banco
                                    ClienteDAO cliDAO = new ClienteDAO();
                                    if (cliDAO.cadastrar(cli)) {
                                %>
                                        <p class="success">✅ Cliente inserido com sucesso!</p>
                                <%
                                    } else {
                                %>
                                        <p class="error">❌ Falha ao cadastrar cliente!</p>
                                <%
                                    }
                                %>
                            </div>
                    <%
                        } catch (Exception e) {
                    %>
                            <p class="error"><strong>Erro:</strong> <%= e.getMessage() %></p>
                    <%
                        }
                    %>
                </div>
            </div>
        </div>
    </body>
</html>
