<%@page import="model.Cliente"%>
<%@page import="model.DAO.ClienteDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Cadastro de Clientes</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="" />
        
        
        <!<!-- Link para funcionamento do frontend -->

        <link rel="stylesheet" href="../resources/styles.css">
        <link rel="stylesheet" href="../resources/reset.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-sRIl4kxILFvY47J16cr9ZwB07vP4J8+LH7qKQnuqkuIAvNWLzeN8tE5YBujZqJLB" crossorigin="anonymous">
        <link
          rel="canonical"
          href="https://getbootstrap.com/docs/5.3/examples/sidebars/"
        />
        <script src="../JS/color-modes.js"></script>
        <link href="../resources/bootstrap.min.css" rel="stylesheet" /> 
        <meta name="theme-color" content="#712cf9" />
        <link href="../resources/reset.css" rel="stylesheet" />
        <link href="../resources/estoque.css" rel="stylesheet" />
   

    </head>
    <body>
        <div class="container ">
            <h2>Cadastro de Clientes</h2>
            <div class="card">
                <div class="result-box">
                    <%
                        try {
                        
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

                            
                    %>
                            <h3 class="fs-3 card-title">Dados Enviados</h3>
                            <ul class="data-list card">
                                <li class="fs-5 card-title"><strong>Nome:</strong> <%= cli.getNome() %> <%= cli.getSobrenome() %></li>
                                <li class="fs-5 card-title"><strong>E-mail:</strong> <%= cli.getEmailComercial() %></li>
                                <li class="fs-5 card-title"><strong>Telefone:</strong> <%= cli.getTelefoneComercial() %></li>
                                <li class="fs-5 card-title"><strong>Função/Cargo:</strong> <%= cli.getFuncaoCargo() %></li>
                                <li class="fs-5 card-title"><strong>Departamento:</strong> <%= cli.getAreaFuncionalDepartamento() %></li>
                                <li class="fs-5 card-title"><strong>Organização:</strong> <%= cli.getNomeDeSuaOrganizacao() %></li>
                                <li class="fs-5 card-title"><strong>País/Região:</strong> <%= cli.getPaisRegiao() %></li>
                                <li class="fs-5 card-title"><strong>CEP:</strong> <%= cli.getCepCodigoPostal() %></li>
                                <li class="fs-5 card-title"><strong>Interesse:</strong> <%= cli.getInteressePrincipalProduto() %></li>
                            </ul>

                            <div>
                                <%
                                   
                                    ClienteDAO cliDAO = new ClienteDAO();
                                    if (cliDAO.cadastrar(cli)) {
                                %>
                                <p class="fs-5 card-title text-uppercase">✅ Cliente inserido com sucesso!</p><br>
                                         <a href="../"><button class="tab-button btn-glow btn-primary">Retornar</button></a>
                                <%
                                    } else {
                                %>
                                        <p class="fs-5 card-title text-uppercase">❌ Falha ao cadastrar cliente!</p><br>
                                        <a href="../index.html"><button class="tab-button btn-glow btn-primary">Retornar</button></a>

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
