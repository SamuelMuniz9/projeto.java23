<%-- 
    Document   : produtoListar
    Created on : 23 de nov. de 2025, 12:37:23
    Author     : gta98
--%>

<%@page import="java.util.List"%>
<%@page import="model.DAO.ProdutosDAO"%>
<%@page import="model.Produtos"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <title>Lista de Produtos</title>
    <meta charset="UTF-8">
</head>

<body>

    <h1>Lista de Produtos</h1>

    <a href="produtoCadastrar.jsp">+ Cadastrar Novo Produto</a>

    <br><br>

    <table border="1" cellpadding="8">
        <tr>
            <th>ID</th>
            <th>Nome</th>
            <th>Categoria</th>
            <th>Preço Venda</th>
            <th>Preço Custo</th>
            <th>Unidade</th>
            <th>Ações</th>
        </tr>

        <%
            ProdutosDAO dao = new ProdutosDAO();
            List<Produtos> lista = dao.listar();

            for (Produtos p : lista) {
        %>

        <tr>
            <td><%= p.getId_produto() %></td>
            <td><%= p.getNome() %></td>
            <td><%= p.getCategoria() %></td>
            <td>R$ <%= p.getPreco_venda() %></td>
            <td>R$ <%= p.getPreco_custo() %></td>
            <td><%= p.getUnidade_medida() %></td>

            <td>
                <a href="produtoEditar.jsp?id=<%= p.getId_produto() %>">Editar</a> |
                <a href="produtoExcluir.jsp?id=<%= p.getId_produto() %>" onclick="return confirm('Tem certeza que deseja excluir?')">Excluir</a>
            </td>
        </tr>

        <% } %>

    </table>

</body>
</html>
