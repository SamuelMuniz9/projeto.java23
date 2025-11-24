<%@page import="model.Cliente"%>
<%@page import="model.DAO.ClienteDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/styles.css">
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Atualizar Cliente</title>
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
