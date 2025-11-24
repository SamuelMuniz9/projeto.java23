<%@page import="model.Cliente"%>
<%@page import="model.DAO.ClienteDAO"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/styles.css">
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Consulta por Nome</title>
    </head>
    <body>
        <h2>Consulta de Cliente por Nome</h2>

        <form method="post">
            <label>Nome do Cliente:</label>
            <input type="text" name="nome" required>
            <button type="submit">Consultar</button>
        </form>

        <%
          String paramNome = request.getParameter("nome");

if (paramNome != null && paramNome.trim().length() > 0) {

    ClienteDAO dao = new ClienteDAO();
    List<Cliente> lista = dao.consultaPorNome(paramNome);

    if (!lista.isEmpty()) {
        out.println("<br><b>Clientes encontrados:</b><br>");

        for (Cliente cli : lista) {
            out.println("<hr>");
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
        }

    } else {
        out.println("<br>Nenhum cliente encontrado com esse nome.");
    }
}

        %>
    </body>
</html>