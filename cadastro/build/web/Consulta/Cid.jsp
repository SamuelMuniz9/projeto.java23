<%@page import="model.Cliente"%>
<%@page import="model.DAO.ClienteDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/styles.css">
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Consulta por ID</title>
    </head>
    <body>
        <h2>Consulta de Cliente por ID</h2>

        <form method="post">
            <label>ID do Cliente:</label>
            <input type="number" name="id" required>
            <button type="submit">Consultar</button>
        </form>

        <%
            String paramId = request.getParameter("id");
            if (paramId != null) {
                try {
                    int id = Integer.parseInt(paramId);
                    ClienteDAO dao = new ClienteDAO();
                    Cliente cli = dao.consultaPorId(id);

                    if (cli != null) {
                        out.println("<br><b>Cliente encontrado:</b><br>");
                        out.println("ID: " + cli.getId() + "<br>");
                        out.println("Nome: " + cli.getNome() + " " + cli.getSobrenome() + "<br>");
                        out.println("Email: " + cli.getEmailComercial() + "<br>");
                        out.println("Telefone: " + cli.getTelefoneComercial() + "<br>");
                        out.println("Função/Cargo: " + cli.getFuncaoCargo() + "<br>");
                        out.println("Departamento: " + cli.getAreaFuncionalDepartamento() + "<br>");
                        out.println("Organização: " + cli.getNomeDeSuaOrganizacao() + "<br>");
                        out.println("País: " + cli.getPaisRegiao() + "<br>");
                        out.println("CEP: " + cli.getCepCodigoPostal() + "<br>");
                        out.println("Interesse: " + cli.getInteressePrincipalProduto() + "<br>");
                    } else {
                        out.println("<br>Nenhum cliente encontrado com esse ID.");
                    }

                } catch (NumberFormatException e) {
                    out.println("<br>ID inválido.");
                }
            }
        %>
    </body>
</html>