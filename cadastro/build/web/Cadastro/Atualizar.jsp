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

        <form method="post" class="form-atualizar">
            <div class="form-group">
                <label>ID do Cliente:</label>
                <input type="number" name="id" required>
            </div>

            <div class="form-group">
                <label>Nome:</label>
                <input type="text" name="nome" required>
            </div>

            <div class="form-group">
                <label>Sobrenome:</label>
                <input type="text" name="sobrenome" required>
            </div>

            <div class="form-group">
                <label>E-mail Comercial:</label>
                <input type="email" name="emailComercial" required>
            </div>

            <div class="form-group">
                <label>Telefone Comercial:</label>
                <input type="text" name="telefoneComercial" required>
            </div>

            <div class="form-group">
                <label>Função / Cargo:</label>
                <input type="text" name="funcaoCargo" required>
            </div>

            <div class="form-group">
                <label>Área / Departamento:</label>
                <input type="text" name="areaFuncionalDepartamento" required>
            </div>

            <div class="form-group">
                <label>Nome da Organização:</label>
                <input type="text" name="nomeDeSuaOrganizacao" required>
            </div>

            <div class="form-group">
                <label>País / Região:</label>
                <input type="text" name="paisRegiao" required>
            </div>

            <div class="form-group">
                <label>CEP / Código Postal:</label>
                <input type="text" name="cepCodigoPostal" required>
            </div>

            <div class="form-group">
                <label>Interesse Principal / Produto:</label>
                <input type="text" name="interessePrincipalProduto" required>
            </div>

            <div class="form-actions">
                <button type="submit" class="btn">Atualizar Cliente</button>
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
                            out.println("<p class='success'>✅ Cliente atualizado com sucesso!</p>");
                        } else {
                            out.println("<p class='error'>❌ Falha ao atualizar cliente.</p>");
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
