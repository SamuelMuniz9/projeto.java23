<%@page import="model.Cliente"%>
<%@page import="model.DAO.ClienteDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/styles.css">
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Atualizar Cliente</title>
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
    <div class="container">
        <h2>Atualizar Cliente</h2>

        <form method="post" class="form-atualizar row g-3">
            <div class="form-group">
                <label>ID do Cliente:</label>
                <input type="number" name="id" required>
            </div>
           <div class="col-md-6">
             <label for="nome" class="form-label">Nome</label>
             <input type="text" class="form-control" id="nome" name="nome" required>
           </div>

           <div class="col-md-6">
             <label for="sobrenome" class="form-label">Sobrenome</label>
             <input type="text" class="form-control" name="sobrenome" id="sobrenome" required>
           </div>


           <div class="col-12">
             <label for="emailComercial" class="form-label">E-mail Comercial</label>
             <input type="email" name="emailComercial" id="emailComercial" class="form-control" placeholder="exemplo@email.com" required>
           </div>

           <div class="col-12">
             <label  for="telefoneComercial" class="form-label">Telefone Comercial</label>
             <input type="text" class="form-control" placeholder="11 00000-0000" name="telefoneComercial" id="telefoneComercial"  required>
           </div>

           <div class="col-md-6">
             <label for="funcaoCargo" class="form-label">Função / Cargo</label>
             <input type="text" class="form-control" name="funcaoCargo" id="funcaoCargo"  required>
           </div>

           <div class="col-md-6">
             <label for="areaFuncionalDepartamento" class="form-label">Área / Departamento</label>
             <input type="text" class="form-control" id="areaFuncionalDepartamento" name="areaFuncionalDepartamento" required>
           </div>

                                  
           <div class="col-md-4">
             <label for="nomeDeSuaOrganizacao" class="form-label">Nome da Organização</label>
             <input type="text" class="form-control" id="nomeDeSuaOrganizacao" name="nomeDeSuaOrganizacao" required>
           </div>

                                  
           <div class="col-md-4">
             <label for="paisRegiao" class="form-label">País / Região</label>
             <input type="text" class="form-control" id="paisRegiao"  name="paisRegiao"  required>
           </div>

                                  
           <div class="col-md-4">
             <label for="cepCodigoPostal" class="form-label">CEP</label>
             <input type="text" class="form-control" id="cepCodigoPostal" name="cepCodigoPostal" required>
           </div>

                                  
           <div class="col-md-12">
             <label  for="interessePrincipalProduto" class="form-label">interesse</label>
             <input type="text" class="form-control" id="interessePrincipalProduto" name="interessePrincipalProduto" required>
           </div>
                              
           <!--botao-->
           <div class="form actions col-12">
                <button type="submit" class="btn btn-success">Atualizar Cliente</button>    
                <a href="../"><p class="btn btn-secondary" >Retornar</p></a>
           </div>



        </form>

        <div class="status-message">
            <%
                String paramId = request.getParameter("id");
                if (paramId != null) {
                    try {
                        Cliente cli = new Cliente();
                        cli.setId(Integer.parseInt(paramId));
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

                        ClienteDAO dao = new ClienteDAO();
                        if (dao.atualizar(cli)) {
                            out.println("<p class='fs-5 card-title text-uppercase'>✅ Cliente atualizado com sucesso!</p>");
                        } else {
                            out.println("<p class='fs-5 card-title text-uppercase'>❌ Falha ao atualizar cliente.</p>");
                        }

                    } catch (Exception e) {
                        out.println("<p class='error'>Erro: " + e.getMessage() + "</p>");
                    }
                }
            %>
        </div>
    </div>
</body>
</html>
